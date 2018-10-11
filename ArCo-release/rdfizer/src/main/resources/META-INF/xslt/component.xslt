<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl"
	xmlns:arco-fn="http://w3id.org/arco/saxon-extension" xmlns:arco="https://w3id.org/arco/core/"
	xmlns:identifier="https://w3id.org/arco/identifier/" xmlns:arco-event="https://w3id.org/arco/culturalevent/"
	xmlns:cataloguerecord="https://w3id.org/arco/catalogue/"
	xmlns:cpdescription="https://w3id.org/arco/objective/" xmlns:cis="http://dati.beniculturali.it/cis/"
	xmlns:l0="https://w3id.org/italia/onto/l0/" xmlns:clvapit="https://w3id.org/italia/onto/CLV/"
	xmlns:tiapit="https://w3id.org/italia/onto/TI/" xmlns:roapit="https://w3id.org/italia/onto/RO/"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:dcterms="http://purl.org/dc/terms/creator"
	xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:frbr="http://purl.org/vocab/frbr/core#"
	xmlns:locgeoamm="https://w3id.org/arco/location/"
	xmlns:culturaldefinition="https://w3id.org/arco/subjective/"
	exclude-result-prefixes="xsl php">

	<xsl:output method="xml" encoding="utf-8" indent="yes" />
	<xsl:param name="item" />
	
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
	
	<xsl:variable name="objectOfDescription">
		<xsl:choose>
			<xsl:when test="schede/*/OG/OGT/OGTP">
				<xsl:value-of select="$culturalPropertyComponent" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$culturalProperty" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="sheetVersion" select="schede/*/@version"></xsl:variable>
	<xsl:variable name="sheetType" select="name(schede/*)"></xsl:variable>
	<xsl:variable name="cp-name" select="''"></xsl:variable>
	
	<!-- xsl:import href="part.xsl" / -->
	
	<xsl:template match="/">

		<xsl:variable name="ogtp"
			select="normalize-space(schede/*/OG/OGT/OGTP)" />


		<!-- variable ogtt -->
		<xsl:variable name="ogtt">
			<xsl:choose>
				<xsl:when test="schede/*/OG/OGT/OGTT">
					<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTT)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- variable sgta -->
		<xsl:variable name="sgta">
			<xsl:choose>
				<xsl:when test="schede/*/OG/SGT/SGTA">
					<xsl:value-of select="normalize-space(schede/*/OG/SGT/SGTA)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- variable sgti -->
		<xsl:variable name="sgti">
			<xsl:choose>
				<xsl:when test="schede/*/OG/SGT/SGTI">
					<xsl:value-of select="normalize-space(schede/*/OG/SGT/SGTI)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<rdf:RDF>

			<xsl:if test="schede/*/OG/OGT/OGTP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$culturalProperty" />
					</xsl:attribute>
					<arco:hasCulturalPropertyComponent>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalPropertyComponent" />
						</xsl:attribute>
					</arco:hasCulturalPropertyComponent>
				</rdf:Description>

				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$culturalPropertyComponent" />
					</xsl:attribute>

					<rdf:type rdf:resource="https://w3id.org/arco/core/CulturalPropertyComponent" />

					<arco:isCulturalPropertyComponentOf>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="$culturalProperty" />
						</xsl:attribute>
					</arco:isCulturalPropertyComponentOf>

					<!-- labels of cultural property -->

					<!-- SMO -->
					<!-- la virgola tra ogtd e ogtv viene inserita nella variabile ogtv perché 
						c'è sempre se c'è ogtv. Invece, nella label si mettono le parentesi solo 
						se c'è o sgta o sgti, mentre si mette la virgola tra sgta e sgti solo se 
						ci sono entrambi -->
					<xsl:if test="$sheetType='SMO'">


						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTV))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="schede/*/OG/SGT/SGTA and schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgta, ', ', $sgti, ' (', normalize-space(schede/*/OG/OGT/OGTD), $ogtv, ')')" />
									</xsl:when>
									<xsl:when test="schede/*/OG/SGT/SGTA or schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgta, $sgti, ' (', normalize-space(schede/*/OG/OGT/OGTD), $ogtv, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), $ogtv)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
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
								<xsl:when test="schede/*/OG/OGD/OGDN">
									<xsl:value-of
										select="concat(normalize-space(schede/*/OG/OGD/OGDN), ' (')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTV))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtw">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTW">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTW))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtp">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTP">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTP))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="schede/*/OG/OGD/OGDN">
										<xsl:value-of
											select="concat($ogdn, normalize-space(schede/*/OG/OGT/OGTD), $ogtv, $ogtw, $ogtp, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), $ogtv, $ogtw, $ogtp)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
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
								<xsl:when test="schede/*/OG/OGT/OGTN">
									<xsl:value-of
										select="concat(normalize-space(schede/*/OG/OGT/OGTN), ' (')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtt">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTT">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTT))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="schede/*/OG/OGT/OGTN">
										<xsl:value-of
											select="concat($ogtn, normalize-space(schede/*/OG/OGT/OGTD), $ogtt, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), $ogtt)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
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
								<xsl:when test="schede/*/OG/OGT/OGTT">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTT))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtn">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTN">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTN))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="sgti">
							<xsl:choose>
								<xsl:when test="schede/*/OG/SGT/SGTI">
									<xsl:value-of select="normalize-space(schede/*/OG/SGT/SGTI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgti, ' (', normalize-space(schede/*/OG/OGT/OGTD), $ogtt, $ogtn, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), $ogtt, $ogtn)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
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
								<xsl:when test="schede/*/OG/SGT/SGTT">
									<xsl:value-of select="normalize-space(schede/*/OG/SGT/SGTT)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="sgti">
							<xsl:choose>
								<xsl:when test="schede/*/OG/SGT/SGTI">
									<xsl:value-of select="normalize-space(schede/*/OG/SGT/SGTI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtt">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTT">
									<xsl:value-of
										select="concat(' - ', normalize-space(schede/*/OG/OGT/OGTT))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTV))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="schede/*/OG/SGT/SGTT and schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, ', ', $sgti, ' (', normalize-space(schede/*/OG/OGT/OGTD), $ogtt, $ogtv, ')')" />
									</xsl:when>
									<xsl:when test="schede/*/OG/SGT/SGTT or schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, $sgti, ' (', normalize-space(schede/*/OG/OGT/OGTD), $ogtt, $ogtv, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), $ogtt, $ogtv)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- F -->
					<!-- Le parentesi le mettiamo nella label, ci sono sempre perché sia 
						sgti sia ogtd sono obbligatori. Le virgole tra ogtd ogtv ogtw ogtp le mettiamo 
						nelle tre variabili perché ci sono sempre se ci sono quegli elementi -->
					<xsl:if test="$sheetType='F'">
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTV))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtw">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTW">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTW))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTV))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:value-of
								select="concat(normalize-space(schede/*/SG/SGT/SGTI), ' (', normalize-space(schede/*/OG/OGT/OGTD), $ogtv, $ogtw, ' - ', $ogtp, ')')" />
						</rdfs:label>
					</xsl:if>


					<!-- SAS -->
					<xsl:if test="$sheetType='SAS'">
						<rdfs:label>
							<xsl:value-of
								select="concat(normalize-space(schede/*/OG/OGT/OGTD), ' - ', $ogtp)" />
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
								<xsl:when test="schede/*/OG/OGT/OGTN">
									<xsl:value-of
										select="concat(normalize-space(schede/*/OG/OGT/OGTN), ' (')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtc">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTC">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTC))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="schede/*/OG/OGT/OGTN">
										<xsl:value-of
											select="concat($ogtn, normalize-space(schede/*/OG/OGT/OGTD), $ogtc, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), $ogtc)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
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
								<xsl:when test="schede/*/OG/OGT/OGTM">
									<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTM)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtp">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTP">
									<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTP)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="schede/*/OG/OGT/OGTM and schede/*/OG/OGT/OGTP">
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), ', ', normalize-space(schede/*/OG/OGT/OGTT), ' (', $ogtm, ', ', $ogtp, ')')" />
									</xsl:when>
									<xsl:when test="schede/*/OG/OGT/OGTM or schede/*/OG/OGT/OGTP">
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), ', ', normalize-space(schede/*/OG/OGT/OGTT), ' (', $ogtm, $ogtp, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), ', ', normalize-space(schede/*/OG/OGT/OGTT))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- TMA -->

					<xsl:if test="$sheetType='TMA'">
						<rdfs:label>
						<xsl:variable name="tmpLabel">
							<xsl:value-of
								select="concat(normalize-space(schede/*/OG/OGT/OGTD), ' (', normalize-space(schede/*/OG/OGT/OGTM), ')')" />
						</xsl:variable>
						<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>

					<!-- NU -->
					<!-- sia virgola tra ogtt e ogth sia parentesi sono inserite nel choose 
						della label perché la virgola c'è solo se ci sono entrambe le variabili, 
						le parentesi solo se ce ne sono entrambe o una delle due -->
					<xsl:if test="$sheetType='NU'">

						<xsl:variable name="ogth">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTH">
									<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTH)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>


						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="schede/*/OG/OGT/OGTT and schede/*/OG/OGT/OGTH">
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), ' (', $ogtt, ', ', $ogth, ')')" />
									</xsl:when>
									<xsl:when test="schede/*/OG/OGT/OGTT or schede/*/OG/OGT/OGTH">
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), ' (', $ogtt, $ogth, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTD)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- OAC -->
					<!-- nella label si mettono le parentesi solo se c'è o sgta o sgti, 
						mentre si mette la virgola tra sgta e sgti solo se ci sono entrambi -->

					<xsl:if test="$sheetType='OAC'">
						<xsl:variable name="sgtt">
							<xsl:choose>
								<xsl:when test="schede/*/OG/SGT/SGTT">
									<xsl:value-of select="normalize-space(schede/*/OG/SGT/SGTT)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="sgti">
							<xsl:choose>
								<xsl:when test="schede/*/OG/SGT/SGTI">
									<xsl:value-of select="normalize-space(schede/*/OG/SGT/SGTI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>


						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="schede/*/OG/SGT/SGTT and schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, ', ', $sgti, ' (', normalize-space(schede/*/OG/OGT/OGTD), ')')" />
									</xsl:when>
									<xsl:when test="schede/*/OG/SGT/SGTT or schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, $sgti, ' (', normalize-space(schede/*/OG/OGT/OGTD), ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTD)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>

					<!-- D or MI or S -->
					<!-- la virgola tra ogtd e ogtv viene inserita nella variabile ogtv 
						perché c'è sempre se c'è ogtv. Invece, nella label si mettono le parentesi 
						solo se c'è o sgta o sgti, mentre si mette la virgola tra sgta e sgti solo 
						se ci sono entrambi -->

					<xsl:if test="$sheetType='D' or $sheetType='MI' or $sheetType='S'">
						<xsl:variable name="sgtt">
							<xsl:choose>
								<xsl:when test="schede/*/OG/SGT/SGTT">
									<xsl:value-of select="normalize-space(schede/*/OG/SGT/SGTT)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="sgti">
							<xsl:choose>
								<xsl:when test="schede/*/OG/SGT/SGTI">
									<xsl:value-of select="normalize-space(schede/*/OG/SGT/SGTI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTV))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="schede/*/OG/SGT/SGTT and schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, ', ', $sgti, ' (', normalize-space(schede/*/OG/OGT/OGTD), $ogtv, ')')" />
									</xsl:when>
									<xsl:when test="schede/*/OG/SGT/SGTT or schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, $sgti, ' (', normalize-space(schede/*/OG/OGT/OGTD), $ogtv, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), $ogtv)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
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
								<xsl:when test="schede/*/OG/OGT/OGTN">
									<xsl:value-of
										select="concat(normalize-space(schede/*/OG/OGT/OGTN), ' (')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtc">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTC">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTC))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtf">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTF">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTF))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtg">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTG">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTG))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="schede/*/OG/OGT/OGTN">
										<xsl:value-of
											select="concat($ogtn, normalize-space(schede/*/OG/OGT/OGTD), $ogtc, $ogtf, $ogtg, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), $ogtc, $ogtf, $ogtg)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
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
							<xsl:when test="$sheetVersion='3.00_ICCD0' or $sheetVersion='3.00'">
								<xsl:variable name="ogtn">
									<xsl:choose>
										<xsl:when test="schede/*/OG/OGT/OGTN">
											<xsl:value-of
												select="concat(normalize-space(schede/*/OG/OGT/OGTN), ' (')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="ogtq">
									<xsl:choose>
										<xsl:when test="schede/*/OG/OGT/OGTQ">
											<xsl:value-of
												select="concat(', ', normalize-space(schede/*/OG/OGT/OGTQ))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>

								<rdfs:label>
									<xsl:variable name="tmpLabel">
										<xsl:choose>
											<xsl:when test="schede/*/OG/OGT/OGTN">
												<xsl:value-of
													select="concat($ogtn, normalize-space(schede/*/OG/OGT/OGTD), $ogtq, ')')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat(normalize-space(schede/*/OG/OGT/OGTD), $ogtq)" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
								</rdfs:label>
							</xsl:when>
							<xsl:otherwise>
								<!-- la parentesi di chiusura è inserita nel choose della label perché c'è solo se c'è $ogtd; 
						la parentesi di apertura è nella variabile $ogtd perché c'è solo se c'è $ogtd; la virgola tra OGTT e $ogtq è nella variabile
						$ogtq perché c'è sempre se c'è ogtq -->
								<xsl:variable name="ogtd">
									<xsl:choose>
										<xsl:when test="schede/*/OG/OGT/OGTD">
											<xsl:value-of select="concat(normalize-space(schede/*/OG/OGT/OGTD), ' (')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="ogtq">
									<xsl:choose>
										<xsl:when test="schede/*/OG/OGT/OGTQ">
											<xsl:value-of select="concat(', ', normalize-space(schede/*/OG/OGT/OGTQ))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>


								<rdfs:label>
									<xsl:variable name="tmpLabel">
										<xsl:choose>
											<xsl:when test="schede/*/OG/OGT/OGTD">
												<xsl:value-of
										select="concat($ogtd, normalize-space(schede/*/OG/OGT/OGTT), $ogtq, ')')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat(normalize-space(schede/*/OG/OGT/OGTT), $ogtq)" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
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
								<xsl:when test="schede/*/OG/OGT/OGTQ">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTQ))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogad">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGA/OGAD">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGA/OGAD))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:value-of
								select="concat(normalize-space(schede/*/OG/OGT/OGTN), ' (', normalize-space(schede/*/OG/OGT/OGTD), $ogtq, ')', $ogad, ' - ', $ogtp)" />
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
									<xsl:when test="schede/*/DB/DBL">
									<!-- si usa il for-each perché DBL è ripetitivo -->
										<xsl:for-each select="schede/*/DB/DBL">
											<xsl:value-of select="concat(', ', normalize-space(.))" />
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
										select="concat(normalize-space(schede/*/DB/DBD), $dbl, ' (', normalize-space(schede/*/DB/DBC), ')')" />
								</xsl:variable>
								<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
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
										<xsl:when test="schede/*/OG/OGD/OGDN">
											<xsl:value-of
												select="concat(normalize-space(schede/*/OG/OGT/OGDN), ' (')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>

								<rdfs:label>
									<xsl:variable name="tmpLabel">
										<xsl:choose>
											<xsl:when test="schede/*/OG/OGD/OGDN">
												<xsl:value-of
													select="concat($ogdn, normalize-space(schede/*/OG/OGT/OGTD), ', ', normalize-space(schede/*/OG/CTG), ')')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat(normalize-space(schede/*/OG/OGT/OGTD), ', ', normalize-space(schede/*/OG/CTG))" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
								</rdfs:label>

							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>


					<!-- BDM -->
					<xsl:if test="$sheetType='BDM'">
						<xsl:choose>
							<xsl:when test="$sheetVersion='2.00_ICCD0' or $sheetVersion='2.00'">
								<!-- la virgola tra ogtd o ogtt e ogtg viene inserita nella variabile 
									ogtg perché c'è sempre se c'è ogtv. La virgola tra ogtd e ogtt viene inserita 
									nella variabile ogtt perché c'è sempre se c'è ogtt. Invece, nella label si 
									mettono le parentesi solo se c'è o sgta o sgti, mentre si mette la virgola 
									tra sgta e sgti solo se ci sono entrambi -->
								<xsl:variable name="sgtt">
									<xsl:choose>
										<xsl:when test="schede/*/OG/SGT/SGTT">
											<xsl:value-of select="normalize-space(schede/*/OG/SGT/SGTT)" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="sgti">
									<xsl:choose>
										<xsl:when test="schede/*/OG/SGT/SGTI">
											<xsl:value-of select="normalize-space(schede/*/OG/SGT/SGTI)" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="ogtt">
									<xsl:choose>
										<xsl:when test="schede/*/OG/OGT/OGTT">
											<xsl:value-of
												select="concat(', ', normalize-space(schede/*/OG/OGT/OGTT))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="ogtg">
									<xsl:choose>
										<xsl:when test="schede/*/OG/OGT/OGTG">
											<xsl:value-of
												select="concat(', ', normalize-space(schede/*/OG/OGT/OGTG))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>

								<rdfs:label>
									<xsl:variable name="tmpLabel">
										<xsl:choose>
											<xsl:when test="schede/*/OG/SGT/SGTT and schede/*/OG/SGT/SGTI">
												<xsl:value-of
													select="concat($sgtt, ', ', $sgti, ' (', normalize-space(schede/*/OG/OGT/OGTD), $ogtt, $ogtg, ')')" />
											</xsl:when>
											<xsl:when test="schede/*/OG/SGT/SGTT or schede/*/OG/SGT/SGTI">
												<xsl:value-of
													select="concat($sgtt, $sgti, ' (', normalize-space(schede/*/OG/OGT/OGTD), $ogtt, $ogtg, ')')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat(normalize-space(schede/*/OG/OGT/OGTD), $ogtt, $ogtg)" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
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
										<xsl:when test="schede/*/OG/OGD/OGDN">
											<xsl:value-of
												select="concat(normalize-space(schede/*/OG/OGT/OGDN), ' (')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="ogtt">
									<xsl:choose>
										<xsl:when test="schede/*/OG/OGT/OGTT">
											<xsl:value-of
												select="concat(', ', normalize-space(schede/*/OG/OGT/OGTT))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="ctg">
									<xsl:choose>
										<xsl:when test="schede/*/OG/CTG">
											<xsl:value-of
												select="concat(', ', normalize-space(schede/*/OG/CTG))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="''" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>

								<rdfs:label>
									<xsl:variable name="tmpLabel">
										<xsl:choose>
											<xsl:when test="schede/*/OG/OGD/OGDN">
												<xsl:value-of
													select="concat($ogdn, normalize-space(schede/*/OG/OGT/OGTD), $ogtt, $ctg, ')')" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat(normalize-space(schede/*/OG/OGT/OGTD), $ogtt, $ctg)" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
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
								<xsl:when test="schede/*/SB/NBN/NBNA">
									<xsl:value-of
										select="concat(normalize-space(schede/*/SB/NBN/NBNA), ' - ')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogte">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTE">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTE))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtc">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTC">
									<xsl:value-of
										select="concat(', ', normalize-space(schede/*/OG/OGT/OGTC))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:value-of
								select="concat($nbna, normalize-space(schede/*/OG/OGT/OGTD), $ogte, $ogtc, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>

					<!-- BNM or BNPE or BNZ or E -->
					<!-- le parentesi vengono inserite nella variabile ogtv perché ci sono 
						solo se c'è ogtv -->
					<xsl:if
						test="$sheetType='BNPE' or $sheetType='BNM' or $sheetType='BNZ' or $sheetType='E'">
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTV">
									<xsl:value-of
										select="concat(' (', normalize-space(schede/*/OG/OGT/OGTV), ')')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label>
							<xsl:value-of
								select="concat(normalize-space(schede/*/OG/OGT/OGTD), $ogtv, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- BNP -->
					<!-- sia virgola tra ogtt e ogtv sia parentesi sono inserite nel choose 
						della label perché la virgola c'è solo se ci sono entrambe le variabili, 
						le parentesi solo se ce ne sono entrambe o una delle due -->
					<xsl:if test="$sheetType='BNP'">
						<xsl:variable name="ogtt">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTT">
									<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTT)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtv">
							<xsl:choose>
								<xsl:when test="schede/*/OG/OGT/OGTV">
									<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTV)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>


						<rdfs:label>
							<xsl:variable name="tmpLabel">
								<xsl:choose>
									<xsl:when test="schede/*/OG/OGT/OGTT and schede/*/OG/OGT/OGTV">
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), ' (', $ogtt, ', ', $ogtv, ')')" />
									</xsl:when>
									<xsl:when test="schede/*/OG/OGT/OGTT or schede/*/OG/OGT/OGTV">
										<xsl:value-of
											select="concat(normalize-space(schede/*/OG/OGT/OGTD), ' (', $ogtt, $ogtv, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTD)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:value-of select="concat($tmpLabel, ' - ', $ogtp)" />
						</rdfs:label>
					</xsl:if>


					<!-- FF -->
					<!-- in attesa di indicazioni da Chiara Veninata -->
				</rdf:Description>

			</xsl:if>

			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$objectOfDescription" />
				</xsl:attribute>



				<xsl:if test="schede/*/LC">
					<locgeoamm:hasTimeIndexedQualifiedLocation>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-current')" />
	                        </xsl:attribute>
					</locgeoamm:hasTimeIndexedQualifiedLocation>
				</xsl:if>
				<xsl:for-each select="schede/*/LA | schede/F/LR">
					<locgeoamm:hasTimeIndexedQualifiedLocation>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-alternative-', position())" />
	                        </xsl:attribute>
					</locgeoamm:hasTimeIndexedQualifiedLocation>
				</xsl:for-each>
				<xsl:if test="schede/*/LC/PVC/*">
					<locgeoamm:hasCulturalPropertyAddress>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(schede/*/LC/PVC), normalize-space(schede/*/LC/PVL), normalize-space(schede/*/LC/LDC/LDCU)))))" />
	                        </xsl:attribute>
					</locgeoamm:hasCulturalPropertyAddress>
				</xsl:if>
				<!-- has number of components -->
				<xsl:if
					test="schede/*/OG/QNT/QNTN or schede/*/OG/QNT/QNTI or schede/*/OG/QNT/QNTS">
					<arco:hasNumberOfComponents>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'NumberOfComponents/', $itemURI, '-quantity')" />
	                        </xsl:attribute>
					</arco:hasNumberOfComponents>
				</xsl:if>
				<!-- cultural property description -->
				<xsl:if test="schede/*/DA/DES">
					<xsl:choose>
						<xsl:when test="schede/*/DA/DES/*">
							<xsl:if
								test="not(lower-case(normalize-space(schede/*/DA/DES/DESO))='nr' or lower-case(normalize-space(schede/*/DA/DES/DESO))='n.r.' or lower-case(normalize-space(schede/*/DA/DES/DESO))='nr (recupero pregresso)')">
								<arco:description>
									<xsl:value-of select="normalize-space(schede/*/DA/DES/DESO)" />
								</arco:description>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<arco:description>
								<xsl:value-of select="normalize-space(schede/*/DA/DES)" />
							</arco:description>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<!-- fruition (VeAC) -->
				<xsl:if test="schede/*/AU/FRU">
					<xsl:for-each select="schede/*/AU/FRU">
						<culturaldefinition:hasFruition>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'Fruition/', $itemURI, '-', position())" />
	                			</xsl:attribute>
						</culturaldefinition:hasFruition>
					</xsl:for-each>
				</xsl:if>
				<!-- authorship attribution -->
				<xsl:for-each select="schede/*/AU/ATB">
					<culturaldefinition:hasAuthorshipAttribution>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'CulturalScopeAttribution/', $itemURI, '-cultural-scope-attribution-', position())" />
	                        </xsl:attribute>
					</culturaldefinition:hasAuthorshipAttribution>
				</xsl:for-each>
				<xsl:for-each select="schede/*/AU/AAT">
					<culturaldefinition:hasAuthorshipAttribution>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'AlternativeAuthorshipAttribution/', $itemURI, '-', position())" />
	                        </xsl:attribute>
					</culturaldefinition:hasAuthorshipAttribution>
				</xsl:for-each>
				<xsl:for-each select="schede/*/AU/AUT | schede/F/AU/AUF">
				<xsl:choose>
					<xsl:when test="not(./AUTW) or ./AUTW='intero bene'">
						<culturaldefinition:hasAuthorshipAttribution>
							<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
								select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
		                        </xsl:attribute>
						</culturaldefinition:hasAuthorshipAttribution>
						<arco:hasAuthor>
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
						</arco:hasAuthor>
					</xsl:when>
					<xsl:otherwise>
					<xsl:for-each select="./AUTW">
							<arco:hasPart>
								<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
									select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
							</arco:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:for-each>
				
				<!-- inventory -->
				<xsl:for-each select="schede/*/UB/INV">
					<xsl:if test="./*">
						<culturaldefinition:hasInventory>
							<xsl:attribute name="rdf:resource">
		                			<xsl:value-of
								select="concat($NS, 'Inventory/', $itemURI, '-', position())" />
		                		</xsl:attribute>
						</culturaldefinition:hasInventory>
					</xsl:if>
				</xsl:for-each>
				<!-- commission -->
				<xsl:for-each select="schede/*/AU/CMM">
					<cpdescription:hasCommission>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'Commission/', $itemURI, '-', position())" />
	                        </xsl:attribute>
					</cpdescription:hasCommission>
				</xsl:for-each>
				<xsl:for-each select="schede/*/AU/EDT">
					<xsl:if test="./EDTN">
						<culturaldefinition:hasEdition>
							<xsl:attribute name="rdf:resource">
	                                <xsl:choose>
	                                    <xsl:when test="./EDTE and ./EDTL">
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
						</culturaldefinition:hasEdition>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="schede/*/DT">
					<xsl:choose>
						<xsl:when test="./* and (not(./DTP) or ./DTP='intero bene')">
							<cpdescription:hasDating>
								<xsl:attribute name="rdf:resource">
			                            <xsl:value-of
									select="concat($NS, 'Dating/', $itemURI, '-', position())" />
			                        </xsl:attribute>
							</cpdescription:hasDating>
						</xsl:when>
						<xsl:otherwise>
						<xsl:for-each select="./DTP">
								<arco:hasPart>
									<xsl:attribute name="rdf:resource">
				                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				                	</xsl:attribute>
								</arco:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- member of collection -->
				<xsl:for-each select="schede/*/UB/COL">
					<xsl:if test="./*">
						<culturaldefinition:isMemberOfCollection>
							<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
								select="concat($NS, 'CollectionMembership/', $itemURI, '-collection-membership-', position())" />
		                        </xsl:attribute>
						</culturaldefinition:isMemberOfCollection>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="schede/*/CO/STC">
				<xsl:choose>
					<xsl:when test="./* and (not(./STCP) or ./STCP='intero bene')">
						<cpdescription:hasConservationStatus>
							<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
								select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
		                        </xsl:attribute>
						</cpdescription:hasConservationStatus>
					</xsl:when>
					<xsl:otherwise>
					<xsl:for-each select="./STCP">
							<arco:hasPart>
								<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
									select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
							</arco:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:for-each>
				<xsl:if test="schede/*/CO/STP">
					<cpdescription:proposedIntervention>
						<xsl:value-of select="normalize-space(schede/*/CO/STP)" />
					</cpdescription:proposedIntervention>
				</xsl:if>
				<xsl:if test="schede/*/CO/STD">
					<cpdescription:storageConditions>
						<xsl:value-of select="normalize-space(schede/*/CO/STD)" />
					</cpdescription:storageConditions>
				</xsl:if>
				<!-- heritage protection agency -->
				<xsl:if test="schede/*/CD/ECP">
					<arco:hasAgentRole>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
	                        </xsl:attribute>
					</arco:hasAgentRole>
					<arco:hasHeritageProtectionAgency>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CD/ECP)))" />
	                        </xsl:attribute>
					</arco:hasHeritageProtectionAgency>
				</xsl:if>
				<!-- cataloguing agency -->
				<xsl:if test="schede/*/CD/ESC">
					<arco:hasAgentRole>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-cataloguing-agency')" />
	                        </xsl:attribute>
					</arco:hasAgentRole>
					<arco:hasCataloguingAgency>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CD/ESC)))" />
	                        </xsl:attribute>
					</arco:hasCataloguingAgency>
				</xsl:if>
				<!-- proponent agency -->
				<xsl:if test="schede/*/CD/EPR">
					<arco:hasAgentRole>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-proponent-agency')" />
	                        </xsl:attribute>
					</arco:hasAgentRole>
					<arco:hasProponentAgency>
						<xsl:attribute name="rdf:resource">
	                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CD/EPR)))" />
	                        </xsl:attribute>
					</arco:hasProponentAgency>
				</xsl:if>
				<!-- Type of context for LC -->
				<xsl:for-each select="schede/*/LC/PVZ">
					<locgeoamm:hasTypeOfContext>
						<xsl:attribute name="rdf:resource">
	                            <xsl:choose>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto urbano'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/location/Urban'" />
	                                </xsl:when>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto suburbano'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/location/Suburban'" />
	                                </xsl:when>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto territoriale'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/location/Territorial'" />
	                                </xsl:when>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto subacqueo'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/location/Underwater'" />
	                                </xsl:when>
	                                <xsl:otherwise>
	                                    <xsl:value-of
							select="concat($NS, 'TypeOfContext/', arco-fn:urify(normalize-space(.)))" />
	                                </xsl:otherwise>
	                            </xsl:choose>
	                        </xsl:attribute>
					</locgeoamm:hasTypeOfContext>
				</xsl:for-each>
				<!-- Type of context for LA -->
				<xsl:for-each select="schede/*/LA/PRZ">
					<locgeoamm:hasTypeOfContext>
						<xsl:attribute name="rdf:resource">
	                            <xsl:choose>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto urbano'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/location/Urban'" />
	                                </xsl:when>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto suburbano'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/location/Suburban'" />
	                                </xsl:when>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto territoriale'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/location/Territorial'" />
	                                </xsl:when>
	                                <xsl:when
							test="lower-case(normalize-space(.)) = 'contesto subacqueo'">
	                                    <xsl:value-of
							select="'https://w3id.org/arco/location/Underwater'" />
	                                </xsl:when>
	                                <xsl:otherwise>
	                                    <xsl:value-of
							select="concat($NS, 'TypeOfContext/', arco-fn:urify(normalize-space(.)))" />
	                                </xsl:otherwise>
	                            </xsl:choose>
	                        </xsl:attribute>
					</locgeoamm:hasTypeOfContext>
				</xsl:for-each>
				<!-- Acquisition of cultural property -->
				<xsl:for-each select="schede/*/TU/ACQ">
					<culturaldefinition:hasAcquisition>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'Acquisition/', $itemURI, '-acquisition-', position())" />
	                		</xsl:attribute>
					</culturaldefinition:hasAcquisition>
				</xsl:for-each>
				<!-- Change of availability of cultural property -->
				<xsl:for-each select="schede/*/TU/ALN">
					<culturaldefinition:hasChangeOfAvailability>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-change-of-availability')" />
	                		</xsl:attribute>
					</culturaldefinition:hasChangeOfAvailability>
				</xsl:for-each>
				<!-- Photographic Documentation of cultural property -->
				<xsl:for-each select="schede/*/DO/FTA">
					<culturaldefinition:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-photographic-documentation-', position())" />
	                		</xsl:attribute>
					</culturaldefinition:hasDocumentation>
				</xsl:for-each>
				<!-- Graphic or cartographic Documentation of cultural property -->
				<xsl:for-each select="schede/*/DO/DRA">
					<culturaldefinition:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'GraphicOrCartographicDocumentation/', $itemURI, '-graphic-cartographic-documentation-', position())" />
	                		</xsl:attribute>
					</culturaldefinition:hasDocumentation>
				</xsl:for-each>
				<!-- Film Documentation of cultural property -->
				<xsl:for-each select="schede/*/DO/VDC">
					<culturaldefinition:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'FilmDocumentation/', $itemURI, '-film-documentation-', position())" />
	                		</xsl:attribute>
					</culturaldefinition:hasDocumentation>
				</xsl:for-each>
				<!-- Audio Documentation of cultural property -->
				<xsl:for-each select="schede/*/DO/REG">
					<culturaldefinition:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'AudioDocumentation/', $itemURI, '-audio-documentation-', position())" />
	                		</xsl:attribute>
					</culturaldefinition:hasDocumentation>
				</xsl:for-each>
				<!-- Sources and Documents of cultural property -->
				<xsl:for-each select="schede/*/DO/FNT">
					<culturaldefinition:hasDocumentation>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'SourceAndDocument/', $itemURI, '-source-document-', position())" />
	                		</xsl:attribute>
					</culturaldefinition:hasDocumentation>
				</xsl:for-each>
				<!-- Bibliography of cultural property -->
				<xsl:for-each select="schede/*/DO/BIB">
					<culturaldefinition:hasBibliography>
						<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'Bibliography/', $itemURI, '-bibliography-', position())" />
	                		</xsl:attribute>
					</culturaldefinition:hasBibliography>
				</xsl:for-each>
				<!-- Geometry of cultural property -->
				<xsl:choose>
					<!-- if does not exist the element MTAP we refer the geometry directly to the cultural property.
					Otherwise: 
					(i) we generate a number of parts (i.e. the values for MTAP elements) - both here and in the rule below;
					(ii) we associate each geometry value in MTAP to generated parts - see rule below;
					(iii) we associate the cultural property to its parts - here.
					 -->
					<xsl:when test="not(schede/*/MT/MTA/MTAP) ">
						<xsl:for-each select="schede/*/GP">
							<clvapit:hasGeometry>
								<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
									select="concat($NS, 'Geometry/', $itemURI, '-geometry-point-', position())" />
			                			</xsl:attribute>
							</clvapit:hasGeometry>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="schede/*/GP">
							<arco:hasPart>
								<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
									select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', position())" />
			                			</xsl:attribute>
							</arco:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="schede/*/GA">
					<clvapit:hasGeometry>
						<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
							select="concat($NS, 'Geometry/', $itemURI, '-geometry-polygon-', position())" />
	                			</xsl:attribute>
					</clvapit:hasGeometry>
				</xsl:for-each>
				<xsl:for-each select="schede/*/GL">
					<clvapit:hasGeometry>
						<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
							select="concat($NS, 'Geometry/', $itemURI, '-geometry-line-', position())" />
	                			</xsl:attribute>
					</clvapit:hasGeometry>
				</xsl:for-each>
				<xsl:for-each select="schede/*/GE">
					<clvapit:hasGeometry>
						<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
							select="concat($NS, 'Geometry/', $itemURI, '-geometry-', position())" />
	                			</xsl:attribute>
					</clvapit:hasGeometry>
				</xsl:for-each>


				<xsl:for-each select="schede/*/*/SGT/SGTI">
					<xsl:if
						test="not(lower-case(normalize-space(.))='nr' or lower-case(normalize-space(.))='n.r.' or lower-case(normalize-space(.))='nr (recupero pregresso)')">
						<culturaldefinition:subject>
							<xsl:value-of select="normalize-space(.)" />
						</culturaldefinition:subject>
						<culturaldefinition:hasSubject>
							<xsl:attribute name="rdf:resource">
	                    		<xsl:value-of
								select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(.)))" />
	                    	</xsl:attribute>
						</culturaldefinition:hasSubject>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each select="schede/*/DA/AID/AIDI">
					<xsl:if
						test="not(lower-case(normalize-space(.))='nr' or lower-case(normalize-space(.))='n.r.' or lower-case(normalize-space(.))='nr (recupero pregresso)')">
						<culturaldefinition:subject>
							<xsl:value-of select="normalize-space(.)" />
						</culturaldefinition:subject>
						<culturaldefinition:hasSubject>
							<xsl:attribute name="rdf:resource">
	                    		<xsl:value-of
								select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(.)))" />
	                    	</xsl:attribute>
						</culturaldefinition:hasSubject>
					</xsl:if>
				</xsl:for-each>
				<xsl:if
					test="schede/*/DA/DES/DESI and not(lower-case(normalize-space(schede/*/DA/DES/DESI))='nr' or lower-case(normalize-space(schede/*/DA/DES/DESI))='n.r.' or lower-case(normalize-space(schede/*/DA/DES/DESI))='nr (recupero pregresso)')">
					<xsl:for-each select="schede/*/DA/DES/DESI">
						<culturaldefinition:iconclassCode>
							<xsl:value-of select="normalize-space(.)" />
						</culturaldefinition:iconclassCode>
					</xsl:for-each>
				</xsl:if>
				<xsl:for-each select="schede/*/DA/AID/AIDC">
					<culturaldefinition:iconclassCode>
						<xsl:value-of select="normalize-space(.)" />
					</culturaldefinition:iconclassCode>
				</xsl:for-each>
				<xsl:for-each select="schede/*/OG/SGT/SGTT">
					<culturaldefinition:title>
						<xsl:value-of select="normalize-space(.)" />
					</culturaldefinition:title>
					<culturaldefinition:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</culturaldefinition:hasTitle>
				</xsl:for-each>
				<xsl:for-each select="schede/*/DA/AID/AIDT">
					<culturaldefinition:title>
						<xsl:value-of select="normalize-space(.)" />
					</culturaldefinition:title>
					<culturaldefinition:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</culturaldefinition:hasTitle>
				</xsl:for-each>
				<xsl:for-each select="schede/*/DA/AID/AIDN">
					<culturaldefinition:alternativeTitle>
						<xsl:value-of select="normalize-space(.)" />
					</culturaldefinition:alternativeTitle>
					<culturaldefinition:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</culturaldefinition:hasTitle>
				</xsl:for-each>
				<!-- proper title -->
				<xsl:for-each select="schede/*/OG/SGT/SGTP">
					<culturaldefinition:properTitle>
						<xsl:value-of select="normalize-space(.)" />
					</culturaldefinition:properTitle>
					<culturaldefinition:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</culturaldefinition:hasTitle>
				</xsl:for-each>
				<xsl:if
					test="not(lower-case(normalize-space(schede/*/SG/SGL/SGLT))='nr' or lower-case(normalize-space(schede/*/SG/SGL/SGLT))='n.r.' or lower-case(normalize-space(schede/*/SG/SGL/SGLT))='nr (recupero pregresso)')">
					<xsl:for-each select="schede/*/SG/SGL/SGLT">
						<culturaldefinition:properTitle>
							<xsl:value-of select="normalize-space(.)" />
						</culturaldefinition:properTitle>
						<culturaldefinition:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</culturaldefinition:hasTitle>
					</xsl:for-each>
				</xsl:if>
				<!-- parallel title -->
				<xsl:for-each select="schede/*/OG/SGT/SGTR">
					<culturaldefinition:parallelTitle>
						<xsl:value-of select="normalize-space(.)" />
					</culturaldefinition:parallelTitle>
					<culturaldefinition:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</culturaldefinition:hasTitle>
				</xsl:for-each>
				<xsl:if
					test="not(lower-case(normalize-space(schede/*/SG/SGL/SGLL))='nr' or lower-case(normalize-space(schede/*/SG/SGL/SGLL))='n.r.' or lower-case(normalize-space(schede/*/SG/SGL/SGLL))='nr (recupero pregresso)')">
					<xsl:for-each select="schede/*/SG/SGL/SGLL">
						<culturaldefinition:parallelTitle>
							<xsl:value-of select="normalize-space(.)" />
						</culturaldefinition:parallelTitle>
						<culturaldefinition:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</culturaldefinition:hasTitle>
					</xsl:for-each>
				</xsl:if>
				<!-- attributed title -->
				<xsl:if
					test="not(lower-case(normalize-space(schede/*/SG/SGL/SGLA))='nr' or lower-case(normalize-space(schede/*/SG/SGL/SGLA))='n.r.' or lower-case(normalize-space(schede/*/SG/SGL/SGLA))='nr (recupero pregresso)')">
					<xsl:for-each select="schede/*/SG/SGL/SGLA">
						<culturaldefinition:attributedTitle>
							<xsl:value-of select="normalize-space(.)" />
						</culturaldefinition:attributedTitle>
						<culturaldefinition:hasTitle>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</culturaldefinition:hasTitle>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with preparatory or final work (RO/ROF) -->
				<xsl:if test="schede/*/RO/ROF">
					<xsl:for-each select="schede/*/RO/ROF">
						<culturaldefinition:hasRelation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Relation/', $itemURI, '-preparatory-final-work-', position())" />
							</xsl:attribute>
						</culturaldefinition:hasRelation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with copy (RO/COP) -->
				<xsl:if test="schede/*/RO/COP or schede/*/RO/CRF/CRFT='copia'">
					<xsl:for-each select="schede/*/RO/COP | schede/*/RO/CRF">
						<culturaldefinition:hasRelation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Relation/', $itemURI, '-copy-', position())" />
							</xsl:attribute>
						</culturaldefinition:hasRelation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with a generic derivated work (if RO/CRF/CRFT != 'replica' or 'contraffazione' or 'controtipo' or 'reimpiego' or 'copia') -->
				<xsl:if test="schede/*/RO/CRF and not(schede/*/RO/CRF/CRFT='copia' or schede/*/RO/CRF/CRFT='contraffazione' or schede/*/RO/CRF/CRFT='controtipo' or schede/*/RO/CRF/CRFT='replica' or schede/*/RO/CRF/CRFT='reimpiego')">
					<xsl:for-each select="schede/*/RO/CRF">
						<culturaldefinition:hasRelation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Relation/', $itemURI, '-derivated-work-', position())" />
							</xsl:attribute>
						</culturaldefinition:hasRelation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with a particular type of derivated work: forgery -->
				<xsl:if test="schede/*/RO/CRF/CFRT='contraffazione'">
					<xsl:for-each select="schede/*/RO/CRF">
						<culturaldefinition:hasRelation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Relation/', $itemURI, '-forgery-', position())" />
							</xsl:attribute>
						</culturaldefinition:hasRelation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with a particular type of derivated work: facsimile -->
				<xsl:if test="schede/*/RO/CRF/CFRT='controtipo'">
					<xsl:for-each select="schede/*/RO/CRF">
						<culturaldefinition:hasRelation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Relation/', $itemURI, '-facsimile-', position())" />
							</xsl:attribute>
						</culturaldefinition:hasRelation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with a particular type of derivated work: same author copy -->
				<xsl:if test="schede/*/RO/CRF/CFRT='replica'">
					<xsl:for-each select="schede/*/RO/CRF">
						<culturaldefinition:hasRelation>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Relation/', $itemURI, '-same-author-copy-', position())" />
							</xsl:attribute>
						</culturaldefinition:hasRelation>
					</xsl:for-each>
				</xsl:if>
				<!-- relation with a particular type of derivated work: reuse -->
				<xsl:if test="schede/*/RO/REI or schede/*/RO/RIU or schede/*/RO/CRF/CFRT='reimpiego'">
					<xsl:for-each select="schede/*/RO/REI | schede/*/RO/RIU | schede/*/RO/CRF">
					<xsl:choose>
						<xsl:when test="./* and (not(./REIP) or ./REIP='intero bene')">
							<culturaldefinition:hasRelation>
								<xsl:attribute name="rdf:resource">
			                            <xsl:value-of
									select="concat($NS, 'Relation/', $itemURI, '-reuse-', position())" />
			                        </xsl:attribute>
							</culturaldefinition:hasRelation>
						</xsl:when>
						<xsl:when test="../RIU">
							<culturaldefinition:hasRelation>
								<xsl:attribute name="rdf:resource">
			                            <xsl:value-of
									select="concat($NS, 'Relation/', $itemURI, '-reuse-', position())" />
			                        </xsl:attribute>
							</culturaldefinition:hasRelation>
						</xsl:when>
						<xsl:when test="../CRF">
							<culturaldefinition:hasRelation>
								<xsl:attribute name="rdf:resource">
			                            <xsl:value-of
									select="concat($NS, 'Relation/', $itemURI, '-reuse-', position())" />
			                        </xsl:attribute>
							</culturaldefinition:hasRelation>
						</xsl:when>
						<xsl:otherwise>
						<xsl:for-each select="./REIP">
								<arco:hasPart>
									<xsl:attribute name="rdf:resource">
				                				<xsl:value-of
										select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
				                	</xsl:attribute>
								</arco:hasPart>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
					</xsl:for-each>
				</xsl:if>
				<!-- name in time (OG/OGD) -->
				<xsl:for-each select="schede/*/OG/OGD">
					<cpdescription:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                        	<xsl:value-of
							select="concat('https://w3id.org/arco/resource/DesignationInTime/', arco-fn:urify(normalize-space(./OGDN)))" />                      	                            
                        </xsl:attribute>
					</cpdescription:hasDesignationInTime>
				</xsl:for-each>
				<!-- name in time (OG/OGT/OGTN) -->
				<xsl:for-each select="schede/*/OG/OGT/OGTN">
					<cpdescription:hasDesignationInTime>
						<xsl:attribute name="rdf:resource">
                        			<xsl:value-of
							select="concat('https://w3id.org/arco/resource/DesignationInTime/', arco-fn:urify(normalize-space(.)))" />   	                            
                        </xsl:attribute>
					</cpdescription:hasDesignationInTime>
				</xsl:for-each>
				<!-- identifier:uniqueIdentifier - concat of NCTR + NCTN + NCTS available 
					in schede/*/CD/NCT) -->
				<xsl:if test="schede/*/CD/NCT">
					<arco:uniqueIdentifier>
						<xsl:value-of
							select="concat(schede/*/CD/NCT/NCTR, schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS)" />
					</arco:uniqueIdentifier>
				</xsl:if>
				<!-- NCTR Codice Regione (schede/*/CD/NCT/NCTR) -->
				<xsl:for-each select="schede/*/CD/NCT/NCTR">
					<arco:regionIdentifier>
						<xsl:value-of select="." />
					</arco:regionIdentifier>
				</xsl:for-each>
				<!-- NCTN Numero catalogo generale (schede/*/CD/NCT/NCTN) -->
				<xsl:for-each select="schede/*/CD/NCT/NCTN">
					<arco:catalogueNumber>
						<xsl:value-of select="." />
					</arco:catalogueNumber>
				</xsl:for-each>
				<!-- NCTS Suffisso (schede/*/CD/NCT/NCTS) -->
				<xsl:for-each select="schede/*/CD/NCT/NCTS">
					<arco:suffix>
						<xsl:value-of select="." />
					</arco:suffix>
				</xsl:for-each>
				<!-- finding note (RE/RES) -->
				<xsl:if test="schede/*/RE/RES">
					<culturaldefinition:findingNote>
						<xsl:value-of select="schede/*/RE/RES" />
					</culturaldefinition:findingNote>
				</xsl:if>
				<!-- Use of cultural property -->
                <xsl:if test="not(schede/A/UT or schede/PG/UT)">
	                <xsl:for-each select="schede/*/UT">
	                	<culturaldefinition:hasUse>
	                		<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-use-', position())" />
	                		</xsl:attribute>
	                	</culturaldefinition:hasUse>                
	                </xsl:for-each>
                </xsl:if>
                <xsl:if test="schede/*/DA/UTF or schede/*/DA/UTM or schede/*/DA/UTS">
                	<culturaldefinition:hasUse>
                		<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-use')" />
	                		</xsl:attribute>
                	</culturaldefinition:hasUse>
                </xsl:if>
                <!-- material of cultural property (version 4.00) -->
               <xsl:for-each select="schede/*/MT/MTC/MTCM">
 	            <xsl:choose>
					<xsl:when test="not(../MTCP) or ../MTCP='intero bene'">
						<cpdescription:hasTechnicalDetailOccurrence>
	                	<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-material-', position())" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
					</xsl:when>
					<xsl:otherwise>
					<xsl:for-each select="../MTCP">
							<arco:hasPart>
								<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
									select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
							</arco:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:for-each>
				<!-- material of cultural property (VeAC) -->
				<xsl:for-each select="schede/VeAC/MT/MTC/MTCF">
					<cpdescription:hasTechnicalDetailOccurrence>
	                	<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-material-', position())" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
 	             </xsl:for-each>
                 <!-- technique of cultural property (4.00) --> 
                 <xsl:for-each select="schede/*/MT/MTC/MTCT">
                 	 <xsl:choose>
					<xsl:when test="not(../MTCP) or ../MTCP='intero bene'">
						<cpdescription:hasTechnicalDetailOccurrence>
	                	<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-technique-', position())" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
					</xsl:when>
					<xsl:otherwise>
					<xsl:for-each select="../MTCP">
							<arco:hasPart>
								<xsl:attribute name="rdf:resource">
			                				<xsl:value-of
									select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
							</arco:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
                 </xsl:for-each>
                 <!-- materialOrTechnique of cultural property (previous versions) -->
                 <xsl:if test="not(schede/*/MT/MTC/*)">
                 	<cpdescription:hasTechnicalDetailOccurrence>
 	                	<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-material-technique-', position())" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
                 </xsl:if>
                 <!-- shape of cultural property --> 
                 <xsl:if test="schede/*/MT/FRM and not(schede/F/MT/FRM)">
                 	<cpdescription:hasTechnicalDetailOccurrence>
 	                	<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-shape')" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
                 </xsl:if>
                 <!-- filigree of cultural property --> 
                 <xsl:if test="schede/*/MT/FIL">
                 	<cpdescription:hasTechnicalDetailOccurrence>
 	                	<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-filigree')" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
                 </xsl:if>
                 <!-- file format of photograph (F) --> 
                 <xsl:if test="schede/F/MT/FVC/FVCF">
                 	<cpdescription:hasTechnicalDetailOccurrence>
 	                	<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-file-format')" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
                 </xsl:if>
                 <!-- photo size of photograph (F) --> 
                 <xsl:if test="schede/F/MT/FRM">
                 	<cpdescription:hasTechnicalDetailOccurrence>
 	                	<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-photo-size')" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
                 </xsl:if>
                 <!-- photo program of photograph (F) --> 
                 <xsl:if test="schede/F/MT/FVC/FVCP">
                 	<cpdescription:hasTechnicalDetailOccurrence>
 	                	<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-photo-program')" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
                 </xsl:if>
                 <!-- storage method and colour depth of photograph (F) --> 
                 <xsl:if test="schede/F/MT/FVC/FVCC">
                 	<cpdescription:hasTechnicalDetailOccurrence>
 	                	<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-storage-method-colour-depth')" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
                 </xsl:if>
                 <!-- resolution of photograph (F) --> 
                 <xsl:if test="schede/F/MT/FVC/FVCU">
                 	<cpdescription:hasTechnicalDetailOccurrence>
 	                	<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-resolution')" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
                 </xsl:if>
                 <!-- pixel dimension of photograph (F) --> 
                 <xsl:for-each select="schede/F/MT/FVC/FVCM">
                 	<cpdescription:hasTechnicalDetailOccurrence>
 	                	<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-pixel-dimension-', position())" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
                 </xsl:for-each>
                 <!-- mass storage of photograph (F) --> 
                 <xsl:if test="schede/F/MT/FVM">
                 	<cpdescription:hasTechnicalDetailOccurrence>
 	                	<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-mass-storage')" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
                 </xsl:if>
                 <!-- colour of photograph (F) --> 
                 <xsl:if test="schede/F/MT/MTX">
                 	<cpdescription:hasTechnicalDetailOccurrence>
 	                	<xsl:attribute name="rdf:resource">
 	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-photo-colour')" />
 	                	</xsl:attribute>
 	                </cpdescription:hasTechnicalDetailOccurrence>
                 </xsl:if>
                 <!-- digital photo note (F) -->
                 <xsl:if test="schede/F/MT/FVC/FVCV or schede/F/MT/FVC/FVCN">
                 	<cpdescription:digitalPhotographNote>
                 		<xsl:choose>
                 			<xsl:when test="schede/F/MT/FVC/FVCV">
                 				<xsl:value-of select="schede/F/MT/FVC/FVCV" />
                 			</xsl:when>
                 			<xsl:otherwise>
                 				<xsl:value-of select="schede/F/MT/FVC/FVCN" />
                 			</xsl:otherwise>
                 		</xsl:choose>
                		<xsl:value-of select="normalize-space(schede/F/MT/FVC/FVCV)" />
                	</cpdescription:digitalPhotographNote>
                </xsl:if>
                <!-- colour of garment (VeAC) --> 
                <xsl:if test="schede/VeAC/MT/MTC/MTCC">
                	<cpdescription:hasTechnicalDetailOccurrence>
	                	<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-garment-colour')" />
	                	</xsl:attribute>
	                </cpdescription:hasTechnicalDetailOccurrence>
                </xsl:if>
                <!-- analysis of garment (VeAC) --> 
                <xsl:if test="schede/VeAC/MT/MTC/MTCA">
                	<cpdescription:hasTechnicalDetailOccurrence>
	                	<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-garment-analysis')" />
	                	</xsl:attribute>
	                </cpdescription:hasTechnicalDetailOccurrence>
                </xsl:if>
                <!-- Legal situation of cultural property -->
                <xsl:if test="schede/*/TU/CDG">
                	<culturaldefinition:hasLegalSituation>
                		<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'LegalSituation/', $itemURI, '-legal-situation-', arco-fn:urify(normalize-space(schede/*/TU/CDG/CDGG)))" />
                		</xsl:attribute>
                	</culturaldefinition:hasLegalSituation>                
                </xsl:if>
                <!-- Export import certification of cultural property -->
                <xsl:for-each select="schede/*/TU/ESP">
                	<culturaldefinition:hasExportImportCertification>
                		<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'ExportImportCertification/', $itemURI, '-export-import-certification-', position())" />
                		</xsl:attribute>
                	</culturaldefinition:hasExportImportCertification>                
                </xsl:for-each>
                <!-- Protective measures of cultural property -->
                <xsl:for-each select="schede/*/TU/NVC">
				<xsl:choose>
					<xsl:when test="./* and (not(./NVCP) or ./NVCP='intero bene')">
						<culturaldefinition:hasProtectiveMeasure>
                		<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'ProtectiveMeasure/', $itemURI, '-protective-measure-', position())" />
                		</xsl:attribute>
                	</culturaldefinition:hasProtectiveMeasure>
					</xsl:when>
					<xsl:otherwise>
					<xsl:for-each select="./NVCP">
							<arco:hasPart>
								<xsl:attribute name="rdf:resource">
			                				<xsl:value-of select="concat($NS, 'CulturalPropertyPart/', $itemURI, '-part-', arco-fn:urify(normalize-space(.)))" />
			                	</xsl:attribute>
							</arco:hasPart>
						</xsl:for-each>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:for-each>
                <!-- Urban planning instrument of culturale property -->
				<xsl:for-each select="schede/*/TU/STU">
                	<culturaldefinition:hasUrbanPlanningInstrument>
                		<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'UrbanPlanningInstrument/', $itemURI, '-urban-planning-instrument-', position())" />
                		</xsl:attribute>
                	</culturaldefinition:hasUrbanPlanningInstrument>                
                </xsl:for-each>
                <!-- Other related agents of cultural property -->
                <xsl:for-each select="schede/*/AU/NMC">
                	<culturaldefinition:hasRelatedAgent>
                		<xsl:attribute name="rdf:resource">
                			<xsl:choose>
                				<xsl:when test="./NMCA">
                					<xsl:value-of select="concat($NS, 'RelatedAgent/', $itemURI, '-', arco-fn:urify(normalize-space(./NMCN)), '-', arco-fn:urify(normalize-space(./NMCA)))" />
                				</xsl:when>
                				<xsl:otherwise>
                					<xsl:value-of select="concat($NS, 'RelatedAgent/', $itemURI, '-', arco-fn:urify(normalize-space(./NMCN)))" />
                				</xsl:otherwise>
                			</xsl:choose>
                		</xsl:attribute>
                	</culturaldefinition:hasRelatedAgent>                
                </xsl:for-each>
			</rdf:Description>
		</rdf:RDF>

	</xsl:template>
</xsl:stylesheet>