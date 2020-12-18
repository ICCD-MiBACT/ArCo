<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:dc="http://purl.org/dc/elements/1.1/"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
xmlns:pico="http://data.cochrane.org/ontologies/pico/"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="1.0">

	<xsl:param name="item" />
	<xsl:param name="NS" />
	<xsl:param name="SOURCE"/>
	<xsl:variable name="sheetVersion"
		select="record/metadata/schede/*/@version" />
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*)" />
	<xsl:variable name="cp-name" select="''" />
	<!-- xsl:variable name="NS"
		select="'https://w3id.org/arco/resource/'" /-->
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
			<xsl:when test="record/metadata/schede/*/CD/CBC">
				<xsl:value-of select="record/metadata/schede/*/CD/CBC" />
			</xsl:when>
			<xsl:otherwise>
			<xsl:variable name="accc-space" />
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/AC/ACC/ACCC">
						<xsl:value-of select="record/metadata/schede/*/AC/ACC/ACCC" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="record/metadata/schede/*/CD/ACC/ACCC" />
					</xsl:otherwise>
				</xsl:choose>
			<xsl:variable name="accc-nospace" select="translate($accc-space, ' ', '')" />
			<xsl:variable name="accc" select="translate($accc-nospace, '/', '_')" />
			<xsl:variable name="acc-space" select="record/metadata/schede/*/AC/ACC" />
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
	<xsl:variable name="culturalProperty"
			select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />

	
	<xsl:variable name="dcType">
	<xsl:choose>
	<xsl:when test="record/metadata/schede/AT/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/OG/OGT/OGTT)), 'n.r'))) ">
		<xsl:value-of
					select="concat($NS, 'Type/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/AT/OG/OGT/OGTT)), normalize-space(lower-case(record/metadata/schede/AT/OG/OGT/OGTP)))))" />
	</xsl:when>

	<xsl:when test="record/metadata/schede/*/OG/OGT/OGTD and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTD)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/OG/OGT/OGTD)), 'n.r'))) and not(record/metadata/schede/AT)">
		<xsl:value-of select="concat($NS, 'Type/', arco-fn:arcofy(normalize-space(lower-case(record/metadata/schede/*/OG/OGT/OGTD))))" />
	</xsl:when>
	
	<xsl:when test="record/metadata/schede/BDI/DB/DBD and (not(starts-with(lower-case(normalize-space(record/metadata/schede/BDI/DB/DBD)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/BDI/DB/DBD)), 'n.r')))">
			<xsl:value-of select="concat($NS, 'Type/', arco-fn:arcofy(normalize-space(lower-case(record/metadata/schede/BDI/DB/DBD))))" />
	</xsl:when>
	<xsl:otherwise></xsl:otherwise>
	</xsl:choose>
	</xsl:variable>
	
	
	
		
<xsl:template match="/">
	<rdf:RDF>
	<xsl:if test="not($sheetType='CF' or $sheetType='CG' or $sheetType='AUT')" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
                <xsl:value-of
					select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
			</xsl:attribute>
				<dc:language>
					<xsl:text>ita</xsl:text>
				</dc:language>
			<dc:publisher>
				<xsl:attribute name="rdf:resource"> 
					<xsl:value-of select="'https://w3id.org/arco/resource/Agent/050ae5d29fc291b682bcf51f1250ca75'"/>
				</xsl:attribute>
			</dc:publisher>
		</rdf:Description>

	<rdf:Description>
		<xsl:attribute name="rdf:about">
			<xsl:value-of select="$culturalProperty" />
		</xsl:attribute>
					<!-- xsl:variable name="sheetType" select="record/metadata/schede/*/CD/TSK/text()"></xsl:variable -->
				
												<!-- dc:type -->
		<xsl:if test="not($sheetType='MODI')">
		<xsl:for-each select="record/metadata/schede/*/OG/OGT">
		<xsl:choose>
			<xsl:when test="not($sheetType='BNB') and not($sheetType='A' and ($sheetVersion='3.00' or $sheetVersion='3.00_ICCD0')) and not($sheetType='A' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0'))">
				<dc:type>
						<xsl:choose>
							<xsl:when test="./OGTT">
								<xsl:value-of select="concat(./OGTD, ' ', ./OGTT)" />
							</xsl:when>
							<xsl:when test="./OGTD">
								<xsl:value-of select="./OGTD" />
							</xsl:when>
						</xsl:choose>
				</dc:type>
			</xsl:when>
			<xsl:when test="$sheetType='A' and ($sheetVersion='3.00' or $sheetVersion='3.00_ICCD0')">
				<dc:type>
						<xsl:choose>
							<xsl:when test="./OGTQ">
								<xsl:value-of select="concat(./OGTD, '-', ./OGTQ)" />
							</xsl:when>
							<xsl:when test="./OGTD">
								<xsl:value-of select="./OGTD" />
							</xsl:when>
						</xsl:choose>
				</dc:type>
			</xsl:when>
			<xsl:when test="$sheetType='A' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')">
				<dc:type>
						<xsl:choose>
							<xsl:when test="./OGTQ">
								<xsl:value-of	select="concat(./OGTT, '-', ./OGTQ)" />
							</xsl:when>
							<xsl:when test="./OGTT">
								<xsl:value-of select="./OGTT" />
							</xsl:when>
						</xsl:choose>
				</dc:type>
			</xsl:when>
			<xsl:when test="$sheetType='BNB' and (./OGTD and starts-with(lower-case(normalize-space(./OGTD)), 'campione'))">
				<dc:type>
						<xsl:choose>
							<xsl:when test="./OGTK">
								<xsl:value-of	select="concat(./OGTD, ' ', ./OGTK)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="./OGTD" />
							</xsl:otherwise>
						</xsl:choose>
				</dc:type>					
			</xsl:when>
			<xsl:when test="$sheetType='BNB' and (./OGTD and starts-with(lower-case(normalize-space(./OGTD)), 'erbario'))">
				<dc:type>
						<xsl:choose>
							<xsl:when test="./OGTR">
								<xsl:value-of	select="concat(./OGTD, ' ', ./OGTR)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="./OGTD" />
							</xsl:otherwise>
						</xsl:choose>
				</dc:type>					
			</xsl:when>
			<xsl:when test="$sheetType='BNB' and (./OGTD and starts-with(lower-case(normalize-space(./OGTD)), 'collezione'))">
				<dc:type>
						<xsl:choose>
							<xsl:when test="./OGTZ">
								<xsl:value-of	select="concat(./OGTD, ' ', ./OGTZ)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="./OGTD" />
							</xsl:otherwise>
						</xsl:choose>
				</dc:type>					
			</xsl:when>
			<xsl:when test="$sheetType='BNB' and (./OGTD and starts-with(lower-case(normalize-space(./OGTD)), 'contenitore'))">
				<dc:type>
						<xsl:choose>
							<xsl:when test="./OGTO">
								<xsl:value-of	select="concat(./OGTD, ' ', ./OGTO)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="./OGTD" />
							</xsl:otherwise>
						</xsl:choose>
				</dc:type>					
			</xsl:when>
		</xsl:choose>
		</xsl:for-each>
		</xsl:if>
		<xsl:if test="record/metadata/schede/MODI/OG">
			<dc:type>
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
					</dc:type>
				</xsl:if>
									<!-- dcterms:isReferencedBy  -->
		<dcterms:isReferencedBy>
			<xsl:attribute name="rdf:resource">
				<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
			</xsl:attribute>
		</dcterms:isReferencedBy>
		
									<!-- dc:source  -->
		<dc:source>
			<xsl:attribute name="rdf:resource">
				<xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
			</xsl:attribute>
		</dc:source>
							<dc:source>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($SOURCE, $item)" />
						</xsl:attribute>
					</dc:source>
												<!-- dc:title -->	

	<xsl:if test="record/metadata/schede/*/OG">
		<dc:title>
			<xsl:if test="record/metadata/schede/*/OG/SGT/SGTT">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
								<xsl:value-of select="concat(record/metadata/schede/*/OG/SGT/SGTT, ', ', record/metadata/schede/*/OG/SGT/SGTI, ' (', record/metadata/schede/*/OG/OGT/OGTD, ', ', record/metadata/schede/*/OG/OGT/OGTV, ')')" />	
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(record/metadata/schede/*/OG/SGT/SGTT, ', ', record/metadata/schede/*/OG/SGT/SGTI, ' (', record/metadata/schede/*/OG/OGT/OGTD, ')')" />
							</xsl:otherwise>
						</xsl:choose>	
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
								<xsl:value-of select="concat(record/metadata/schede/*/OG/SGT/SGTT, ' (', record/metadata/schede/*/OG/OGT/OGTD, ', ', record/metadata/schede/*/OG/OGT/OGTV, ')')" />	
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(record/metadata/schede/*/OG/SGT/SGTT, ' (', record/metadata/schede/*/OG/OGT/OGTD, ')')" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/OG/OGD/OGDN and not (record/metadata/schede/*/OG/SGT/SGTT)">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
						<xsl:value-of select="concat(record/metadata/schede/*/OG/OGD/OGDN, ' (', record/metadata/schede/*/OG/OGT/OGTD, ', ', record/metadata/schede/*/OG/OGT/OGTV, ')')" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OG/CTG">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT">
								<xsl:value-of select="concat(record/metadata/schede/*/OG/OGD/OGDN, ' (', record/metadata/schede/*/OG/OGT/OGTD, ' ', record/metadata/schede/*/OG/OGT/OGTT, ', ', record/metadata/schede/*/OG/CTG, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(record/metadata/schede/*/OG/OGD/OGDN, ' (', record/metadata/schede/*/OG/OGT/OGTD, ', ', record/metadata/schede/*/OG/CTG, ')')" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(record/metadata/schede/*/OG/OGD/OGDN, ' (', record/metadata/schede/*/OG/OGT/OGTD, ')')" />
					</xsl:otherwise>	
				</xsl:choose>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/OG/OGT/OGTN and not (record/metadata/schede/*/OG/OGD/OGDN or record/metadata/schede/*/OG/SGT/SGTT)">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC">
						<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTN, ' (', record/metadata/schede/*/OG/OGT/OGTD, ', ', record/metadata/schede/*/OG/OGT/OGTC, ')')" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT and not (record/metadata/schede/*/OG/OGT/OGTC)">
						<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTN, ' (', record/metadata/schede/*/OG/OGT/OGTD, ' ', record/metadata/schede/*/OG/OGT/OGTT, ')')" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTQ and not (record/metadata/schede/*/OG/OGT/OGTT or record/metadata/schede/*/OG/OGT/OGTC)">
						<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTN, ' (', record/metadata/schede/*/OG/OGT/OGTD, ' ', record/metadata/schede/*/OG/OGT/OGTQ, ')')" />
					</xsl:when>					
					<xsl:otherwise>
						<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTN, ' (', record/metadata/schede/*/OG/OGT/OGTD, ')')" />
					</xsl:otherwise>	
				</xsl:choose>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/OG/OGT/OGTD and not (record/metadata/schede/*/OG/OGT/OGTN or record/metadata/schede/*/OG/OGD/OGDN or record/metadata/schede/*/OG/SGT/SGTT)">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
								<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTD, ' (', record/metadata/schede/*/OG/OGT/OGTT, ', ', record/metadata/schede/*/OG/OGT/OGTV, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTQ">
								<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTD, ' (', record/metadata/schede/*/OG/OGT/OGTT, ' ', record/metadata/schede/*/OG/OGT/OGTQ, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTH">
								<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTD, ' (', record/metadata/schede/*/OG/OGT/OGTT, ', ', record/metadata/schede/*/OG/OGT/OGTH, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTD, ' (', record/metadata/schede/*/OG/OGT/OGTT, ')')" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTQ and not (record/metadata/schede/*/OG/OGT/OGTT or record/metadata/schede/*/OG/OGT/OGTC)">
						<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTN, ' (', record/metadata/schede/*/OG/OGT/OGTD, ' ', record/metadata/schede/*/OG/OGT/OGTQ, ')')" />
					</xsl:when>	
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTM">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTP">
								<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTD, ' (', record/metadata/schede/*/OG/OGT/OGTM, ' ', record/metadata/schede/*/OG/OGT/OGTP, ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTD, ' (', record/metadata/schede/*/OG/OGT/OGTM, ')')" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>		
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">	
						<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTD, ' (', record/metadata/schede/*/OG/OGT/OGTV, ')')" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/SB/NBN/NBNA">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTE">
								<xsl:value-of select="concat(record/metadata/schede/*/SB/NBN/NBNA, ' - ', record/metadata/schede/*/OG/OGT/OGTD, ', ', record/metadata/schede/*/OG/OGT/OGTE, ')')" />
							</xsl:when>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC">
								<xsl:value-of select="concat(record/metadata/schede/*/SB/NBN/NBNA, ' - ', record/metadata/schede/*/OG/OGT/OGTD, ', ', record/metadata/schede/*/OG/OGT/OGTC, ')')" />
							</xsl:when>
							<xsl:otherwise>
									<xsl:value-of select="concat(record/metadata/schede/*/SB/NBN/NBNA, ' - ', record/metadata/schede/*/OG/OGT/OGTD, ')')" />
							</xsl:otherwise>
						</xsl:choose>	
					</xsl:when>	
					<xsl:otherwise>
						<xsl:value-of select="record/metadata/schede/*/OG/OGT/OGTD" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="$sheetType='A' or $sheetType='PG' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='1.00_ICCD0')">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTD">
						<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTD, ' (', record/metadata/schede/*/OG/OGT/OGTT, ' ', record/metadata/schede/*/OG/OGT/OGTQ, ')')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat( record/metadata/schede/*/OG/OGT/OGTT, ' ', record/metadata/schede/*/OG/OGT/OGTQ)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/DB/DBD">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/DB/DBC">
						<xsl:value-of select="concat(record/metadata/schede/*/DB/DBD, ', ', record/metadata/schede/*/DB/DBL, ' (', record/metadata/schede/*/DB/DBC, ')') " />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/DB/DBL and not (record/metadata/schede/*/DB/DBC)">
						<xsl:value-of select="concat(record/metadata/schede/*/DB/DBD, ', ', record/metadata/schede/*/DB/DBL)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="record/metadata/schede/*/DB/DBC" />
					</xsl:otherwise>
				</xsl:choose>	
			</xsl:if>
			<xsl:if test="$sheetType='MODI'">
				<xsl:choose>
					<xsl:when test="record/metadata/schede/MODI/OG/OGT">
						<xsl:value-of select="concat(record/metadata/schede/MODI/OG/OGD, ' ', record/metadata/schede/MODI/OG/OGT)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="record/metadata/schede/MODI/OG/OGD" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
		</dc:title>
	</xsl:if>



											<!-- dcterms:spatial -->
	<xsl:if test="record/metadata/schede/*/LC/PVC">
		<dcterms:spatial>
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
		</dcterms:spatial>
	</xsl:if>
	<xsl:if test="record/metadata/schede/MODI/LC/*">
		<dcterms:spatial>
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
		</dcterms:spatial>
	</xsl:if>
		
									<!-- dc:identifier -->
	<xsl:if test="record/metadata/schede/*/CD/NCT/NCTN">
		<dc:identifier>
			<xsl:choose>
				 <xsl:when	test="record/metadata/schede/*/RV/RVE/RVEL">
					<xsl:value-of select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS, '-', record/metadata/schede/*/RV/RVE/RVEL)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat(record/metadata/schede/*/CD/NCT/NCTR, record/metadata/schede/*/CD/NCT/NCTN, record/metadata/schede/*/CD/NCT/NCTS)" />
				</xsl:otherwise>
			</xsl:choose>
		</dc:identifier>
	</xsl:if>
	<xsl:if test="record/metadata/schede/MODI/CD">
		<dc:identifier>
			<xsl:choose>
				 <xsl:when	test="record/metadata/schede/MODI/CD/CBC">
					<xsl:value-of select="record/metadata/schede/MODI/CD/CBC" />
				</xsl:when>
				<xsl:when	test="record/metadata/schede/MODI/CD/CDM">
					<xsl:value-of select="record/metadata/schede/MODI/CD/CDM" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="record/metadata/schede/MODI/CD/ACC/ACCC" />
				</xsl:otherwise>
			</xsl:choose>
		</dc:identifier>
	</xsl:if>
	
									<!-- dc:description -->
	<xsl:if test="record/metadata/schede/*/DA/DES/DESO and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESO)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESO)), 'n.r')))">
		<dc:description>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNM/DA/DES/DESO">
					<xsl:choose>
						<xsl:when	test="record/metadata/schede/BNM/LR/LRV">
							<xsl:choose>
								<xsl:when test="not(record/metadata/schede/*/LR/LRV/LRVE)">
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/DA/DES/DESO), ' | ', normalize-space(record/metadata/schede/*/LR/LRV/LRVS), ' , ', normalize-space(record/metadata/schede/*/LR/LRV/LRVR), ' , ', normalize-space(record/metadata/schede/*/LR/LRV/LRVC), ' ( ', normalize-space(record/metadata/schede/*/LR/LRV/LRVP), ' ), ', normalize-space(record/metadata/schede/*/LR/LRV/LRVL))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/DA/DES/DESO), ' | ', normalize-space(record/metadata/schede/*/LR/LRV/LRVS), ' , ', normalize-space(record/metadata/schede/*/LR/LRV/LRVE))" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>									
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DES/DESO)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="record/metadata/schede/BNPE/DA/DES/DESO">
					<xsl:choose>
						<xsl:when	test="not(record/metadata/schede/*/LR/LRV/LRVE)">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/DA/DES/DESO), ' | ', normalize-space(record/metadata/schede/*/LR/LRV/LRVS), ' , ', normalize-space(record/metadata/schede/*/LR/LRV/LRVR), ' , ', normalize-space(record/metadata/schede/*/LR/LRV/LRVC), ' ( ', normalize-space(record/metadata/schede/*/LR/LRV/LRVP), ' ), ', normalize-space(record/metadata/schede/*/LR/LRV/LRVL))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/DA/DES/DESO), ' | ', normalize-space(record/metadata/schede/*/LR/LRV/LRVS), ' , ', normalize-space(record/metadata/schede/*/LR/LRV/LRVE))" />
						</xsl:otherwise>		
					</xsl:choose>
				</xsl:when>
				<xsl:when test="record/metadata/schede/BNZ">
					<xsl:choose>
						<xsl:when	test="not(record/metadata/schede/*/LR/LRV/LRVE)">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/SZ/SZS/SZSP), ' ', normalize-space(record/metadata/schede/*/SZ/SZS/SZSB), ' ', normalize-space(record/metadata/schede/*/SZ/SZS/SZSO), ' ', normalize-space(record/metadata/schede/*/SZ/SZS/SZSF), ' ', normalize-space(record/metadata/schede/*/SZ/SZS/SZSR), ' ', normalize-space(record/metadata/schede/*/SZ/SZS/SZSS), ': ', normalize-space(record/metadata/schede/*/DA/DES/DESO), ' | ', normalize-space(record/metadata/schede/*/LR/LRV/LRVS), ' , ', normalize-space(record/metadata/schede/*/LR/LRV/LRVR), ' , ', normalize-space(record/metadata/schede/*/LR/LRV/LRVC), ' ( ', normalize-space(record/metadata/schede/*/LR/LRV/LRVP), ' ), ', normalize-space(record/metadata/schede/*/LR/LRV/LRVL))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/SZ/SZS/SZSP), ' ', normalize-space(record/metadata/schede/*/SZ/SZS/SZSB), ' ', normalize-space(record/metadata/schede/*/SZ/SZS/SZSO), ' ', normalize-space(record/metadata/schede/*/SZ/SZS/SZSF), ' ', normalize-space(record/metadata/schede/*/SZ/SZS/SZSR), ' ', normalize-space(record/metadata/schede/*/SZ/SZS/SZSS), ': ', normalize-space(record/metadata/schede/*/DA/DES/DESO), ' | ', normalize-space(record/metadata/schede/*/LR/LRV/LRVS), ' , ', normalize-space(record/metadata/schede/*/LR/LRV/LRVE))" />
						</xsl:otherwise>		
					</xsl:choose>
				</xsl:when>
				<xsl:when test="record/metadata/schede/BNP">
					<xsl:choose>
						<xsl:when	test="not(record/metadata/schede/*/LR/LRV/LRVE)">
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/SP/SPS/SPSP), ' ', normalize-space(record/metadata/schede/*/SP/SPS/SPSB), ' ', normalize-space(record/metadata/schede/*/SP/SPS/SPSO), ' ', normalize-space(record/metadata/schede/*/SP/SPS/SPSF), ' ', normalize-space(record/metadata/schede/*/SP/SPS/SPSR), ' ', normalize-space(record/metadata/schede/*/SP/SPS/SPSS), ': ', normalize-space(record/metadata/schede/*/DA/DES/DESO), ' | ', normalize-space(record/metadata/schede/*/LR/LRV/LRVS), ' , ', normalize-space(record/metadata/schede/*/LR/LRV/LRVR), ' , ', normalize-space(record/metadata/schede/*/LR/LRV/LRVC), ' ( ', normalize-space(record/metadata/schede/*/LR/LRV/LRVP), ' ), ', normalize-space(record/metadata/schede/*/LR/LRV/LRVL))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat(normalize-space(record/metadata/schede/*/SP/SPS/SPSP), ' ', normalize-space(record/metadata/schede/*/SP/SPS/SPSH), ' ', normalize-space(record/metadata/schede/*/SP/SPS/SPSB), ' ', normalize-space(record/metadata/schede/*/SP/SPS/SPSO), ' ', normalize-space(record/metadata/schede/*/SP/SPS/SPSF), ' ', normalize-space(record/metadata/schede/*/SP/SPS/SPSR), ' ', normalize-space(record/metadata/schede/*/SP/SPS/SPSS), ': ', normalize-space(record/metadata/schede/*/DA/DES/DESO), ' | ', normalize-space(record/metadata/schede/*/LR/LRV/LRVS), ' , ', normalize-space(record/metadata/schede/*/LR/LRV/LRVE))" />
						</xsl:otherwise>		
					</xsl:choose>
				</xsl:when>
				<xsl:when test="not(record/metadata/schede/*/DA/DES/*)">
					<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DES)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DES/DESO)" />
				</xsl:otherwise>	
			</xsl:choose>
		</dc:description>
	</xsl:if>
	
	<xsl:if test="record/metadata/schede/F/DA/DSO">
		<dc:description>
			<xsl:value-of select="normalize-space(record/metadata/schede/F/DA/DSO)" />
		</dc:description>
	</xsl:if>
	
	<xsl:if test="record/metadata/schede/BDI/DA/DRS">
		<dc:description>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BDI/DA/DRS">
					<xsl:value-of select="normalize-space(record/metadata/schede/BDI/DA/DRS)" />
				</xsl:when>
				<xsl:when test="record/metadata/schede/BDI/DA/DES">
					<xsl:value-of select="normalize-space(record/metadata/schede/BDI/DA/DES)" />
				</xsl:when>
			</xsl:choose>
		</dc:description>
	</xsl:if>
	
	<xsl:if test="record/metadata/schede/PG/OG/OGT/OGTD">
		<dc:description>
			<xsl:value-of select="concat(normalize-space(record/metadata/schede/PG/OG/OGT/OGTD), ' ', normalize-space(record/metadata/schede/PG/OG/OGT/OGTQ))" />
		</dc:description>
	</xsl:if>
	
	<xsl:if test="record/metadata/schede/A/IS">
		<dc:description>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/A/IS/ISP">
					<xsl:value-of select="normalize-space(record/metadata/schede/A/IS/ISP)" />
				</xsl:when>
				<xsl:when test="record/metadata/schede/A/IS/IST">
					<xsl:value-of select="normalize-space(record/metadata/schede/A/IS/IST)" />
				</xsl:when>
			</xsl:choose>
		</dc:description>
	</xsl:if>
	
	<xsl:if test="record/metadata/schede/*/DA/DES">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/DA/DES/DESO and not($sheetType='NU')">
				<xsl:if test="not(lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESO))='nr' or lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESO))='n.r.' or lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESO))='nr (recupero pregresso)')">
					<dc:description>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DES/DESO)" />
					</dc:description>
				</xsl:if>
			</xsl:when>
			<xsl:when test="record/metadata/schede/NU/DA/DES/DESA and not(record/metadata/schede/NU/DA/DES/DESO)">
				<dc:description>
					<xsl:value-of select="concat('Dritto: ', normalize-space(record/metadata/schede/NU/DA/DES/DESA), '. Rovescio: ', normalize-space(record/metadata/schede/NU/DA/DES/DESM))"/>
				</dc:description>
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/DA/DES/DESS and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESS)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/DA/DES/DESS)), 'n.r'))) and not(record/metadata/schede/*/DA/DES/DESO)">
				<dc:description>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DES/DESS)"/>
				</dc:description>
			</xsl:when>
			<xsl:when test="not(record/metadata/schede/*/DA/DES/*)">
				<dc:description>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DES)" />
				</dc:description>
			</xsl:when>
		</xsl:choose>
	</xsl:if>


										<!-- dc:rights -->
	<xsl:if test="record/metadata/schede/*/TU/CDG/CDGG">
		<dc:rights>
			<xsl:value-of select="record/metadata/schede/*/TU/CDG/CDGG" />
		</dc:rights>
	</xsl:if>
	
											<!-- dc:coverage -->
	<xsl:if test="record/metadata/schede/*/LC/PVC">
		<dc:coverage>
			<xsl:choose>
				<xsl:when test="./PVCR">
					<xsl:value-of select="concat(record/metadata/schede/*/LC/PVC/PVCR, ' (', record/metadata/schede/*/LC/PVC/PVCP, ') - ', record/metadata/schede/*/LC/PVC/PVCC)" />
            	</xsl:when>
            	<xsl:otherwise>
            		<xsl:value-of select="concat(record/metadata/schede/*/LC/PVC/PVCC, ' (', record/metadata/schede/*/LC/PVC/PVCP, ')')" />
            	</xsl:otherwise>
            </xsl:choose>
		</dc:coverage>
	</xsl:if>

									<!-- dc:date -->
	<xsl:for-each select="record/metadata/schede/*/DT">
		<xsl:if test="./DTS">
			<xsl:if test="./DTS/DTSI or ./DTS/DTSF">
				<xsl:variable name="startDate">
					<xsl:choose>
						<xsl:when test="./DTS/DTSV">
							<xsl:value-of select="concat(normalize-space(./DTS/DTSV), ' ', normalize-space(./DTS/DTSI))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(./DTS/DTSI)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="endDate">
					<xsl:choose>
						<xsl:when test="./DTS/DTSL">
							<xsl:value-of select="concat(normalize-space(./DTS/DTSL), ' ', normalize-space(./DTS/DTSF))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(./DTS/DTSF)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<dc:date>
			    		<xsl:value-of select="concat($startDate, '-',  $endDate)" />
				</dc:date>
			</xsl:if>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/A/RE">
	<xsl:if test="./REV/REVI or ./REL/RELI">
		<xsl:variable name="startDate">
			<xsl:choose>
				<xsl:when test="./REL/RELX">
					<xsl:value-of select="concat(normalize-space(./REL/RELI), ' ', normalize-space(./REL/RELX))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(./REL/RELI)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="endDate">
			<xsl:choose>
				<xsl:when test="./REV/REVX">
					<xsl:value-of select="concat(normalize-space(./REV/REVI), ' ', normalize-space(./REV/REVX))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="normalize-space(./REV/REVI)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<dc:date>
				<xsl:value-of select="concat($startDate, '-',  $endDate)" />
		</dc:date>
	</xsl:if>
	</xsl:for-each>
								

							<!-- dcterms:bibliographicCitation -->
<xsl:for-each select="record/metadata/schede/*/DO/BIB">
<xsl:if test="./BIBA and ./BIBD">
	<dcterms:bibliographicCitation>
		<xsl:choose>
			<xsl:when test="./BIBX">
				<xsl:value-of select="concat(normalize-space(./BIBX), ': ', normalize-space(./BIBA), ' - ', normalize-space(./BIBD))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat(normalize-space(./BIBA), ' - ', normalize-space(./BIBD))" />
			</xsl:otherwise>
		</xsl:choose>
	</dcterms:bibliographicCitation>
</xsl:if>
</xsl:for-each>							

	
								<!-- dc:format -->
	<xsl:for-each select="record/metadata/schede/*/MT/MIS">	
		<xsl:variable name="measurement-collection">
			<xsl:choose>
				<xsl:when test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00') and ./MISP" >
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', arco-fn:urify(normalize-space(./MISP)))" />
				</xsl:when>
				<xsl:when test="($sheetVersion='4.00_ICCD0' or $sheetVersion='4.00') and not(./MISP)" >
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<dc:format>
			<xsl:attribute name="rdf:resource">
				<xsl:value-of select="$measurement-collection" />
			</xsl:attribute>
		</dc:format>
	</xsl:for-each>
	
	
									<!-- pico:materialAndTechnique -->	
	<xsl:if test="not(record/metadata/schede/*/MT/MTC/*) and (not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC)), 'n.r')))">
		<xsl:if test="record/metadata/schede/*/MT/MTC">
			<pico:materialAndTechnique>
		 	    	<xsl:value-of select="record/metadata/schede/*/MT/MTC" />
			</pico:materialAndTechnique>
		</xsl:if>
	</xsl:if>
	<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/OAC/MT/MTC/MTCI)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/OAC/MT/MTC/MTCI)), 'n.r'))">
		<xsl:if test="record/metadata/schede/OAC/MT/MTC/MTCI">
			<pico:materialAndTechnique>
		 	    	<xsl:value-of select="record/metadata/schede/OAC/MT/MTC/MTCI" />
            </pico:materialAndTechnique>
 		</xsl:if>
	</xsl:if>	
	<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCM)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCM)), 'n.r'))">
		<xsl:if test="record/metadata/schede/*/MT/MTC/MTCM and (not(record/metadata/schede/*/MT/MTC/MTCP) or record/metadata/schede/*/MT/MTC/MTCP='intero bene' or record/metadata/schede/*/MT/MTC/MTCP='integrale' or record/metadata/schede/*/MT/MTC/MTCP='tutta' or record/metadata/schede/*/MT/MTC/MTCP='totale') or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'nr')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'n.r')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'intero')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'intera')) or (starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCP)), 'esemplar'))">
			<pico:materialAndTechnique>
					<xsl:value-of select="record/metadata/schede/*/MT/MTC/MTCM" />
			</pico:materialAndTechnique>
		</xsl:if>
	</xsl:if>
	<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/VeAC/MT/MTC/MTCF)), 'nr'))">
		<xsl:if test="record/metadata/schede/VeAC/MT/MTC/MTCF">
			<pico:materialAndTechnique>
 	            	<xsl:value-of select="record/metadata/schede/*/MT/MTC/MTCF" />
            </pico:materialAndTechnique>
		</xsl:if>
	</xsl:if>	
	<xsl:if test="not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/*/MT/MTC/MTCT)), 'n.r'))">
		<xsl:if test="record/metadata/schede/*/MT/MTC/MTCT">
			<pico:materialAndTechnique>
				<xsl:value-of select="record/metadata/schede/*/MT/MTC/MTCT" />
			</pico:materialAndTechnique>
		</xsl:if>
	</xsl:if>

						<!-- subject con Pico -->
<xsl:if test="$sheetType='RA'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#reperti_archeologici" /> </xsl:if>
<xsl:if test="$sheetType='OA'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#opere_d_arte_visiva" /> </xsl:if>
<xsl:if test="$sheetType='F'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#fotografie" /> </xsl:if>
<xsl:if test="$sheetType='SI'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#aree_archeologiche" /> </xsl:if>
<xsl:if test="$sheetType='SAS'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#saggi_archeologici_stratigrafici" /> </xsl:if>
<xsl:if test="$sheetType='CA'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#aree_archeologiche" /> </xsl:if>
<xsl:if test="$sheetType='MA'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#monumenti_archeologici" /> </xsl:if>
<xsl:if test="$sheetType='AT'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#reperti_antropologici" /> </xsl:if>
<xsl:if test="$sheetType='TMA'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#beni_archeologici" /> </xsl:if>
<xsl:if test="$sheetType='NU'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#monete_e_medaglie" /> </xsl:if>
<xsl:if test="$sheetType='OAC'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#opere_d_arte_visiva" /> </xsl:if>
<xsl:if test="$sheetType='D'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.2#disegni" /> </xsl:if>
<xsl:if test="$sheetType='MI'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.2#stampe_incisioni_matrici" /> </xsl:if>
<xsl:if test="$sheetType='S'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.2#stampe_incisioni_matrici" /> </xsl:if>
<xsl:if test="$sheetType='VeAC'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#abbigliamento_e_accessori" /> </xsl:if>
<xsl:if test="$sheetType='A'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#beni_architettonici" /> </xsl:if>
<xsl:if test="$sheetType='PG'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#giardini_e_parchi" /> </xsl:if>
<xsl:if test="$sheetType='BDI'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#beni_immateriali_della_tradizione_e_del_folklore" /> </xsl:if>
<xsl:if test="$sheetType='BDM'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#beni_materiali_della_tradizione_e_del_folklore" /> </xsl:if>
<xsl:if test="$sheetType='BNB'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.3#piante" /> </xsl:if>
<xsl:if test="$sheetType='BNM'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.3#minerali" /> </xsl:if>
<xsl:if test="$sheetType='BNP'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.3#fossili" /> </xsl:if>
<xsl:if test="$sheetType='BNPE '"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.3#rocce" /> </xsl:if>
<xsl:if test="$sheetType='BNZ'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.3#animali" /> </xsl:if>
<xsl:if test="$sheetType='E'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#beni_materiali_della_tradizione_e_del_folklore" /> </xsl:if>
<xsl:if test="$sheetType='PST'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#strumenti_scientifici" /> </xsl:if>
<xsl:if test="$sheetType='SM'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#strumenti_musicali" /> </xsl:if>
<xsl:if test="$sheetType='SMO'"> <dc:subject rdf:resource="http://culturaitalia.it/pico/thesaurus/4.1#strumenti_musicali" /> </xsl:if>




				<!-- pico:preview
<xsl:variable name="image-link" select="arco-fn:find-image($item)" />
	<xsl:if test="$image-link != ''">
		<pico:preview>
        	<xsl:attribute name="rdf:resource">
            	<xsl:value-of	select="$image-link" />
			</xsl:attribute>
		</pico:preview>
	</xsl:if>
							
					
					 -->
					
					<!-- dc:subject -->
	
	<xsl:for-each select="record/metadata/schede/*/*/SGT">
		<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
			<dc:subject>
				<xsl:if test="./SGTI">
					<xsl:choose>
						<xsl:when test="./SGTD">
							<xsl:value-of select="concat(./SGTI, ', ', ./SGTD)" />
						</xsl:when>
						<xsl:when test="./SGTT and not (./SGTD)">
							<xsl:choose>
								<xsl:when test="record/metadata/schede/OG/CLS" >
									<xsl:value-of select="concat(./SGTI, ', ', ./SGTT, ', ', record/metadata/schede/OG/CLS)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(./SGTI, ', ', ./SGTT)" />
								</xsl:otherwise>
							</xsl:choose>						
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="./SGTI" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</dc:subject>
		</xsl:if>
	</xsl:for-each>
	
	<xsl:if test="record/metadata/schede/*/OG/OGT and not (record/metadata/schede/*/*/SGT or $sheetType='AT' or $sheetType='MODI' or $sheetType='NU' or $sheetType='BDI' or $sheetType='BDM' or $sheetType='BNB' or $sheetType='BNM' or $sheetType='BNP' or $sheetType='BNPE' or $sheetType='BNPL' or $sheetType='BNZ')">
		<dc:subject>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/*/OG/OGT/OGTN">
					<xsl:value-of select="record/metadata/schede/*/OG/OGT/OGTN" />
				</xsl:when>
				<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC and not (record/metadata/schede/*/OG/OGT/OGTN)">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/VeAC/OG/OGT/OGTD">
							<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTD, ' ', record/metadata/schede/*/OG/OGT/OGTF, ' ', record/metadata/schede/*/OG/OGT/OGTG, '. ', record/metadata/schede/*/OG/OGT/OGTC, '. ', record/metadata/schede/*/OG/OGT/OGTN)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="record/metadata/schede/*/OG/OGT/OGTC" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="record/metadata/schede/VeAC/OG/OGT/OGTD">
					<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTD, ' ', record/metadata/schede/*/OG/OGT/OGTF, ' ', record/metadata/schede/*/OG/OGT/OGTG, '. ', record/metadata/schede/*/OG/OGT/OGTN)" />
				</xsl:when>
				<xsl:when test="$sheetType='A' or $sheetType='PG' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='1.00_ICCD0')">
					<xsl:choose>
						<xsl:when test="record/metadata/schede/*/OG/OGT/OGTD">
							<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTD, ' (', record/metadata/schede/*/OG/OGT/OGTT, ' ', record/metadata/schede/*/OG/OGT/OGTQ, ')')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat( record/metadata/schede/*/OG/OGT/OGTT, ' ', record/metadata/schede/*/OG/OGT/OGTQ)" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="record/metadata/schede/*/OG/OGT/OGTD" />
				</xsl:otherwise>
			</xsl:choose>
		</dc:subject>
	</xsl:if>
	<xsl:if test="$sheetType='AT'">
		<dc:subject>
			<xsl:value-of select="concat(record/metadata/schede/*/OG/OGT/OGTT, ' ', record/metadata/schede/*/OG/OGT/OGTM)" />
		</dc:subject>
		
	</xsl:if>
	<xsl:if test="$sheetType='BDI'">
		<dc:subject>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BDI/DB/DBL">
					<xsl:value-of select="concat(record/metadata/schede/BDI/DB/DBD, ', ', record/metadata/schede/BDI/DB/DBL)" />	
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="record/metadata/schede/BDI/DB/DBD" />
				</xsl:otherwise>
			</xsl:choose>
		</dc:subject>
	</xsl:if>
	<xsl:if test="$sheetType='BDM' and not (record/metadata/schede/BDM/*/SGT/SGTT)">
		<dc:subject>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BDM/OG/OGD/OGDN">
					<xsl:value-of select="record/metadata/schede/BDM/OG/OGD/OGDN" />
				</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="record/metadata/schede/BDM/OG/OGT/OGTD" />
			</xsl:otherwise>
			</xsl:choose>
		</dc:subject>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/NU/DA/DES/DESU">
		<xsl:if test="not(starts-with(lower-case(normalize-space(.)), 'nr')) and not(starts-with(lower-case(normalize-space(.)), 'n.r'))">
			<dc:subject>
	            	<xsl:value-of select="." />
			</dc:subject>
		</xsl:if>
	</xsl:for-each>	
	<xsl:if test="$sheetType='MODI'">
		<dc:subject>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/*/OG/OGN">
					<xsl:value-of select="record/metadata/schede/*/OG/OGN" />
				</xsl:when>
				<xsl:when test="record/metadata/schede/MODI/OG/OGT">
					<xsl:value-of select="concat(record/metadata/schede/MODI/OG/OGD, ' ', record/metadata/schede/MODI/OG/OGT)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="record/metadata/schede/MODI/OG/OGD" />
				</xsl:otherwise>
			</xsl:choose>
		</dc:subject>
	</xsl:if>
	</rdf:Description>				
					

	</xsl:if>
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>