<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-clo="https://w3id.org/arco/ontology/clothing-description/"
	xmlns:arco-cd="https://w3id.org/arco/ontology/context-description/"
	xmlns:arco-location="https://w3id.org/arco/ontology/location/"
	xmlns:l0="https://w3id.org/italia/onto/l0/">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template name="CamelCase">
		<xsl:param name="text" />
		<xsl:choose>
			<xsl:when test="contains($text,' ')">
				<xsl:call-template name="CamelCaseWord">
					<xsl:with-param name="text" select="substring-before($text,' ')" />
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text" select="substring-after($text,' ')" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="CamelCaseWord">
					<xsl:with-param name="text" select="$text" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="CamelCaseWord">
		<xsl:param name="text" />
		<xsl:value-of select="translate(substring($text,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
		<xsl:value-of select="translate(substring($text,2,string-length($text)-1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
	</xsl:template>
	<xsl:template name="CamelCase1">
		<xsl:param name="text" />
		<xsl:value-of select="translate(($text),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')" />
	</xsl:template>
	<!-- xsl:variable name="NS"	select="$NS,''" /-->
	<xsl:param name="NS" />
	<xsl:template match="/">
		<rdf:RDF>
			<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
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
					<xsl:when test="record/metadata/schede/*/CD/CDM">
						<xsl:choose>
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
					<xsl:when test="$sheetType='AR'">
						<xsl:value-of select="concat($NS, 'ArchitecturalOrLandscapeHeritage/', $itemURI)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:if test="$sheetType='AR'">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="$culturalProperty" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/construction-description/Construction'" />
						</xsl:attribute>
					</rdf:type>
					<xsl:if test="record/metadata/schede/AR/LC/PVZ">
						<arco-location:hasTypeOfContext>
							<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="lower-case(normalize-space(.)) = 'contesto urbano'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/UrbanContext'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(.)) = 'contesto suburbano'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/SuburbanContext'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(.)) = 'contesto periuburbano'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/SuburbanContext'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(.)) = 'contesto territoriale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/TerritorialContext'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(.)) = 'contesto rurale'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/RuralContext'" />
									</xsl:when>
									<xsl:when test="lower-case(normalize-space(.)) = 'contesto subacqueo'">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/UnderwaterContext'" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'TypeOfContext/', arco-fn:urify(normalize-space(PVZ)))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</arco-location:hasTypeOfContext>
					</xsl:if>
					<xsl:for-each select="record/metadata/schede/*/US/USO">
						<arco-cd:hasUse>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-historical-use-', position())" />
							</xsl:attribute>
						</arco-cd:hasUse>
					</xsl:for-each>
					<!--COSE VECCHIE DA CANCELLARE VEAC-->
					<xsl:if test="record/metadata/schede/VeAC/OG/OGT/OGTG">
						<arco-clo:intendedUser>
							<xsl:value-of select="record/metadata/schede/VeAC/OG/OGT/OGTG" />
						</arco-clo:intendedUser>
					</xsl:if>
				</rdf:Description>
				<!--Historical Use as individual-->
				<xsl:for-each select="record/metadata/schede/*/US/USO">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-historical-use-', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Use'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Historical use ', position(), ' of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Historical use ', position(), ' of cultural property ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Uso storico ', position(), ' del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Uso storico ', position(), ' del bene culturale ', $itemURI)" />
						</l0:name>
						<xsl:for-each select=". [not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
							<!-- allow multiple values eg:ICCD14295730  -->
							<arco-cd:hasUseFunction>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(.))" />
								</xsl:attribute>
							</arco-cd:hasUseFunction>
						</xsl:for-each>
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/HistoricalUse'" />
							</xsl:attribute>
						</arco-core:hasType>
					</rdf:Description>
					<!-- usefunction as an individual -->
					<xsl:for-each select=". [not(starts-with(lower-case(normalize-space()), 'nr') or starts-with(lower-case(normalize-space()), 'n.r'))]">
						<!-- allow multiple values eg:ICCD14295730  -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'UseFunction/', arco-fn:urify(.))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/UseFunction'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
						</rdf:Description>
					</xsl:for-each>
				</xsl:for-each>
				<!-- NaturalEnvironment as individual -->
				<xsl:if test="record/metadata/schede/*/CA">
					<!--<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-current')" />
						</xsl:attribute>
						<arco-location:hasNaturalEnvironment>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI)" />
							</xsl:attribute>
						</arco-location:hasNaturalEnvironment>
					</rdf:Description>-->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI)" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/location/NaturalEnvironment'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Ambiente naturale relativo al bene ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Ambiente naturale relativo al bene ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Natural environment of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Natural environment of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="record/metadata/schede/*/CA/CAB">
							<arco-core:hasType>
								<xsl:value-of select="concat($NS, 'NaturalEnvironmentType/', arco-fn:urify(normalize-space(record/metadata/schede/*/CA/CAB)))" />
							</arco-core:hasType>
						</xsl:if>
						<xsl:if test="record/metadata/schede/*/CA/CAA">
							<arco-core:description xml:lang="it">
								<xsl:value-of select="record/metadata/schede/*/CA/CAA" />
							</arco-core:description>
						</xsl:if>
						<xsl:if test="record/metadata/schede/*/CA/CAS">
							<arco-location:historicalEnvironmentContextDescription>
								<xsl:value-of select="record/metadata/schede/*/CA/CAS" />
							</arco-location:historicalEnvironmentContextDescription>
						</xsl:if>
						<xsl:if test="record/metadata/schede/*/CA/CAD">
							<arco-location:naturalWaterArrangement>
								<xsl:value-of select="record/metadata/schede/*/CA/CAD" />
							</arco-location:naturalWaterArrangement>
						</xsl:if>
						<xsl:if test="record/metadata/schede/*/CA/CAN">
							<arco-core:note>
								<xsl:value-of select="record/metadata/schede/*/CA/CAN" />
							</arco-core:note>
						</xsl:if>
						<xsl:if test="record/metadata/schede/*/CA/CAT">
							<arco-location:hasClimateSituation>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'ClimateSituation/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-location:hasClimateSituation>
						</xsl:if>
						<xsl:for-each select="record/metadata/schede/*/CA/IQA">
							<arco-location:hasEnvironmentalDamage>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'EnvironmentalDamage/Pollution/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-location:hasEnvironmentalDamage>
						</xsl:for-each>
						<xsl:for-each select="record/metadata/schede/*/CA/DSI">
							<arco-location:hasEnvironmentalDamage>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'EnvironmentalDamage/', $itemURI, '-', position())" />
								</xsl:attribute>
							</arco-location:hasEnvironmentalDamage>
						</xsl:for-each>
					</rdf:Description>
					<!-- NaturalEnvironmentType as individual-->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'NaturalEnvironmentType/', arco-fn:urify(record/metadata/schede/*/CA/CAB))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/location/NaturalEnvironmentType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="record/metadata/schede/*/CA/CAB" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="record/metadata/schede/*/CA/CAB" />
						</l0:name>
					</rdf:Description>
					<!-- Climate Situation as individual-->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'ClimateSituation/', $itemURI, '-', position())" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/location/ClimateSituation'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Climate situation ', position(), ' of cultural property: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of select="concat('Climate situation ', position(), ' of cultural property: ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat('Situazione climatica ', position(), ' del bene culturale: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="concat('Situazione climatica ', position(), ' del bene culturale: ', $itemURI)" />
						</l0:name>
						<arco-core:description xml:lang="it">
							<xsl:value-of select="record/metadata/schede/*/CA/CAT" />
						</arco-core:description>
					</rdf:Description>
					<!-- Environmental damage IQA as individual-->
					<xsl:if test="record/metadata/schede/*/CA/IQA">
						<xsl:for-each select="record/metadata/schede/*/CA/IQA">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'EnvironmentalDamage/Pollution', $itemURI, '-', position())" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/EnvironmentalDamage'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="en">
									<xsl:value-of select="concat('Environmental damage - pollution ', position(), ' of cultural property: ', $itemURI)" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of select="concat('Environmental damage - pollution ', position(), ' of cultural property: ', $itemURI)" />
								</l0:name>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="concat('Danno ambientale - inquinamento ', position(), ' del bene culturale: ', $itemURI)" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="concat('Danno ambientale - inquinamento ', position(), ' del bene culturale: ', $itemURI)" />
								</l0:name>
								<arco-core:hasType>
									<xsl:value-of select="concat($NS, 'EnvironmentalDamageType/', arco-fn:urify(./IQAT))" />
								</arco-core:hasType>
								<xsl:if test="./IQAD">
									<arco-core:description xml:lang="it">
										<xsl:value-of select="./IQAD" />
									</arco-core:description>
								</xsl:if>
							</rdf:Description>
						</xsl:for-each>
					</xsl:if>
					<!-- Environmental damage DSI as individual-->
					<xsl:if test="record/metadata/schede/*/CA/DSI">
						<xsl:for-each select="record/metadata/schede/*/CA/DSI">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'EnvironmentalDamage/', $itemURI, '-', position())" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/location/EnvironmentalDamage'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="en">
									<xsl:value-of select="concat('Environmental damage ', position(), ' of cultural property: ', $itemURI)" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of select="concat('Environmental damage ', position(), ' of cultural property: ', $itemURI)" />
								</l0:name>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="concat('Danno ambientale ', position(), ' del bene culturale: ', $itemURI)" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="concat('Danno ambientale ', position(), ' del bene culturale: ', $itemURI)" />
								</l0:name>
								<arco-core:hasType>
									<xsl:value-of select="concat($NS, 'EnvironmentalDamageType/', arco-fn:urify(./DSIT))" />
								</arco-core:hasType>
								<xsl:if test="./DSIT">
									<arco-core:description xml:lang="it">
										<xsl:value-of select="./DSIT" />
									</arco-core:description>
								</xsl:if>
								<arco-core:hasType>
									<xsl:value-of select="concat($NS, 'EnvironmentalDamageType/', arco-fn:urify(./DSIT))" />
								</arco-core:hasType>
							</rdf:Description>
						</xsl:for-each>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>