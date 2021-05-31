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
xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="2.0">

	<xsl:param name="item" />
	<xsl:param name="NS" />
	<!-- xsl:variable name="NS" select="'https://w3id.org/arco/resource/'" /-->
	<xsl:param name="SOURCE" select="''"/>
	
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
	
	<xsl:template name="CamelCase1">
		<xsl:param name="text" />
		<xsl:value-of select="translate(($text),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" />
	</xsl:template>
	
	<xsl:template name="lrv">
		<xsl:for-each select="record/metadata/schede/*/LR/LRV"><xsl:value-of select="concat(normalize-space(LRVS), ' , ', normalize-space(LRVR), ' , ', normalize-space(LRVC), ' ( ', normalize-space(LRVP), ' ), ', normalize-space(LRVL))" /><xsl:if test="not(position()=last())"><xsl:text> ; </xsl:text></xsl:if></xsl:for-each>
	</xsl:template>
	<xsl:template name="lrv2">
		<xsl:for-each select="record/metadata/schede/*/LR/LRV"><xsl:value-of select="normalize-space(string-join(LRVS|LRVE,' , '))" /><xsl:if test="not(position()=last())"><xsl:text> ; </xsl:text></xsl:if></xsl:for-each>
	</xsl:template>
	<xsl:template name="sourceParser">
		<xsl:param name="source" select="$SOURCE"/>
		<xsl:param name="itemURI"/>
		<xsl:choose>
			<xsl:when test="contains($source,'$(IDENTIFIER)')">
				<xsl:call-template name="sourceParser">
					<xsl:with-param name="source" select="concat(substring-before($source,'$(IDENTIFIER)'),$itemURI,substring-after($source,'$(IDENTIFIER)'))"/>
					<xsl:with-param name="itemURI" select="$itemURI"/>
				</xsl:call-template> 
			</xsl:when>
			<xsl:when test="contains($source,'$(SYSCODE)')">
				<xsl:call-template name="sourceParser">
					<xsl:with-param name="source" select="concat(substring-before($source,'$(SYSCODE)'),$item,substring-after($source,'$(SYSCODE)'))"/>
					<xsl:with-param name="itemURI" select="$itemURI"/>
				</xsl:call-template> 
			</xsl:when>
			<xsl:when test="contains($source,'$(PROPERTYTYPE)')">
				<xsl:call-template name="sourceParser">
					<xsl:with-param name="source" select="concat(substring-before($source,'$(PROPERTYTYPE)'),arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)),substring-after($source,'$(PROPERTYTYPE)'))"/>
					<xsl:with-param name="itemURI" select="$itemURI"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$source"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
		
<xsl:template match="/">
	<rdf:RDF>
	<xsl:if test="not($sheetType='CF' or $sheetType='CG' or $sheetType='AUT' or $sheetType='DSC' or $sheetType='BIB' or $sheetType='RCG') and not(administrativeDataRecord/metadata)" >
	
	<xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version" />
	<xsl:variable name="cp-name" select="''" />
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
	<xsl:variable name="culturalProperty">
		<xsl:choose>
			<xsl:when test="$sheetType='MODI'">
				<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType(record/metadata/schede/MODI/OG/AMB)), '/', $itemURI)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="culturalPropertyComponent" select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI, '-component')" />
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
	
	<xsl:variable name="dcType">
	<xsl:choose>
		<xsl:when test="record/metadata/schede/AT/OG/OGT/OGTT and (not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/OG/OGT/OGTT)), 'nr')) and not(starts-with(lower-case(normalize-space(record/metadata/schede/AT/OG/OGT/OGTT)), 'n.r'))) ">
			<xsl:value-of select="concat($NS, 'Type/', arco-fn:arcofy(concat(normalize-space(lower-case(record/metadata/schede/AT/OG/OGT/OGTT)), normalize-space(lower-case(record/metadata/schede/AT/OG/OGT/OGTP)))))" />
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

	<rdf:Description>
		<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
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
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="concat(./OGTD, ' ', ./OGTT)" />
						</xsl:call-template>
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
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="concat(./OGTD, '-', ./OGTQ)" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="./OGTD">
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="./OGTD" />
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</dc:type>
		</xsl:when>
		<xsl:when test="$sheetType='A' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0')">
			<dc:type>
				<xsl:choose>
					<xsl:when test="./OGTQ">
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="concat(./OGTT, '-', ./OGTQ)" />
						</xsl:call-template>
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
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="concat(./OGTD, ' ', ./OGTK)" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text"  select="./OGTD" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</dc:type>					
		</xsl:when>
		<xsl:when test="$sheetType='BNB' and (./OGTD and starts-with(lower-case(normalize-space(./OGTD)), 'erbario'))">
			<dc:type>
				<xsl:choose>
					<xsl:when test="./OGTR">
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="concat(./OGTD, ' ', ./OGTR)" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text"  select="./OGTD" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</dc:type>					
		</xsl:when>
		<xsl:when test="$sheetType='BNB' and (./OGTD and starts-with(lower-case(normalize-space(./OGTD)), 'collezione'))">
			<dc:type>
				<xsl:choose>
					<xsl:when test="./OGTZ">
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text"  select="concat(./OGTD, ' ', ./OGTZ)" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="./OGTD" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</dc:type>					
		</xsl:when>
		<xsl:when test="$sheetType='BNB' and (./OGTD and starts-with(lower-case(normalize-space(./OGTD)), 'contenitore'))">
			<dc:type>
				<xsl:choose>
					<xsl:when test="./OGTO">
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="concat(./OGTD, ' ', ./OGTO)" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="CamelCase1">
							<xsl:with-param name="text" select="./OGTD" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</dc:type>					
		</xsl:when>
	</xsl:choose>
	</xsl:for-each>
	</xsl:if>
	<xsl:if test="record/metadata/schede/MODI/OG">
		<dc:type>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/MODI/OG/OGT">
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="concat(record/metadata/schede/MODI/OG/OGD, ' ', record/metadata/schede/MODI/OG/OGT)" />
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="CamelCase1">
						<xsl:with-param name="text" select="record/metadata/schede/MODI/OG/OGD" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
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
	<!--  TODO
	<dc:source>
		<xsl:attribute name="rdf:resource">
			<xsl:value-of select="concat($SOURCE, $item)" />
		</xsl:attribute>
	</dc:source> -->
	
	<xsl:if test="string-length($SOURCE)">
	<dc:source>
		<xsl:attribute name="rdf:resource">
		    <xsl:choose>
		    	<xsl:when test="$sheetType='MODI'">
					<xsl:value-of select="concat('http://catalogo-old.beniculturali.it/oaitarget/OAIHandler?verb=GetRecord&amp;metadataPrefix=oai_dc&amp;identifier=oai:oaicat.iccd.org:@',$item,'@/xml/altre_normative')" />
		    	</xsl:when>
		    	<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="contains($SOURCE,'$(')">
							<xsl:call-template name="sourceParser">
								<xsl:with-param name="itemURI" select="$itemURI"/>
							</xsl:call-template>
						</xsl:when>	
						<xsl:otherwise>
							<xsl:value-of select="concat($SOURCE, $item)" />
						</xsl:otherwise>
					</xsl:choose>    
		    	</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</dc:source>
	</xsl:if>
												<!-- dc:title -->	

	<xsl:if test="record/metadata/schede/*/OG">
		<dc:title>
			<xsl:if test="record/metadata/schede/*/OG/SGT/SGTT">
				<xsl:choose><!-- molteplicità SGTI SGTT eg:ICCD13074440 ICCD11324919 -->
					<xsl:when test="record/metadata/schede/*/OG/SGT/SGTI">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
								<xsl:value-of select="concat(string-join(record/metadata/schede/*/OG/SGT/SGTT,', '), ', ', string-join(record/metadata/schede/*/OG/SGT/SGTI,', '), ' (', record/metadata/schede/*/OG/OGT/OGTD, ', ', record/metadata/schede/*/OG/OGT/OGTV, ')')" />	
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(string-join(record/metadata/schede/*/OG/SGT/SGTT,', '), ', ', string-join(record/metadata/schede/*/OG/SGT/SGTI,', '), ' (', record/metadata/schede/*/OG/OGT/OGTD, ')')" />
							</xsl:otherwise>
						</xsl:choose>	
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
								<xsl:value-of select="concat(string-join(record/metadata/schede/*/OG/SGT/SGTT,', '), ' (', record/metadata/schede/*/OG/OGT/OGTD, ', ', record/metadata/schede/*/OG/OGT/OGTV, ')')" />	
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(string-join(record/metadata/schede/*/OG/SGT/SGTT,', '), ' (', record/metadata/schede/*/OG/OGT/OGTD, ')')" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/OG/OGD/OGDN and not (record/metadata/schede/*/OG/SGT/SGTT)">
				<xsl:variable name="ogdn" select="string-join(record/metadata/schede/*/OG/OGD/OGDN,', ')"/><!-- OGDT? eg:ICCD13124957 -->
				<xsl:choose>
					<xsl:when test="record/metadata/schede/*/OG/OGT/OGTV">
						<xsl:value-of select="concat($ogdn, ' (', record/metadata/schede/*/OG/OGT/OGTD, ', ', record/metadata/schede/*/OG/OGT/OGTV, ')')" />
					</xsl:when>
					<xsl:when test="record/metadata/schede/*/OG/CTG">
						<xsl:choose>
							<xsl:when test="record/metadata/schede/*/OG/OGT/OGTT">
								<xsl:value-of select="concat($ogdn, ' (', record/metadata/schede/*/OG/OGT/OGTD, ' ', record/metadata/schede/*/OG/OGT/OGTT, ', ', string-join(record/metadata/schede/*/OG/CTG,', '), ')')" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($ogdn, ' (', record/metadata/schede/*/OG/OGT/OGTD, ', ', string-join(record/metadata/schede/*/OG/CTG,', '), ')')" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($ogdn, ' (', record/metadata/schede/*/OG/OGT/OGTD, ')')" />
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
			<xsl:if test="not($sheetType='A' or $sheetType='PG' and ($sheetVersion='2.00' or $sheetVersion='2.00_ICCD0' or $sheetVersion='1.00' or $sheetVersion='1.00_ICCD0'))">
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
	<xsl:if test="record/metadata/schede/*/DA/DES/DESO[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
		<xsl:variable name="deso" select="normalize-space(record/metadata/schede/*/DA/DES/DESO)"/>
		<dc:description><!-- multiple values (SPS,LRV) eg: ICCD12087343 ICCD12085339 -->
		<xsl:choose>
			<xsl:when test="record/metadata/schede/BNM/DA/DES/DESO">
				<xsl:choose>
					<xsl:when	test="record/metadata/schede/BNM/LR/LRV">
						<xsl:choose>
							<xsl:when test="not(record/metadata/schede/*/LR/LRV/LRVE)">
								<xsl:variable name="lrv"><xsl:call-template name="lrv"/></xsl:variable>
								<xsl:value-of select="concat($deso, ' | ', $lrv)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:variable name="lrv"><xsl:call-template name="lrv2"/></xsl:variable>
								<xsl:value-of select="concat($deso, ' | ', $lrv)" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>									
					<xsl:otherwise>
						<xsl:value-of select="$deso" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="record/metadata/schede/BNPE/DA/DES/DESO">
				<xsl:choose>
					<xsl:when test="not(record/metadata/schede/*/LR/LRV/LRVE)">
						<xsl:variable name="lrv"><xsl:call-template name="lrv"/></xsl:variable>
						<xsl:value-of select="concat($deso, ' | ', $lrv)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="lrv"><xsl:call-template name="lrv2"/></xsl:variable>
						<xsl:value-of select="concat($deso, ' | ', $lrv)" />
					</xsl:otherwise>		
				</xsl:choose>
			</xsl:when>
			<xsl:when test="record/metadata/schede/BNZ">
				<xsl:variable name="szs"><xsl:for-each select="record/metadata/schede/*/SZ/SZS"><xsl:value-of select="normalize-space(string-join(SZSP|SZSB|SZSO|SZSF|SZSR|SZSS,' '))" /><xsl:if test="not(position()=last())"><xsl:text> ; </xsl:text></xsl:if></xsl:for-each></xsl:variable>
				<xsl:choose>
					<xsl:when test="not(record/metadata/schede/*/LR/LRV/LRVE)">
						<xsl:variable name="lrv"><xsl:call-template name="lrv"/></xsl:variable>
						<xsl:value-of select="concat($szs, ': ', $deso, ' | ', $lrv)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="lrv"><xsl:call-template name="lrv2"/></xsl:variable>
						<xsl:value-of select="concat($szs, ': ', $deso, ' | ', $lrv)" />
					</xsl:otherwise>		
				</xsl:choose>
			</xsl:when>
			<xsl:when test="record/metadata/schede/BNP">
				<xsl:variable name="sps"><xsl:for-each select="record/metadata/schede/*/SP/SPS"><xsl:value-of select="normalize-space(string-join(SPSP|SPSH|SPSB|SPSO|SPSF|SPSR|SPSS,' '))" /><xsl:if test="not(position()=last())"><xsl:text> ; </xsl:text></xsl:if></xsl:for-each></xsl:variable>
				<xsl:choose>
					<xsl:when test="not(record/metadata/schede/*/LR/LRV/LRVE)">
						<xsl:variable name="lrv"><xsl:call-template name="lrv"/></xsl:variable>
						<xsl:value-of select="concat($sps, ': ', $deso, ' | ', $lrv)" />
					</xsl:when>
					<xsl:otherwise>
                        <xsl:variable name="lrv"><xsl:call-template name="lrv2"/></xsl:variable>
						<xsl:value-of select="concat($sps, ': ', $deso, ' | ', $lrv)" />
					</xsl:otherwise>		
				</xsl:choose>
			</xsl:when>
			<xsl:when test="not(record/metadata/schede/*/DA/DES/*)">
				<xsl:value-of select="normalize-space(record/metadata/schede/*/DA/DES)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$deso" />
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
			<xsl:when test="record/metadata/schede/*/DA/DES/DESS[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))] and not(record/metadata/schede/*/DA/DES/DESO)">
				<xsl:for-each select="record/metadata/schede/*/DA/DES/DESS[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- allow multiple values es: ICCD11389099 -->
					<dc:description>
						<xsl:value-of select="normalize-space()"/>
					</dc:description>
				</xsl:for-each>
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
	<xsl:if test="not(record/metadata/schede/*/MT/MTC/*)">
		<xsl:for-each select="record/metadata/schede/*/MT/MTC[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- allow multiple values es: ICCD14711365 -->
			<pico:materialAndTechnique>
				<xsl:value-of select="." />
			</pico:materialAndTechnique>
		</xsl:for-each>
	</xsl:if>	
	<xsl:for-each select="record/metadata/schede/OAC/MT/MTC/MTCI[not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- allow multiple values es: ICCD11324966 -->
		<pico:materialAndTechnique>
		    <xsl:value-of select="." />
		</pico:materialAndTechnique>
	</xsl:for-each>	
	<xsl:for-each select="record/metadata/schede/*/MT/MTC/MTCM[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r')) and not(../MTCP[.='intero bene' or .='integrale' or .='tutta' or .='totale' or starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r') or starts-with(lower-case(normalize-space()), 'intero') or starts-with(lower-case(normalize-space()), 'intera') or starts-with(lower-case(normalize-space()), 'esemplar')])]"><!-- allow multiple values es: ICCD13689315 -->
		<pico:materialAndTechnique>
			<xsl:value-of select="." />
		</pico:materialAndTechnique>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/VeAC/MT/MTC/MTCF[not(starts-with(lower-case(normalize-space()), 'nr'))]"><!-- allow multiple values es: ICCD11268160 -->
		<pico:materialAndTechnique>
           	<xsl:value-of select="." />
		</pico:materialAndTechnique>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/MT/MTC/MTCT[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]"><!-- allow multiple values es: ICCD13689315 -->
		<pico:materialAndTechnique>
			<xsl:value-of select="." />
		</pico:materialAndTechnique>
	</xsl:for-each>	

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
					<xsl:variable name="sgti" select="string-join(SGTI,' ; ')" /><!-- multiple SGTI eg:ICCD13074493 -->
					<xsl:choose>
						<xsl:when test="./SGTD">
							<xsl:value-of select="concat($sgti, ', ', ./SGTD)" />   
						</xsl:when>
						<xsl:when test="./SGTT and not (./SGTD)">
							<xsl:variable name="sgtt" select="string-join(SGTT,' ; ')" /><!-- multiple SGTT eg:ICCD11314516 -->
							<xsl:choose>
								<xsl:when test="record/metadata/schede/OG/CLS" >
									<xsl:value-of select="concat($sgti, ', ', $sgtt, ', ', record/metadata/schede/OG/CLS)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat($sgti, ', ', $sgtt)" />
								</xsl:otherwise>
							</xsl:choose>						
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$sgti" />
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
			<xsl:value-of select="string-join(record/metadata/schede/BDI/DB/DBD|record/metadata/schede/BDI/DB/DBL,', ')" /><!-- multiple values es: ICCD11172428 -->
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