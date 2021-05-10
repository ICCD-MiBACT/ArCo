<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-cc="https://w3id.org/arco/ontology/cataloguing-campaign/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-catalogue="https://w3id.org/arco/ontology/catalogue/"
	xmlns:cis="http://dati.beniculturali.it/cis/"
	xmlns:clvapit="https://w3id.org/italia/onto/CLV/"
	xmlns:smapit="https://w3id.org/italia/onto/SM/"
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
	xmlns:ar-SourceAndDocument="https://w3id.org/arco/resource/SourceAndDocument/"
	xmlns:ar-cis="https://w3id.org/arco/resource/CulturalInstituteOrSite/"
	xmlns:ar-SiteDefinition="https://w3id.org/arco/resource/SiteDefinition/"
	xmlns:ar-MeasurementCollection="https://w3id.org/arco/resource/MeasurementCollection/"
	xmlns:ar-CISNameInTime="https://w3id.org/arco/resource/CISNameInTime/"
	xmlns:ar-Measurement="https://w3id.org/arco/resource/Measurement/"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="1.0">

	<xsl:param name="item" />
	<xsl:param name="NS" />
	<xsl:param name="SOURCE"/>
	<xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version" />
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*)" />
	<xsl:variable name="idCG" select="record/metadata/schede/CG/CD/CCG" />
	<xsl:variable name="cp-name" select="''" />
	
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
		
<xsl:template match="/">
	<rdf:RDF>
	<xsl:if test="administrativeDataRecord/metadata/ente" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(administrativeDataRecord/metadata/ente/codiceEnte))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/italia/onto/COV/Organization'" />
				</xsl:attribute>
			</rdf:type>
			<skos:prefLabel>
				<xsl:value-of select="administrativeDataRecord/metadata/ente/nomeEnte" />
			</skos:prefLabel>
			<rdfs:label>
				<xsl:value-of select="administrativeDataRecord/metadata/ente/nomeEnte" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="administrativeDataRecord/metadata/ente/nomeEnte" />
			</l0:name>
			<xsl:if test="administrativeDataRecord/metadata/ente/id">
				<arco-catalogue:catalogueRecordIdentifier>
					<xsl:value-of select="administrativeDataRecord/metadata/ente/id" />
				</arco-catalogue:catalogueRecordIdentifier>
			</xsl:if>
				<!-- proprietà per avere sempre un collegamento col nome del file xml "ICCD..." -->
			<arco-catalogue:systemRecordCode>
				<xsl:value-of select="administrativeDataRecord/metadata/ente/id" />
			</arco-catalogue:systemRecordCode>
			<xsl:if test="administrativeDataRecord/metadata/ente/tipoEnte">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'OrganizationType/', arco-fn:urify(administrativeDataRecord/metadata/ente/tipoEnte))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="administrativeDataRecord/metadata/ente/tipoEnte">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        	        <xsl:value-of 	select="concat($NS, 'OrganizationType/', arco-fn:urify(administrativeDataRecord/metadata/ente/tipoEnte))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/cataloguing-campaign/OrganizationType'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="administrativeDataRecord/metadata/ente/tipoEnte" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="administrativeDataRecord/metadata/ente/tipoEnte" />
				</l0:name>
			</rdf:Description>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="administrativeDataRecord/metadata/campagne" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
                <xsl:value-of select="concat($NS, 'CataloguingOrDigitizationCampaign/', arco-fn:urify(administrativeDataRecord/metadata/campagne/id))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/cataloguing-campaign/CataloguingOrDigitizationCampaign'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="administrativeDataRecord/metadata/campagne/nome" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="administrativeDataRecord/metadata/campagne/nome" />
			</l0:name>
			<xsl:if test="administrativeDataRecord/metadata/campagne/id">
				<arco-catalogue:catalogueRecordIdentifier>
					<xsl:value-of select="administrativeDataRecord/metadata/campagne/id" />
				</arco-catalogue:catalogueRecordIdentifier>
			</xsl:if>
				<!-- proprietà per avere sempre un collegamento col nome del file xml "ICCD..." -->
			<arco-catalogue:systemRecordCode>
				<xsl:value-of select="administrativeDataRecord/metadata/campagne/id" />
			</arco-catalogue:systemRecordCode>
			<xsl:if test="administrativeDataRecord/metadata/campagne/tipoCampagna">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'CampaignType/', arco-fn:urify(administrativeDataRecord/metadata/campagne/tipoCampagna))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="administrativeDataRecord/metadata/campagne/stato">
				<arco-cc:hasStatus>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'CampaignStatus/', arco-fn:urify(administrativeDataRecord/metadata/campagne/stato))" />
					</xsl:attribute>
				</arco-cc:hasStatus>
			</xsl:if>
			<xsl:if test="administrativeDataRecord/metadata/campagne/min or administrativeDataRecord/metadata/campagne/max or administrativeDataRecord/metadata/campagne/cardinalitaAssegnata">
				<arco-cc:hasCatalogueNumberAssignment>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'CatalogueNumberAssignment/', arco-fn:urify(administrativeDataRecord/metadata/campagne/nome))" />
					</xsl:attribute>
				</arco-cc:hasCatalogueNumberAssignment>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="administrativeDataRecord/metadata/campagne/tipoCampagna">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        	        <xsl:value-of 	select="concat($NS, 'CampaignType/', arco-fn:urify(administrativeDataRecord/metadata/campagne/tipoCampagna))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/cataloguing-campaign/CampaignType'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="administrativeDataRecord/metadata/campagne/tipoCampagna" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="administrativeDataRecord/metadata/campagne/tipoCampagna" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="administrativeDataRecord/metadata/campagne/stato">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        	        <xsl:value-of 	select="concat($NS, 'CampaignStatus/', arco-fn:urify(administrativeDataRecord/metadata/campagne/stato))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/cataloguing-campaign/CampaignStatus'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="administrativeDataRecord/metadata/campagne/stato" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="administrativeDataRecord/metadata/campagne/stato" />
				</l0:name>
			</rdf:Description>
		</xsl:if>		
		<xsl:if test="administrativeDataRecord/metadata/campagne/min or administrativeDataRecord/metadata/campagne/max or administrativeDataRecord/metadata/campagne/cardinalitaAssegnata">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of 	select="concat($NS, 'CatalogueNumberAssignment/', arco-fn:urify(administrativeDataRecord/metadata/campagne/nome))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/cataloguing-campaign/CatalogueNumberAssignment'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label  xml:lang="en">
					<xsl:value-of select="concat('Catalogue number assignment of campaign ', administrativeDataRecord/metadata/campagne/stato)" />
				</rdfs:label>
				<l0:name  xml:lang="en">
					<xsl:value-of select="concat('Catalogue number assignment of campaign ', administrativeDataRecord/metadata/campagne/stato)" />
				</l0:name>
				<rdfs:label  xml:lang="it">
					<xsl:value-of select="concat('Assegnazione dei numeri di catalogo della campagna ', administrativeDataRecord/metadata/campagne/stato)" />
				</rdfs:label>
				<l0:name  xml:lang="it">
					<xsl:value-of select="concat('Assegnazione dei numeri di catalogo della campagna ', administrativeDataRecord/metadata/campagne/stato)" />
				</l0:name>
				<xsl:if test="administrativeDataRecord/metadata/campagne/min">
					<arco-cc:firstNumberAssigned>
						<xsl:value-of 	select="administrativeDataRecord/metadata/campagne/min" />
					</arco-cc:firstNumberAssigned>
				</xsl:if>
				<xsl:if test="administrativeDataRecord/metadata/campagne/max">
					<arco-cc:lastNumberAssigned>
						<xsl:value-of 	select="administrativeDataRecord/metadata/campagne/max" />
					</arco-cc:lastNumberAssigned>
				</xsl:if>
				<xsl:if test="administrativeDataRecord/metadata/campagne/cardinalitaAssegnata">
					<arco-cc:totalOfAssignedNumber>
						<xsl:value-of 	select="administrativeDataRecord/metadata/campagne/cardinalitaAssegnata" />
					</arco-cc:totalOfAssignedNumber>
				</xsl:if>
			</rdf:Description>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="administrativeDataRecord/metadata/attivita" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
                <xsl:value-of select="concat($NS, 'CataloguingActivity/', arco-fn:urify(administrativeDataRecord/metadata/attivita/id))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/cataloguing-campaign/CataloguingActivity'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="administrativeDataRecord/metadata/attivita/nome" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="administrativeDataRecord/metadata/attivita/nome" />
			</l0:name>
			<xsl:if test="administrativeDataRecord/metadata/attivita/id">
				<arco-catalogue:catalogueRecordIdentifier>
					<xsl:value-of select="administrativeDataRecord/metadata/attivita/id" />
				</arco-catalogue:catalogueRecordIdentifier>
			</xsl:if>
				<!-- proprietà per avere sempre un collegamento col nome del file xml "ICCD..." -->
			<arco-catalogue:systemRecordCode>
				<xsl:value-of select="administrativeDataRecord/metadata/attivita/id" />
			</arco-catalogue:systemRecordCode>
			<xsl:if test="administrativeDataRecord/metadata/attivita/keycodeCampagna">
				<arco-cc:isCataloguingActivityOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CataloguingOrDigitizationCampaign/', arco-fn:urify(administrativeDataRecord/metadata/attivita/keycodeCampagna))" />
					</xsl:attribute>
				</arco-cc:isCataloguingActivityOf>
			</xsl:if>
			<xsl:if test="administrativeDataRecord/metadata/attivita/stato">
				<arco-cc:hasStatus>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'ActivityStatus/', arco-fn:urify(administrativeDataRecord/metadata/attivita/stato))" />
					</xsl:attribute>
				</arco-cc:hasStatus>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="administrativeDataRecord/metadata/attivita/stato">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        	        <xsl:value-of 	select="concat($NS, 'ActivityStatus/', arco-fn:urify(administrativeDataRecord/metadata/attivita/stato))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/cataloguing-campaign/ActivityStatus'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="administrativeDataRecord/metadata/attivita/stato" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="administrativeDataRecord/metadata/attivita/stato" />
				</l0:name>
			</rdf:Description>
		</xsl:if>	
	</xsl:if>
	<xsl:if test="administrativeDataRecord/metadata/assegnazione" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
                <xsl:value-of select="concat($NS, 'Application/', arco-fn:urify(administrativeDataRecord/metadata/assegnazione/idAssegnazione))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/cataloguing-campaign/Application'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label  xml:lang="en">
				<xsl:value-of select="concat('Catalogue number assignment application of campaign ', administrativeDataRecord/metadata/assegnazione/keycodeCampagna)" />
			</rdfs:label>
			<l0:name  xml:lang="en">
				<xsl:value-of select="concat('Catalogue number assignment application of campaign ', administrativeDataRecord/metadata/assegnazione/keycodeCampagna)" />
			</l0:name>
			<rdfs:label  xml:lang="it">
				<xsl:value-of select="concat('Richiesta dei numeri di catalogo della campagna ', administrativeDataRecord/metadata/assegnazione/keycodeCampagna)" />
			</rdfs:label>
			<l0:name  xml:lang="it">
				<xsl:value-of select="concat('Richiesta dei numeri di catalogo della campagna ', administrativeDataRecord/metadata/assegnazione/keycodeCampagna)" />
			</l0:name>
			<xsl:if test="administrativeDataRecord/metadata/assegnazione/idAssegnazione">
				<arco-catalogue:catalogueRecordIdentifier>
					<xsl:value-of select="administrativeDataRecord/metadata/assegnazione/idAssegnazione" />
				</arco-catalogue:catalogueRecordIdentifier>
			</xsl:if>
				<!-- proprietà per avere sempre un collegamento col nome del file xml "ICCD..." -->
			<arco-catalogue:systemRecordCode>
				<xsl:value-of select="administrativeDataRecord/metadata/assegnazione/idAssegnazione" />
			</arco-catalogue:systemRecordCode>
			<xsl:if test="administrativeDataRecord/metadata/assegnazione/keycodeCampagna">
				<arco-cc:isApplicationOf>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CataloguingOrDigitizationCampaign/', arco-fn:urify(administrativeDataRecord/metadata/assegnazione/keycodeCampagna))" />
					</xsl:attribute>
				</arco-cc:isApplicationOf>
			</xsl:if>
			<xsl:if test="administrativeDataRecord/metadata/assegnazione/dataProtocolloEnte">
				<arco-cc:hasAgencyProtocol>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'Protocol/', arco-fn:arcofy(administrativeDataRecord/metadata/assegnazione/dataProtocolloEnte))" />
					</xsl:attribute>
				</arco-cc:hasAgencyProtocol>
			</xsl:if>
			<xsl:if test="administrativeDataRecord/metadata/assegnazione/dataProtocolloRispostaICCD">
				<arco-cc:hasICCDProtocol>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'Protocol/', arco-fn:arcofy(administrativeDataRecord/metadata/assegnazione/dataProtocolloRispostaICCD))" />
					</xsl:attribute>
				</arco-cc:hasICCDProtocol>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="administrativeDataRecord/metadata/assegnazione/dataProtocolloEnte">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        	        <xsl:value-of 	select="concat($NS, 'Protocol/', arco-fn:arcofy(administrativeDataRecord/metadata/assegnazione/dataProtocolloEnte))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/cataloguing-campaign/Protocol'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label  xml:lang="en">
					<xsl:value-of select="concat('Protocol of catalogue number assignment application of campaign ', administrativeDataRecord/metadata/assegnazione/keycodeCampagna)" />
				</rdfs:label>
				<l0:name  xml:lang="en">
					<xsl:value-of select="concat('Protocol of catalogue number assignment application of campaign ', administrativeDataRecord/metadata/assegnazione/keycodeCampagna)" />
				</l0:name>
				<rdfs:label  xml:lang="it">
					<xsl:value-of select="concat('Protocollo della richiesta dei numeri di catalogo della campagna ', administrativeDataRecord/metadata/assegnazione/keycodeCampagna)" />
				</rdfs:label>
				<l0:name  xml:lang="it">
					<xsl:value-of select="concat('Protocollo della richiesta dei numeri di catalogo della campagna ', administrativeDataRecord/metadata/assegnazione/keycodeCampagna)" />
				</l0:name>
				<tiapit:date>
					<xsl:value-of select="administrativeDataRecord/metadata/assegnazione/dataProtocolloEnte" />
				</tiapit:date>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="administrativeDataRecord/metadata/assegnazione/dataProtocolloRispostaICCD">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        	        <xsl:value-of 	select="concat($NS, 'Protocol/', arco-fn:arcofy(administrativeDataRecord/metadata/assegnazione/dataProtocolloRispostaICCD))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/cataloguing-campaign/Protocol'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label  xml:lang="en">
					<xsl:value-of select="concat('Protocol of catalogue number assignment application of campaign ', administrativeDataRecord/metadata/assegnazione/keycodeCampagna)" />
				</rdfs:label>
				<l0:name  xml:lang="en">
					<xsl:value-of select="concat('Protocol of catalogue number assignment application of campaign ', administrativeDataRecord/metadata/assegnazione/keycodeCampagna)" />
				</l0:name>
				<rdfs:label  xml:lang="it">
					<xsl:value-of select="concat('Protocollo della richiesta dei numeri di catalogo della campagna ', administrativeDataRecord/metadata/assegnazione/keycodeCampagna)" />
				</rdfs:label>
				<l0:name  xml:lang="it">
					<xsl:value-of select="concat('Protocollo della richiesta dei numeri di catalogo della campagna ', administrativeDataRecord/metadata/assegnazione/keycodeCampagna)" />
				</l0:name>
				<tiapit:date>
					<xsl:value-of select="administrativeDataRecord/metadata/assegnazione/dataProtocolloRispostaICCD" />
				</tiapit:date>
			</rdf:Description>
		</xsl:if>	
	</xsl:if>
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>