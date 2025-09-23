<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-catalogue="https://w3id.org/arco/ontology/catalogue/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
	xmlns:cis="http://dati.beniculturali.it/cis/"
	xmlns:clvapit="https://w3id.org/italia/onto/CLV/"
	xmlns:smapit="https://w3id.org/italia/onto/SM/"
	xmlns:cpv="https://w3id.org/italia/onto/CPV/"
	xmlns:arco-dd="https://w3id.org/arco/ontology/denotative-description/"
	xmlns:arco-cd="https://w3id.org/arco/ontology/context-description/"
	xmlns:arco-ce="https://w3id.org/arco/ontology/cultural-event/"
	xmlns:dcterms="http://purl.org/dc/terms/creator"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:pico="http://data.cochrane.org/ontologies/pico/"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:foaf="http://xmlns.com/foaf/0.1/"
	xmlns:frbr="http://purl.org/vocab/frbr/core#"
	xmlns:l0="https://w3id.org/italia/onto/l0/"
	xmlns:arco-location="https://w3id.org/arco/ontology/location/"
	xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:php="http://php.net/xsl"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:roapit="https://w3id.org/italia/onto/RO/"
	xmlns:tiapit="https://w3id.org/italia/onto/TI/"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:mu="https://w3id.org/italia/onto/MU/"
	xmlns:language="https://w3id.org/italia/onto/Language/"
	xmlns:ar-agentrole="https://w3id.org/arco/resource/AgentRole/"
	xmlns:ar-agent="https://w3id.org/arco/resource/Agent/"
	xmlns:ar-role="https://w3id.org/arco/resource/Role/"
	xmlns:ar-privacyReason="https://w3id.org/arco/resource/PrivacyReason/"
	xmlns:COV="https://w3id.org/italia/onto/COV/"
	xmlns:CPV="https://w3id.org/italia/onto/CPV/"
	xmlns:ar-archeologicalProperty="https://w3id.org/arco/resource/ArchaeologicalProperty/"
	xmlns:ar-TimeInterval="https://w3id.org/arco/resource/TimeInterval/"
	xmlns:ar-city="https://w3id.org/arco/resource/City/"
	xmlns:ar-geometry="https://w3id.org/arco/resource/Geometry/"
	xmlns:ar-event="https://w3id.org/arco/resource/Event/"
	xmlns:ar-country="https://w3id.org/arco/resource/Country/"
	xmlns:ar-timeIndexedTypedLocation="https://w3id.org/arco/resource/TimeIndexedTypedLocation/"
	xmlns:ar-feature="https://w3id.org/arco/resource/Feature/"
	xmlns:ar-timeIndexedRole="https://w3id.org/arco/resource/TimeIndexedRole/"
	xmlns:ar-catalogueRecordSI="https://w3id.org/arco/resource/CatalogueRecordSI/"
	xmlns:ar-detectionMethod="https://w3id.org/arco/resource/DetectionMethod/"
	xmlns:ar-interpretationCriterion="https://w3id.org/arco/resource/InterpretationCriterion/"
	xmlns:ar-bibliography="https://w3id.org/arco/resource/Bibliography/"
	xmlns:ar-culturalPropertyDefinition="https://w3id.org/arco/resource/CulturalPropertyDefinition/"
	xmlns:ar-legalSituation="https://w3id.org/arco/resource/LegalSituation/"
	xmlns:ar-province="https://w3id.org/arco/resource/Province/"
	xmlns:ar-culturalPropertySpecification="https://w3id.org/arco/resource/CulturalPropertySpecification/"
	xmlns:ar-addressArea="https://w3id.org/arco/resource/AddressArea/"
	xmlns:ar-designationInTime="https://w3id.org/arco/resource/DesignationInTime/"
	xmlns:ar-accessProfile="https://w3id.org/arco/resource/AccessProfile/"
	xmlns:ar-documentType="https://w3id.org/arco/resource/DocumentationType/"
	xmlns:ar-address="https://w3id.org/arco/resource/Address/"
	xmlns:ar-culturalPropertyType="https://w3id.org/arco/resource/CulturalPropertyType/"
	xmlns:ar-photograpyDocumentation="https://w3id.org/arco/resource/PhotographicDocumentation/"
	xmlns:ar-docutmentationType="https://w3id.org/arco/resource/DocumentationType/"
	xmlns:ar-dating="https://w3id.org/arco/resource/Dating/"
	xmlns:ar-archeologicalFieldSurvey="https://w3id.org/arco/resource/ArchaeologicalFieldSurvey/"
	xmlns:ar-region="https://w3id.org/arco/resource/Region/"
	xmlns:ar-catalogueRecordVersion="https://w3id.org/arco/resource/CatalogueRecordVersion/"
	xmlns:ar-HistoricOrArtisticProperty="https://w3id.org/arco/resource/HistoricOrArtisticProperty/"
	xmlns:ar-CulturalPropertyCataloguingCategory="https://w3id.org/arco/resource/CulturalPropertyCataloguingCategory/"
	xmlns:ar-RelatedWorkSituation="https://w3id.org/arco/resource/RelatedWorkSituation/"
	xmlns:ar-CulturalEntityTechnicalStatus="https://w3id.org/arco/resource/CulturalEntityTechnicalStatus/"
	xmlns:ar-Value="https://w3id.org/arco/resource/Value/"
	xmlns:ar-PreferredAuthorshipAttribution="https://w3id.org/arco/resource/PreferredAuthorshipAttribution/"
	xmlns:ar-CatalogueRecordOA="https://w3id.org/arco/resource/CatalogueRecordOA/"
	xmlns:ar-TechnicalCharacteristic="https://w3id.org/arco/resource/TechnicalCharacteristic/"
	xmlns:ar-Site="https://w3id.org/arco/resource/Site/"
	xmlns:ar-SiteType="https://w3id.org/arco/resource/SiteType/"
	xmlns:ar-ConservationStatus="https://w3id.org/arco/resource/ConservationStatus/"
	xmlns:ar-Subject="https://w3id.org/arco/resource/Subject/"
	xmlns:ar-SourceOrDocument="https://w3id.org/arco/resource/SourceOrDocument/"
	xmlns:ar-cis="https://w3id.org/arco/resource/CulturalInstituteOrSite/"
	xmlns:ar-SiteDefinition="https://w3id.org/arco/resource/SiteDefinition/"
	xmlns:ar-MeasurementCollection="https://w3id.org/arco/resource/MeasurementCollection/"
	xmlns:ar-CISNameInTime="https://w3id.org/arco/resource/CISNameInTime/"
	xmlns:ar-Measurement="https://w3id.org/arco/resource/Measurement/"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="2.0">
	<xsl:param name="item" />
	<xsl:param name="NS" />
	<xsl:param name="SOURCE"/>
	<xsl:template name="CamelCaseWord">
		<xsl:param name="text" />
		<xsl:value-of select="translate(substring($text,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
		<xsl:value-of select="translate(substring($text,2,string-length($text)-1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
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
	<xsl:template match="/">
		<rdf:RDF>
			<xsl:if test="root">
				<xsl:for-each select="root/c">
					<xsl:variable name="audience" select="./@audience" />
					<xsl:variable name="type" select="./@level" />
					<xsl:variable name="id" select="./@id" />
					<xsl:variable name="level" select="./@level" />
					<xsl:variable name="imgNote" select="./dao/@label" />
					<xsl:variable name="imgLabel" select="./dao/@title" />
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'ThematicPath/',  arco-fn:urify(normalize-space($id)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ThematicPath'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="./did/unittitle/text()" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="./did/unittitle/text()" />
						</l0:name>
						<arco-lite:systemIdentifier>
							<xsl:value-of select="$id" />
						</arco-lite:systemIdentifier>
						<xsl:if test="$audience='external'">
							<arco-catalogue:public>
								<xsl:value-of select="true()" />
							</arco-catalogue:public>
						</xsl:if>
						<arco-core:hasIdentifier>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ThematicPath/Identifier/',  arco-fn:urify(normalize-space($id)))" />
							</xsl:attribute>
						</arco-core:hasIdentifier>
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'ThematicPathType/',  arco-fn:urify(normalize-space($type)))" />
							</xsl:attribute>
						</arco-core:hasType>
						<xsl:for-each select="./processinfo/list/item">
							<xsl:variable name="authorssplit" select="arco-fn:split(./persname)" />
							<xsl:for-each select="$authorssplit">
								<arco-lite:hasAuthor>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(normalize-space(.)))" />
									</xsl:attribute>
								</arco-lite:hasAuthor>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:if test="./did/unittitle/emph">
							<arco-cd:caption>
								<xsl:value-of select="./did/unittitle/emph" />
							</arco-cd:caption>
						</xsl:if>
						<xsl:if test="./did/abstract">
							<arco-core:abstract>
								<xsl:value-of select="./did/abstract" />
							</arco-core:abstract>
						</xsl:if>
						<xsl:if test="./did/unittitle/title">
							<arco-core:descrition>
								<xsl:value-of select="./did/unittitle/title/text()" />
							</arco-core:descrition>
						</xsl:if>
						<xsl:if test="./dao">
							<arco-core:hasDepiction>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'Depiction/',  arco-fn:urify(normalize-space($id)))" />
								</xsl:attribute>
							</arco-core:hasDepiction>
						</xsl:if>
						<xsl:for-each select="./daogrp/daoloc">
							<xsl:if test="./@type='img' or ./@type='manifest_external' or ./@type='manifest_auto'">
								<arco-cd:hasDocumentation>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', 'ThematicPath/',  arco-fn:urify(normalize-space($id)), '-photographic-documentation-', position())" />
									</xsl:attribute>
								</arco-cd:hasDocumentation>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="./daogrp/daoloc">
							<xsl:if test="./@type='pdf'">
								<arco-cd:hasDocumentation>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'SourceOrDocument/', 'ThematicPath/',  arco-fn:urify(normalize-space($id)), '-documentation-', position())" />
									</xsl:attribute>
								</arco-cd:hasDocumentation>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="./daogrp/daoloc">
							<xsl:if test="./@type='video'">
								<arco-cd:hasDocumentation>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="concat($NS, 'FilmDocumentation/', 'ThematicPath/',  arco-fn:urify(normalize-space($id)), '-film-documentation-', position())" />
									</xsl:attribute>
								</arco-cd:hasDocumentation>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="./bibliography/bibref">
							<xsl:choose>
								<xsl:when test="./persname">
									<arco-lite:bibliographicReference>
										<xsl:value-of select="concat(string-join(./persname, ', '), '. ', ./title, '. ', ./imprint/publisher, ', ', ./imprint/geogname, '. ', ./imprint/date)" />
									</arco-lite:bibliographicReference>
								</xsl:when>
								<xsl:otherwise>
									<arco-lite:bibliographicReference>
										<xsl:value-of select="concat(./title, '. ', ./imprint/publisher, ', ', ./imprint/geogname, '. ', ./imprint/date)" />
									</arco-lite:bibliographicReference>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<xsl:for-each select="./daogrp/daoloc">
							<xsl:if test="./@type='portale'">
								<arco-lite:bibliographicReference>
									<xsl:value-of select="concat(./@altrender, '. ', ./@href)" />
								</arco-lite:bibliographicReference>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="./bibliography/extref">
							<xsl:variable name="site" select="./@href" />
							<arco-lite:bibliographicReference>
								<xsl:value-of select="concat(./title, '. ', $site, '. ', ./date)" />
							</arco-lite:bibliographicReference>
						</xsl:for-each>
						<xsl:for-each select="./fatherId[not(starts-with(lower-case(normalize-space()), '.'))]">
							<arco-core:isPartOf>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'ThematicPath/',  arco-fn:urify(normalize-space(.)))" />
								</xsl:attribute>
							</arco-core:isPartOf>
						</xsl:for-each>
						<xsl:for-each select="./controlaccess/subject">
							<xsl:variable name="cp" select="./@id" />
							<arco-core:involves>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="$cp" />
								</xsl:attribute>
							</arco-core:involves>
						</xsl:for-each>
						<xsl:if test="./did/unittitle/unitdate">
							<arco-lite:hasRealizationDate>
								<xsl:attribute name="rdf:resource">
									<xsl:choose>
										<xsl:when test="./did/unitdate/emph">
											<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./did/unittitle/unitdate/emph)))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./did/unittitle/unitdate)))" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</arco-lite:hasRealizationDate>
						</xsl:if>
					</rdf:Description>
					<!-- Identifier as individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'ThematicPath/Identifier/',  arco-fn:urify(normalize-space($id)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/Identifier'" />
							</xsl:attribute>
						</rdf:type>
						<arco-core:hasType>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/core/LocalIdentifier'" />
							</xsl:attribute>
						</arco-core:hasType>
						<rdfs:label>
							<xsl:value-of select="$id" />
						</rdfs:label>
						<l0:identifier>
							<xsl:value-of select="$id" />
						</l0:identifier>
						<arco-core:current rdf:datatype="http://www.w3.org/2001/XMLSchema#boolean">
							<xsl:value-of select="true()" />
						</arco-core:current>
					</rdf:Description>
					<!-- Depiction as individual -->
					<xsl:if test="./dao">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'Depiction/',  arco-fn:urify(normalize-space($id)))" />
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/ontology/core/Depiction'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Immagine principale dell itinerario ', $id)" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Main immage of thematic path ', $id)" />
							</rdfs:label>
							<xsl:if test="./dao/@title">
								<arco-cd:caption>
									<xsl:value-of select="$imgLabel" />
								</arco-cd:caption>
							</xsl:if>
							<xsl:if test="./dao/@label">
								<arco-core:note>
									<xsl:value-of select="$imgNote" />
								</arco-core:note>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
					<!-- Documentation -->
					<xsl:for-each select="./daogrp/daoloc">
						<xsl:if test="./@type='img' or ./@type='manifest_external' or ./@type='manifest_auto'">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', 'ThematicPath/',  arco-fn:urify(normalize-space($id)), '-photographic-documentation-', position())" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/PhotographicDocumentation'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="en">
									<xsl:value-of select="concat('Photographic documentation ', position(), ' of thematic path: ', $id)" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of select="concat('Photographic documentation ', position(), ' of thematic path: ', $id)" />
								</l0:name>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="concat('Documentazione fotografica ', position(), ' dell approfondimento: ', $id)" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="concat('Documentazione fotografica ', position(), ' dell approfondimento: ', $id)" />
								</l0:name>
								<xsl:if test="./@label">
									<arco-cd:documentationTitle>
										<xsl:value-of select="./@label" />
									</arco-cd:documentationTitle>
								</xsl:if>
								<xsl:if test="not(./@label)">
									<arco-cd:documentationTitle>
										<xsl:value-of select="." />
									</arco-cd:documentationTitle>
								</xsl:if>
								<xsl:if test="./@href">
									<smapit:URL rdf:datatype="http://www.w3.org/2001/XMLSchema#anyURI">											<xsl:value-of select="./@href" />
										
									</smapit:URL>
								</xsl:if>
							</rdf:Description>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="./daogrp/daoloc">
						<xsl:if test="./@type='pdf'">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'SourceOrDocument/', 'ThematicPath/',  arco-fn:urify(normalize-space($id)), '-documentation-', position())" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/SourceOrDocument'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="en">
									<xsl:value-of select="concat('Document ', position(), ' of thematic path: ', $id)" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of select="concat('Document ', position(), ' of thematic path: ', $id)" />
								</l0:name>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="concat('Documento ', position(), ' dell approfondimento: ', $id)" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="concat('Documento ', position(), ' dell approfondimento: ', $id)" />
								</l0:name>
								<xsl:if test="./@altrender">
									<arco-cd:documentationTitle>
										<xsl:value-of select="./@altrender" />
									</arco-cd:documentationTitle>
								</xsl:if>
								<xsl:if test="not(./@title)">
									<arco-cd:caption>
										<xsl:value-of select="./@title" />
									</arco-cd:caption>
								</xsl:if>
								<xsl:if test="./@href">
									<smapit:URL rdf:datatype="http://www.w3.org/2001/XMLSchema#anyURI">
											<xsl:value-of select="./@href" />
									</smapit:URL>
								</xsl:if>
							</rdf:Description>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="./daogrp/daoloc">
						<xsl:if test="./@type='video'">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'FilmDocumentation/', 'ThematicPath/',  arco-fn:urify(normalize-space($id)), '-film-documentation-', position())" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/FilmDocumentation'" />
									</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="en">
									<xsl:value-of select="concat('Film documentation ', position(), ' of thematic path: ', $id)" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of select="concat('Film documentation ', position(), ' of thematic path: ', $id)" />
								</l0:name>
								<rdfs:label xml:lang="it">
									<xsl:value-of select="concat('Documentazione video ', position(), ' dell approfondimento: ', $id)" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of select="concat('Documentazione video ', position(), ' dell approfondimento: ', $id)" />
								</l0:name>
								<xsl:if test="./@title">
									<arco-cd:documentationTitle>
										<xsl:value-of select="./@title" />
									</arco-cd:documentationTitle>
								</xsl:if>
								<xsl:if test="./@href">
									<smapit:URL rdf:datatype="http://www.w3.org/2001/XMLSchema#anyURI">
											<xsl:value-of select="./@href" />
									</smapit:URL>
								</xsl:if>
							</rdf:Description>
						</xsl:if>
					</xsl:for-each>
					<!-- thematic pathtype as individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'ThematicPathType/',  arco-fn:urify(normalize-space($type)))" />
						</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ThematicPathType'" />
							</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="$type" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="$type" />
						</l0:name>
					</rdf:Description>
					<!-- agent as individual -->
					<xsl:for-each select="./processinfo/list/item">
						<xsl:variable name="authorssplit" select="arco-fn:split(./persname)" />
						<xsl:for-each select="$authorssplit">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(normalize-space(.)))" />
								</xsl:attribute>
								<rdf:type rdf:resource="https://w3id.org/italia/onto/l0/Agent" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(.)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(.)" />
								</l0:name>
							</rdf:Description>
						</xsl:for-each>
					</xsl:for-each>
					<!-- time interval as individual -->
					<xsl:if test="./did/unittitle/unitdate">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:choose>
									<xsl:when test="./did/unitdate/emph">
										<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./did/unittitle/unitdate/emph)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./did/unittitle/unitdate)))" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:choose>
									<xsl:when test="./did/unittitle/unitdate/emph">
										<xsl:value-of select="./did/unittitle/unitdate/emph" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="./did/unittitle/unitdate" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<tiapit:startTime>
								<xsl:choose>
									<xsl:when test="./did/unittitle/unitdate/emph">
										<xsl:value-of select="./did/unittitle/unitdate/emph" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="./did/unittitle/unitdate" />
									</xsl:otherwise>
								</xsl:choose>
							</tiapit:startTime>
							<tiapit:endTime>
								<xsl:choose>
									<xsl:when test="./did/unittitle/unitdate/emph">
										<xsl:value-of select="./did/unittitle/unitdate/emph" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="./did/unittitle/unitdate" />
									</xsl:otherwise>
								</xsl:choose>
							</tiapit:endTime>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>