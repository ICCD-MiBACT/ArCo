<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-cc="https://w3id.org/arco/ontology/cataloguing-campaign/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-catalogue="https://w3id.org/arco/ontology/catalogue/"
	xmlns:l0="https://w3id.org/italia/onto/l0/"
	xmlns:tiapit="https://w3id.org/italia/onto/TI/"
	xmlns:COV="https://w3id.org/italia/onto/COV/">
	<xsl:param name="item" />
	<xsl:param name="NS" />
	<xsl:param name="SOURCE"/>
	<xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version" />
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*)" />
	<xsl:variable name="idCG" select="record/metadata/schede/CG/CD/CCG" />
	<xsl:variable name="cp-name" select="''" />
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
					<xsl:if test="administrativeDataRecord/metadata/ente/siglaEnte">
						<COV:orgAcronym>
							<xsl:value-of select="administrativeDataRecord/metadata/ente/siglaEnte" />
						</COV:orgAcronym>
					</xsl:if>
					<!-- proprietà per avere sempre un collegamento col nome del file xml "ICCD..." -->
					<arco-lite:systemIdentifier>
						<xsl:value-of select="administrativeDataRecord/metadata/ente/id" />
					</arco-lite:systemIdentifier>
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