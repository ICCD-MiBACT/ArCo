<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
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
	<xsl:template match="/">

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
        
        <xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version"></xsl:variable>
		<xsl:variable name="sheetType" select="name(record/metadata/schede/*)"></xsl:variable>
		<xsl:variable name="cp-name" select="''"></xsl:variable>
        
        <xsl:variable name="NS" select="'https://w3id.org/arco/resource/'"></xsl:variable>
        <xsl:variable name="culturalProperty">
        	<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
        </xsl:variable>
        

		
		<!-- variable ogtt -->
		<xsl:variable name="ogtt">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and not($sheetType='NU') and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
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
				<xsl:when test="record/metadata/schede/*/OG/SGT/SGTA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTA)), 'n.r')))">
					<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTA)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- variable sgti -->
		<xsl:variable name="sgti">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
					<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTI)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="author-string">
			<xsl:variable name="aut-string">
				<xsl:if test="record/metadata/schede/*/AU/AUT">
					<xsl:for-each select="record/metadata/schede/*/AU/AUT">
						<xsl:choose>
							<xsl:when
								test="./AUTS and (not(starts-with(lower-case(normalize-space(./AUTS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTS)), 'n.r')))">
								<xsl:choose>
									<xsl:when test="position() = 1">
										<xsl:value-of
											select="concat(./AUTN, ' (', ./AUTS, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(', ', ./AUTN, ' (', ./AUTS, ')')" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
	           				<xsl:otherwise>	
	           					<xsl:choose>
									<xsl:when test="position() = 1">
	           							<xsl:value-of
											select="./AUTN" />
									</xsl:when>
									<xsl:otherwise>
									<xsl:value-of
											select="concat(', ', ./AUTN)" />
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
							<xsl:when
								test="./AUFN and ./AUFS and not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))">
								<xsl:choose>
									<xsl:when test="position() = 1">
										<xsl:value-of
											select="concat(./AUFN, ' (', ./AUFS, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(', ', ./AUFN, ' (', ./AUFS, ')')" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
	           				<xsl:when
	           					test="./AUFB and ./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r')))">	
	           					<xsl:choose>
									<xsl:when test="position() = 1">
	           							<xsl:value-of
											select="concat(./AUFB, ' (', ./AUFS, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(', ', ./AUFB, ' (', ./AUFS, ')')" />
									</xsl:otherwise>
								</xsl:choose>
	               			</xsl:when>
	               			<xsl:when test="./AUFB">
	               				<xsl:choose>
									<xsl:when test="position() = 1">
	           							<xsl:value-of
											select="./AUFB" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(', ', ./AUFB)" />
									</xsl:otherwise>
								</xsl:choose>
	               			</xsl:when>
	               			<xsl:otherwise>
	               				<xsl:choose>
									<xsl:when test="position() = 1">
	           							<xsl:value-of
											select="./AUFN" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(', ', ./AUFN)" />
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
							<xsl:when
								test="./AUTS and (not(starts-with(lower-case(normalize-space(./AUTS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUTS)), 'n.r')))">
								<xsl:choose>
									<xsl:when test="position() = 1">
										<xsl:value-of
											select="concat(./AUTN, ' (', ./AUTS, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(', ', ./AUTN, ' (', ./AUTS, ')')" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
	           				<xsl:otherwise>	
	           					<xsl:choose>
									<xsl:when test="position() = 1">
	           							<xsl:value-of
											select="./AUTN" />
									</xsl:when>
									<xsl:otherwise>
									<xsl:value-of
											select="concat(', ', ./AUTN)" />
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
							<xsl:when
								test="./AUFN and ./AUFS and not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r'))">
								<xsl:choose>
									<xsl:when test="position() = 1">
										<xsl:value-of
											select="concat(./AUFN, ' (', ./AUFS, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(', ', ./AUFN, ' (', ./AUFS, ')')" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
	           				<xsl:when
	           					test="./AUFB and ./AUFS and (not(starts-with(lower-case(normalize-space(./AUFS)), 'nr')) and not(starts-with(lower-case(normalize-space(./AUFS)), 'n.r')))">	
	           					<xsl:choose>
									<xsl:when test="position() = 1">
	           							<xsl:value-of
											select="concat(./AUFB, ' (', ./AUFS, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(', ', ./AUFB, ' (', ./AUFS, ')')" />
									</xsl:otherwise>
								</xsl:choose>
	               			</xsl:when>
	               			<xsl:when test="./AUFB">
	               				<xsl:choose>
									<xsl:when test="position() = 1">
	           							<xsl:value-of
											select="./AUFB" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(', ', ./AUFB)" />
									</xsl:otherwise>
								</xsl:choose>
	               			</xsl:when>
	               			<xsl:otherwise>
	               				<xsl:choose>
									<xsl:when test="position() = 1">
	           							<xsl:value-of
											select="./AUFN" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(', ', ./AUFN)" />
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
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
			
		<xsl:variable name="cultural-context">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/*/AU/ATB/ATBD">
					<xsl:value-of select="concat(' - ', record/metadata/schede/*/AU/ATB/ATBD)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="date-string">
			<xsl:choose>
				<xsl:when test="$sheetType='A' and $sheetType='PG'">
					<xsl:choose>
		        			<xsl:when test="not(record/metadata/schede/A/RE/REN/RENS)">
		        				<xsl:choose>
					                    	<xsl:when test="record/metadata/schede/A/RE/REL/RELF">
									<xsl:value-of
										select="concat(' (', record/metadata/schede/A/RE/REL/RELS, ', ',  record/metadata/schede/A/RE/REL/RELF, ')')" />
								</xsl:when>
					                        <xsl:otherwise>
		        		                	<xsl:value-of
										select="concat(' (', record/metadata/schede/A/RE/REL/RELS, ')')" />
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
									<xsl:value-of
										select="concat(' (', record/metadata/schede/BNB/LR/LRD/LRDB, ' - ',  record/metadata/schede/BNB/LR/LRD/LRDD, ')')" />
								</xsl:when>
					                        <xsl:otherwise>
		        		                	<xsl:value-of
										select="concat(' (', record/metadata/schede/BNB/LR/LRD/LRDB, ')')" />
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
				<xsl:when test="$sheetType='BDM'">
                      			<xsl:choose>
	                      			<xsl:when test="record/metadata/schede/BDM/AU/DTF/DTFZ">
							<xsl:value-of select="concat(' (', record/metadata/schede/BDM/AU/DTF/DTFZ, ')')" />
						</xsl:when>
		        			<xsl:otherwise>
		        				<xsl:value-of select="''" />
			        		</xsl:otherwise>
        				</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
		        		<xsl:when test="not(record/metadata/schede/*/DT/DTN/DTNS)">
		        			<xsl:choose>
		                    	<xsl:when test="record/metadata/schede/*/DT/DTZ/DTZS">
									<xsl:value-of
										select="concat(' (', record/metadata/schede/*/DT/DTZ/DTZG, ', ',  record/metadata/schede/*/DT/DTZ/DTZS, ')')" />
								</xsl:when>
		                        <xsl:otherwise>
		                        	<xsl:value-of
										select="concat(' (', record/metadata/schede/*/DT/DTZ/DTZG, ')')" />
								</xsl:otherwise>
		                    </xsl:choose>
		        		</xsl:when>
		        		<xsl:otherwise>
		        			<xsl:value-of select="''" />
		        		</xsl:otherwise>
        			</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
        </xsl:variable>


		<rdf:RDF>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="$culturalProperty" />
				</xsl:attribute>

			<!-- labels of cultural property -->

			<!-- SMO -->
			<!-- la virgola tra ogtd e ogtv viene inserita nella variabile ogtv perché 
				c'è sempre se c'è ogtv. Invece, nella label si mettono le parentesi solo 
				se c'è o sgta o sgti, mentre si mette la virgola tra sgta e sgti solo se 
				ci sono entrambi -->

			<xsl:if test="$sheetType='SMO'">

				<xsl:variable name="ogtv">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
							<xsl:value-of
								select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTA and record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTA)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
								<xsl:value-of
									select="concat($sgta, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTA or record/metadata/schede/*/OG/SGT/SGTI">
								<xsl:value-of
									select="concat($sgta, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTA and record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTA)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
								<xsl:value-of
									select="concat($sgta, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTA or record/metadata/schede/*/OG/SGT/SGTI">
								<xsl:value-of
									select="concat($sgta, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
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
						<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGD/OGDN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGD/OGDN)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTW and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTW)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTW)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'n.r')))">
							<xsl:value-of
								select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTP))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
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
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
					
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
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
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
					
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
							<xsl:value-of
								select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
								<xsl:value-of
									select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
								<xsl:value-of
									select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
							<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTI)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
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
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
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
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
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
						<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r')))">
							<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTT)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="sgti">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
							<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTI)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="ogtt">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
							<xsl:value-of
								select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT and record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
								<xsl:value-of
									select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtv, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
								<xsl:value-of
									select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtv, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtv)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT and record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
								<xsl:value-of
									select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtv, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
								<xsl:value-of
									select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtv, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtv)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
				</rdfs:label>
			</xsl:if>


			<!-- F -->
			<!-- Le parentesi le mettiamo nella label, ci sono sempre perché sia sgti 
				sia ogtd sono obbligatori. Le virgole tra ogtd ogtv ogtw ogtp le mettiamo 
				nelle tre variabili perché ci sono sempre se ci sono quegli elementi -->
			<xsl:if test="$sheetType='F'">
				<xsl:variable name="ogtv">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTW and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTW)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTW)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'n.r')))">
							<xsl:value-of
								select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTP))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="ogtv">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
							<xsl:value-of
								select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:for-each select="record/metadata/schede/*/SG/SGT/SGTI">
					<rdfs:label xml:lang="it">
						<xsl:variable name="tmp-label">
							<xsl:value-of
								select="concat(normalize-space(.), ' (', normalize-space(/record/metadata/schede/*/OG/OGT/OGTD), $ogtv, $ogtw, $ogtp, ')')" />
						</xsl:variable>
						
						<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:variable name="tmp-label">
							<xsl:value-of
								select="concat(normalize-space(.), ' (', normalize-space(/record/metadata/schede/*/OG/OGT/OGTD), $ogtv, $ogtw, $ogtp, ')')" />
						</xsl:variable>
						
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
			<!-- la parentesi di apertura viene aggiunta alla variabile ogtn perché 
				c'è solo se c'è ogtn; quindi viene messo un choose per la rdfs:label per 
				inserire la parentesi di chiusura a seconda dell'esistenza o meno di $ogtn. 
				La virgola tra ogtd e ogtt viene messa nella variabile ogtc perché c'è solo 
				se c'è ogtc -->
			<xsl:if test="$sheetType='CA' or $sheetType='MA'">
				<xsl:variable name="ogtn">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTC)), 'n.r')))">
							<xsl:value-of
								select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTC))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
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
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
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
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
				</rdfs:label>
			</xsl:if>

			<!-- AT -->
			<!-- la virgola tra ogtd e ogtv viene inserita nella variabile ogtv perché 
				c'è sempre se c'è ogtv. Lo stesso per la virgola tra ogtd e ogtt perché sono 
				entrambi obbligatori. La parentesi di apertura e quella di chiusura sono 
				messe nella label solo se c'è o ogtm o ogtp; la virgola tra ogtm e ogtp viene 
				messa nella label solo se ci sono entrambi -->
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

				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTM and record/metadata/schede/*/OG/OGT/OGTP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTM)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'n.r')))">
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT), ' (', $ogtm, ', ', $ogtp, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTM or record/metadata/schede/*/OG/OGT/OGTP">
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT), ' (', $ogtm, $ogtp, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTM and record/metadata/schede/*/OG/OGT/OGTP and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTM)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTP)), 'n.r')))">
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT), ' (', $ogtm, ', ', $ogtp, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTM or record/metadata/schede/*/OG/OGT/OGTP">
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT), ' (', $ogtm, $ogtp, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTT))" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
				</rdfs:label>
			</xsl:if>


			<!-- TMA -->

			<xsl:if test="$sheetType='TMA'">
				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
						<xsl:value-of
							select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTM), ')')" />
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
						<xsl:value-of
							select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTM), ')')" />
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
				</rdfs:label>
			</xsl:if>

			<!-- NU -->
			<!-- sia virgola tra ogtt e ogth sia parentesi sono inserite nel choose 
				della label perché la virgola c'è solo se ci sono entrambe le variabili, 
				le parentesi solo se ce ne sono entrambe o una delle due -->
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


				<rdfs:label xml:lang="it">
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
					
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
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
					
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
				</rdfs:label>
			</xsl:if>


			<!-- OAC -->
			<!-- nella label si mettono le parentesi solo se c'è o sgta o sgti, mentre 
				si mette la virgola tra sgta e sgti solo se ci sono entrambi -->

			<xsl:if test="$sheetType='OAC'">
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
				<xsl:variable name="sgti">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
							<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTI)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>


				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT and record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
								<xsl:value-of
									select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
								<xsl:value-of
									select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT and record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
								<xsl:value-of
									select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
								<xsl:value-of
									select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
				</rdfs:label>
			</xsl:if>

			<!-- D or MI or S -->
			<!-- la virgola tra ogtd e ogtv viene inserita nella variabile ogtv perché 
				c'è sempre se c'è ogtv. Invece, nella label si mettono le parentesi solo 
				se c'è o sgta o sgti, mentre si mette la virgola tra sgta e sgti solo se 
				ci sono entrambi -->

			<xsl:if test="$sheetType='D' or $sheetType='MI' or $sheetType='S'">
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
				<xsl:variable name="sgti">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
							<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTI)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="ogtv">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
							<xsl:value-of
								select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTV))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT and record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
								<xsl:value-of
									select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
								<xsl:value-of
									select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT and record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
								<xsl:value-of
									select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
								<xsl:value-of
									select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTC)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTF and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTF)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTF)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTG and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTG)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTG)), 'n.r')))">
							<xsl:value-of
								select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTG))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
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
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
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
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
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
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTN)), 'n.r')))">
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
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTQ and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTQ)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTQ)), 'n.r')))">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTQ))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label xml:lang="it">
							<xsl:variable name="tmp-label">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
										<xsl:value-of
											select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtq, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtq)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:variable name="tmp-label">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
										<xsl:value-of
											select="concat($ogtn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtq, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtq)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
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


						<rdfs:label xml:lang="it">
							<xsl:variable name="tmp-label">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGT/OGTD">
										<xsl:value-of
											select="concat($ogtd, normalize-space(record/metadata/schede/*/OG/OGT/OGTT), $ogtq, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTT), $ogtq)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:variable name="tmp-label">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGT/OGTD">
										<xsl:value-of
											select="concat($ogtd, normalize-space(record/metadata/schede/*/OG/OGT/OGTT), $ogtq, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTT), $ogtq)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTQ and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTQ)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTQ)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGA/OGAD and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGA/OGAD)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGA/OGAD)), 'n.r')))">
							<xsl:value-of
								select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGA/OGAD))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
						<xsl:value-of
							select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtq, ')', $ogad)" />
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
						<xsl:value-of
							select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTN), ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtq, ')', $ogad)" />
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
				</rdfs:label>
			</xsl:if>


			<!-- BDI -->
			<xsl:if test="$sheetType='BDI'">
				<xsl:choose>
					<xsl:when
						test="$sheetVersion='3.00_ICCD0' or $sheetVersion='3.00' or $sheetVersion='3.01_ICCD0' or $sheetVersion='3.01'">
						<!-- la virgola tra dbd e dbl viene inserita nella variabile dbl perché 
							c'è sempre se c'è dbl. Le parentesi di dbc vengono messe nella label perché 
							dbd e dbc sono obbligatori quindi ci sono sempre -->
						<xsl:variable name="dbl">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/DB/DBL and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DB/DBL)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/DB/DBL)), 'n.r')))">
								<!-- si usa il for-each perché DBL è ripetitivo -->
								<xsl:for-each select="record/metadata/schede/*/DB/DBL">
									<xsl:value-of select="concat(', ', normalize-space(.))" />
								</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label xml:lang="it">
							<xsl:variable name="tmp-label">
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/DB/DBD), $dbl, ' (', normalize-space(record/metadata/schede/*/DB/DBC), ')')" />
							</xsl:variable>
							
							<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:variable name="tmp-label">
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/DB/DBD), $dbl, ' (', normalize-space(record/metadata/schede/*/DB/DBC), ')')" />
							</xsl:variable>
							
							<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
						</rdfs:label>
					</xsl:when>
					<xsl:otherwise>
						<!-- la parentesi di apertura viene aggiunta alla variabile ogdn perché 
							c'è solo se c'è ogdn; quindi viene messo un choose per la rdfs:label per 
							inserire la parentesi di chiusura a seconda dell'esistenza o meno di $ogdn. 
							Le virgole tra ogtd, ogtt e ctg vengono messe nelli variabili ogtt perché 
							ci sono solo se ci sono quei campi -->
						<xsl:variable name="ogdn">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGD/OGDN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGD/OGDN)), 'n.r')))">
									<xsl:value-of
										select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGDN), ' (')" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label xml:lang="it">
							<xsl:variable name="tmp-label">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN">
										<xsl:value-of
											select="concat($ogdn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/CTG), ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/CTG))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:variable name="tmp-label">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN">
										<xsl:value-of
											select="concat($ogdn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/CTG), ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ', ', normalize-space(record/metadata/schede/*/OG/CTG))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
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
								<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r')))">
									<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTT)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="sgti">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
									<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/SGT/SGTI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="ogtt">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
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
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTG and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTG)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTG)), 'n.r')))">
									<xsl:value-of
										select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTG))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label xml:lang="it">
							<xsl:variable name="tmp-label">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT and record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
										<xsl:value-of
											select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtg, ')')" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtg, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtg)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:variable name="tmp-label">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT and record/metadata/schede/*/OG/SGT/SGTI and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTT)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/SGT/SGTI)), 'n.r')))">
										<xsl:value-of
											select="concat($sgtt, ', ', $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtg, ')')" />
									</xsl:when>
									<xsl:when test="record/metadata/schede/*/OG/SGT/SGTT or record/metadata/schede/*/OG/SGT/SGTI">
										<xsl:value-of
											select="concat($sgtt, $sgti, ' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtg, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ogtg)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
						</rdfs:label>
					</xsl:when>
					<xsl:otherwise>
						<!-- la parentesi di apertura viene aggiunta alla variabile ogdn perché 
							c'è solo se c'è ogdn; quindi viene messo un choose per la rdfs:label per 
							inserire la parentesi di chiusura a seconda dell'esistenza o meno di $ogdn. 
							Le virgole tra ogtd, ogtt e ctg vengono messe nelli variabili ogtt perché 
							ci sono solo se ci sono quei campi -->
						<xsl:variable name="ogdn">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGD/OGDN)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGD/OGDN)), 'n.r')))">
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
								<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r')))">
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
								<xsl:when test="record/metadata/schede/*/OG/CTG and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/CTG)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/CTG)), 'n.r')))">
									<xsl:value-of select="concat(', ', normalize-space(record/metadata/schede/*/OG/CTG))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="''" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<rdfs:label xml:lang="it">
							<xsl:variable name="tmp-label">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN">
										<xsl:value-of
											select="concat($ogdn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ctg, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ctg)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:variable name="tmp-label">
								<xsl:choose>
									<xsl:when test="record/metadata/schede/*/OG/OGD/OGDN">
										<xsl:value-of
											select="concat($ogdn, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ctg, ')')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of
											select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtt, $ctg)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							
							<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
						</rdfs:label>

					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>

			<!-- BNB -->
			<!-- il trattino tra nbna e le virgole tra ogtd e ogte e tra ogte e ogtc 
				vengono messe nelle variabili perché la loro esistenza dipende dall'esistenza 
				di quei campi -->
			<xsl:if test="$sheetType='BNB'">
				<xsl:variable name="nbna">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/SB/NBN/NBNA and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/SB/NBN/NBNA)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/SB/NBN/NBNA)), 'n.r')))">
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
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTE and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTE)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTE)), 'n.r')))">
							<xsl:value-of
								select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTE))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="ogtc">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTC)), 'n.r')))">
							<xsl:value-of
								select="concat(', ', normalize-space(record/metadata/schede/*/OG/OGT/OGTC))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
						<xsl:value-of
							select="concat($nbna, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogte, $ogtc)" />
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
						<xsl:value-of
							select="concat($nbna, normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogte, $ogtc)" />
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
				</rdfs:label>
			</xsl:if>

			<!-- BNM or BNPE or BNZ or E -->
			<!-- le parentesi vengono inserite nella variabile ogtv perché ci sono 
				solo se c'è ogtv -->
			<xsl:if test="$sheetType='BNPE' or $sheetType='BNM' or $sheetType='BNZ' or $sheetType='E'">
				<xsl:variable name="ogtv">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
							<xsl:value-of
								select="concat(' (', normalize-space(record/metadata/schede/*/OG/OGT/OGTV), ')')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
						<xsl:value-of
							select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv)" />
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
						<xsl:value-of
							select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), $ogtv)" />
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
				</rdfs:label>
			</xsl:if>


			<!-- BNP -->
			<!-- sia virgola tra ogtt e ogtv sia parentesi sono inserite nel choose 
				della label perché la virgola c'è solo se ci sono entrambe le variabili, 
				le parentesi solo se ce ne sono entrambe o una delle due -->
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


				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', $ogtt, ', ', $ogtv, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT or record/metadata/schede/*/OG/OGT/OGTV">
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', $ogtt, $ogtv, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and record/metadata/schede/*/OG/OGT/OGTV and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTT)), 'n.r'))) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTV)), 'n.r')))">
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', $ogtt, ', ', $ogtv, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT or record/metadata/schede/*/OG/OGT/OGTV">
								<xsl:value-of
									select="concat(normalize-space(record/metadata/schede/*/OG/OGT/OGTD), ' (', $ogtt, $ogtv, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTD)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
				</rdfs:label>
			</xsl:if>


			<!-- FF -->
			<xsl:if test="$sheetType='FF'">
				<rdfs:label xml:lang="it">
					<xsl:variable name="tmp-label">
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGD/OGDN)" />
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string, $cultural-context, $date-string)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:variable name="tmp-label">
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGD/OGDN)" />
					</xsl:variable>
					
					<xsl:value-of select="concat($tmp-label, $author-string-en, $cultural-context, $date-string)" />
				</rdfs:label>
			</xsl:if>
			
			</rdf:Description>
		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>