<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/core/" xmlns:arco-fn="http://w3id.org/arco/saxon-extension"
	xmlns:arco-catalogue="https://w3id.org/arco/catalogue/" xmlns:cis="http://dati.beniculturali.it/cis/"
	xmlns:clvapit="https://w3id.org/italia/onto/CLV/" xmlns:smapit="https://w3id.org/italia/onto/SM/"
	xmlns:arco-dd="https://w3id.org/arco/denotative-description/"
	xmlns:arco-cd="https://w3id.org/arco/context-description/"
	xmlns:arco-ce="https://w3id.org/arco/cultural-event/"
	xmlns:dcterms="http://purl.org/dc/terms/creator" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:frbr="http://purl.org/vocab/frbr/core#"
	xmlns:l0="https://w3id.org/italia/onto/l0/"
	xmlns:arco-location="https://w3id.org/arco/location/" xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:php="http://php.net/xsl" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:roapit="https://w3id.org/italia/onto/RO/"
	xmlns:tiapit="https://w3id.org/italia/onto/TI/" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	version="1.0" exclude-result-prefixes="xsl php">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />
	<xsl:param name="item" />

	<!-- xsl:import href="test.xsl"/ -->

	<xsl:template match="/">
		<xsl:variable name="NS" select="'https://w3id.org/arco/resource/'" />
		<!-- xsl:variable name="itemURI" select="arco-fn:urify($item)"></xsl:variable -->
		<!-- This cannot be valid as schede/*/CD/NCT/NCTR and schede/*/CD/NCT/NCTN 
			are not unique xsl:variable name="itemURI" select="concat(schede/*/CD/NCT/NCTR, 
			schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS)"></xsl:variable -->
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
		<!-- xsl:variable name="sheetType" select="schede/*/CD/TSK/text()"></xsl:variable -->
		<xsl:variable name="sheetVersion" select="schede/*/@version" />
		<xsl:variable name="sheetType" select="name(schede/*)" />
		<xsl:variable name="cp-name" select="''" />

		<rdf:RDF>
			<!-- We firstly introduce the sheet. -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                    <xsl:value-of
					select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
                </xsl:attribute>

				<rdf:type>
					<xsl:attribute name="rdf:resource">
                        <xsl:value-of
						select="concat('https://w3id.org/arco/catalogue/', 'CatalogueRecord', $sheetType)" />
                    </xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Catalogue Record n: ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Scheda catalografica n: ', $itemURI)" />
				</rdfs:label>
				<arco-catalogue:describes>
					<xsl:attribute name="rdf:resource">
                        <xsl:value-of
						select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                    </xsl:attribute>
				</arco-catalogue:describes>
				<!-- hasCataloguingLevel (schede/*/CD/LIR) -->
				<xsl:for-each select="schede/*/CD/LIR">
					<arco-catalogue:hasCataloguingLevel>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat('https://w3id.org/arco/catalogue/', upper-case(arco-fn:urify(.)))" />
                        </xsl:attribute>
					</arco-catalogue:hasCataloguingLevel>
				</xsl:for-each>
				<!-- identifier:sheetIdentifier - concat of NCTR + NCTN + NCTS + - +RVEL. 
					NCTR+NCTN+NCTS comes from schede/*/CD/NCT RVEL comes from schede/*/RV/RVE/RVEL 
					(optional) -->
				<xsl:if test="schede/*/CD/NCT">
					<arco-catalogue:catalogueRecordIdentifier>
						<xsl:choose>
							<xsl:when test="schede/*/RV/RVE/RVEL">
								<xsl:value-of
									select="concat(schede/*/CD/NCT/NCTR, schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS, '-', schede/*/RV/RVE/RVEL)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat(schede/*/CD/NCT/NCTR, schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS)" />
							</xsl:otherwise>
						</xsl:choose>
					</arco-catalogue:catalogueRecordIdentifier>
				</xsl:if>
				<!-- proprietà per avere sempre un collegamento col nome del file xml 
					"ICCD..." -->
				<arco-catalogue:systemRecordCode>
					<xsl:value-of select="$item" />
				</arco-catalogue:systemRecordCode>
				<xsl:for-each select="schede/*/RV/RSP">
					<arco-catalogue:deletedICCDIdentifier>
						<xsl:value-of select="." />
					</arco-catalogue:deletedICCDIdentifier>
				</xsl:for-each>
				<xsl:for-each select="schede/*/RVE/RVES">
					<arco-catalogue:deletedICCDIdentifier>
						<xsl:value-of select="." />
					</arco-catalogue:deletedICCDIdentifier>
				</xsl:for-each>
				<!-- alternative identifier (AC/ACC) -->
				<xsl:if test="schede/*/AC/ACC">
					<xsl:for-each select="schede/*/AC/ACC">
						<arco-catalogue:hasAlternativeIdentifier>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'AlternativeIdentifier/', $itemURI, '-', position())" />
	                			</xsl:attribute>
						</arco-catalogue:hasAlternativeIdentifier>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="schede/*/CM/CMP">
					<arco-catalogue:hasCatalogueRecordVersion>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-compilation')" />
                        </xsl:attribute>
					</arco-catalogue:hasCatalogueRecordVersion>
				</xsl:if>
				<xsl:if test="schede/*/CM/RVM">
					<arco-catalogue:hasCatalogueRecordVersion>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-rvm')" />
                        </xsl:attribute>
					</arco-catalogue:hasCatalogueRecordVersion>
				</xsl:if>
				<xsl:for-each select="schede/*/CM/AGG">
					<arco-catalogue:hasCatalogueRecordVersion>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-agg-', position())" />
                        </xsl:attribute>
					</arco-catalogue:hasCatalogueRecordVersion>
				</xsl:for-each>
				<xsl:if test="schede/*/AN/OSS">
					<arco-core:note>
						<xsl:value-of select="normalize-space(schede/*/AN/OSS)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="schede/*/AN/RDP">
					<arco-catalogue:recoveredData>
						<xsl:value-of select="normalize-space(schede/*/AN/RDP)" />
					</arco-catalogue:recoveredData>
				</xsl:if>
			</rdf:Description>
			<!-- This block introduces the triples about the sheet versions. I.e. 
				sub-elements of schede/*/CM -->
			<xsl:if test="schede/*/CM/CMP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-compilation')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/catalogue/CatalogueRecordVersion/'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of
							select="concat(schede/*/CM/CMP/@hint, ' - ', normalize-space(schede/*/CM/CMP))" />
					</rdfs:label>
					<arco-catalogue:isCatalogueRecordVersionOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
                        </xsl:attribute>
					</arco-catalogue:isCatalogueRecordVersionOf>
					<xsl:if test="schede/*/CM/CMP/CMPN">
						<arco-catalogue:hasCatalogueRecordRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-compilation-', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPN)))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordRiT>
						<arco-catalogue:hasResponsibleResearchAndCompilation>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPN)))" />
                            </xsl:attribute>
						</arco-catalogue:hasResponsibleResearchAndCompilation>
					</xsl:if>
					<xsl:if test="schede/*/CM/CMP/CMPD">
						<arco-catalogue:editedAtTime>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPD)))" />
                            </xsl:attribute>
						</arco-catalogue:editedAtTime>
					</xsl:if>
					<!-- Referente verifica scientifica -->
					<xsl:if test="schede/*/CM/RSR">
						<arco-catalogue:hasCatalogueRecordRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(schede/*/CM/RSR/@hint)), '-', arco-fn:urify(normalize-space(schede/*/CM/RSR)))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordRiT>
						<arco-catalogue:hasScientificDirector>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RSR)))" />
                            </xsl:attribute>
						</arco-catalogue:hasScientificDirector>
					</xsl:if>
					<!-- Funzionario responsabile -->
					<xsl:if
						test="schede/*/CM/FUR and not(lower-case(normalize-space(schede/*/CM/FUR))='nr' or lower-case(normalize-space(schede/*/CM/FUR))='n.r.' or lower-case(normalize-space(schede/*/CM/FUR))='nr (recupero pregresso)')">
						<arco-catalogue:hasCatalogueRecordRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(schede/*/CM/FUR/@hint)), '-', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordRiT>
						<arco-catalogue:hasOfficialInCharge>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                            </xsl:attribute>
						</arco-catalogue:hasOfficialInCharge>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
			<!-- This block introduces the triples about the sheet versions for RVM. 
				I.e. sub-elements of schede/*/RVM -->
			<xsl:if test="schede/*/CM/RVM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-rvm')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/catalogue/CatalogueRecordVersion'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of
							select="concat(schede/*/CM/RVM/@hint, ' - ', normalize-space(schede/*/CM/RVM))" />
					</rdfs:label>
					<arco-catalogue:isCatalogueRecordVersionOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
                        </xsl:attribute>
					</arco-catalogue:isCatalogueRecordVersionOf>
					<xsl:if test="schede/*/CM/RVM/RVMN">
						<arco-catalogue:hasCatalogueRecordRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-rvm-', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMN)))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordRiT>
						<arco-catalogue:hasDigitalTranscriptionOperator>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMN)))" />
                            </xsl:attribute>
						</arco-catalogue:hasDigitalTranscriptionOperator>
					</xsl:if>
					<xsl:if test="schede/*/CM/RVM/RVME">
						<arco-catalogue:hasCatalogueRecordRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-rvm-', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVME)))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordRiT>
						<arco-catalogue:hasDigitalTranscriptionResponsibleAgent>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVME)))" />
                            </xsl:attribute>
						</arco-catalogue:hasDigitalTranscriptionResponsibleAgent>
					</xsl:if>
					<xsl:if test="schede/*/CM/RVM/RVMD">
						<arco-catalogue:editedAtTime>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMD)))" />
                            </xsl:attribute>
						</arco-catalogue:editedAtTime>
					</xsl:if>
					<!-- Referente verifica scientifica -->
					<xsl:if test="schede/*/CM/RSR">
						<arco-catalogue:hasCatalogueRecordRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(schede/*/CM/RSR/@hint)), '-', arco-fn:urify(normalize-space(schede/*/CM/RSR)))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordRiT>
					</xsl:if>
					<!-- Funzionario responsabile -->
					<xsl:if
						test="schede/*/CM/FUR and not(lower-case(normalize-space(schede/*/CM/FUR))='nr' or lower-case(normalize-space(schede/*/CM/FUR))='n.r.' or lower-case(normalize-space(schede/*/CM/FUR))='nr (recupero pregresso)')">
						<arco-catalogue:hasCatalogueRecordRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(schede/*/CM/FUR/@hint)), '-', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordRiT>
						<arco-catalogue:hasOfficialInCharge>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                            </xsl:attribute>
						</arco-catalogue:hasOfficialInCharge>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
			<!-- This block introduces the triples about the sheet versions for AGG. 
				I.e. sub-elements of schede/*/AGG -->
			<xsl:for-each select="schede/*/CM/AGG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-agg-', position())" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/catalogue/CatalogueRecordVersion'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="concat(./@hint, ' - ', normalize-space(.))" />
					</rdfs:label>
					<arco-catalogue:isCatalogueRecordVersionOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
                        </xsl:attribute>
					</arco-catalogue:isCatalogueRecordVersionOf>
					<xsl:if test="./AGGN">
						<arco-catalogue:hasCatalogueRecordRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:urify(normalize-space(./AGGN)))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordRiT>
						<arco-catalogue:hasUpdateResponsibleResearchAndCompilation>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGN)))" />
                            </xsl:attribute>
						</arco-catalogue:hasUpdateResponsibleResearchAndCompilation>
					</xsl:if>
					<xsl:if test="./AGGR">
						<arco-catalogue:hasCatalogueRecordRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:urify(normalize-space(./AGGR)))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordRiT>
						<arco-catalogue:hasUpdateScientificRevisor>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGR)))" />
                            </xsl:attribute>
						</arco-catalogue:hasUpdateScientificRevisor>
					</xsl:if>
					<xsl:if test="./AGGE">
						<arco-catalogue:hasCatalogueRecordRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:urify(normalize-space(./AGGE)))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordRiT>
						<arco-catalogue:hasUpdateResponsibleAgent>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGE)))" />
                            </xsl:attribute>
						</arco-catalogue:hasUpdateResponsibleAgent>
					</xsl:if>
					<xsl:if test="./AGGD">
						<arco-catalogue:editedAtTime>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./AGGD)))" />
                            </xsl:attribute>
						</arco-catalogue:editedAtTime>
					</xsl:if>
					<!-- Funzionario responsabile -->
					<xsl:if
						test="./AGGF and not(lower-case(normalize-space(./AGGF))='nr' or lower-case(normalize-space(./AGGF))='n.r.' or lower-case(normalize-space(./AGGF))='nr (recupero pregresso)')">
						<arco-catalogue:hasCatalogueRecordRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(./AGGF/@hint)), '-', arco-fn:urify(normalize-space(./AGGF)))" />
                            </xsl:attribute>
						</arco-catalogue:hasCatalogueRecordRiT>
						<arco-catalogue:hasUpdateOfficialInCharge>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGF)))" />
                            </xsl:attribute>
						</arco-catalogue:hasUpdateOfficialInCharge>
					</xsl:if>
				</rdf:Description>
				<!-- Time interval -->
				<xsl:if test="./AGGD">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./AGGD)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AGGD)" />
						</rdfs:label>
					</rdf:Description>
				</xsl:if>
				<!-- Participant role AGGN -->
				<xsl:if test="./AGGN">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:urify(normalize-space(./AGGN)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat(./@hint, ' da ', normalize-space(./AGGN))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Update', ' by ', normalize-space(./AGGN))" />
						</rdfs:label>
						<roapit:withRole>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Role/UpdateResponsibleCompilation')" />
                            </xsl:attribute>
						</roapit:withRole>
						<roapit:isRoleInTimeOf>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGN)))" />
                            </xsl:attribute>
						</roapit:isRoleInTimeOf>
					</rdf:Description>
					<!-- Role -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Role/UpdateResponsibleCompilation')" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Update responsible research and compilation'" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="'Responsabile di ricerca e redazione di aggiornamento'" />
						</rdfs:label>
					</rdf:Description>
					<!-- Agent -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGN)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AGGN)" />
						</rdfs:label>
					</rdf:Description>
				</xsl:if>
				<!-- Participant role - AGGE -->
				<xsl:if test="./AGGE">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:urify(normalize-space(./AGGE)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat(./@hint, ' da ', normalize-space(./AGGE))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Update', ' by ', normalize-space(./AGGE))" />
						</rdfs:label>
						<roapit:withRole>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Role/UpdateResponsible')" />
                            </xsl:attribute>
						</roapit:withRole>
						<roapit:isRoleInTimeOf>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGE)))" />
                            </xsl:attribute>
						</roapit:isRoleInTimeOf>
					</rdf:Description>
					<!-- Role -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Role/UpdateResponsible')" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Update responsible'" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Responsabile di aggiornamento'" />
						</rdfs:label>
					</rdf:Description>
					<!-- Agent -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGE)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AGGE)" />
						</rdfs:label>
					</rdf:Description>
				</xsl:if>
				<!-- Participant role - AGGR -->
				<xsl:if test="./AGGR">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:urify(normalize-space(./AGGR)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="concat(./@hint, ' da ', normalize-space(./AGGR))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="concat('Update', ' by ', normalize-space(./AGGR))" />
						</rdfs:label>
						<roapit:withRole>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Role/UpdateScientificRevisor')" />
                            </xsl:attribute>
						</roapit:withRole>
						<roapit:isRoleInTimeOf>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGR)))" />
                            </xsl:attribute>
						</roapit:isRoleInTimeOf>
					</rdf:Description>
					<!-- Role -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Role/UpdateScientificRevisor')" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Update scientific revisor'" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Referente verifica scientifica'" />
						</rdfs:label>
					</rdf:Description>
					<!-- Agent -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGR)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AGGR)" />
						</rdfs:label>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Referente verifica scientifica -->
			<xsl:if test="schede/*/CM/RSR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(schede/*/CM/RSR/@hint)), '-', arco-fn:urify(normalize-space(schede/*/CM/RSR)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat(schede/*/CM/RSR/@hint, ': ', normalize-space(schede/*/CM/RSR))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Scientific director', ': ', normalize-space(schede/*/CM/RSR))" />
					</rdfs:label>
					<roapit:withRole>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Role/ScientificDirector')" />
                        </xsl:attribute>
					</roapit:withRole>
					<roapit:isRoleInTimeOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RSR)))" />
                        </xsl:attribute>
					</roapit:isRoleInTimeOf>
				</rdf:Description>
				<!-- Agent: Referente verifica scientifica -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RSR)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/CM/RSR)" />
					</rdfs:label>
				</rdf:Description>
				<!-- Role: Referente verifica scientifica -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Role/ScientificDirector')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="normalize-space(schede/*/CM/RSR/@hint)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Scientific Director'" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<!-- Funzionario responsabile -->
			<xsl:if
				test="schede/*/CM/FUR and not(lower-case(normalize-space(schede/*/CM/FUR))='nr' or lower-case(normalize-space(schede/*/CM/FUR))='n.r.' or lower-case(normalize-space(schede/*/CM/FUR))='nr (recupero pregresso)')">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(schede/*/CM/FUR/@hint)), '-', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat(schede/*/CM/FUR/@hint, ': ', normalize-space(schede/*/CM/FUR))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Official in charge', ': ', normalize-space(schede/*/CM/FUR))" />
					</rdfs:label>
					<roapit:withRole>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Role/OfficialInCharge')" />
                        </xsl:attribute>
					</roapit:withRole>
					<roapit:isRoleInTimeOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                        </xsl:attribute>
					</roapit:isRoleInTimeOf>
				</rdf:Description>
				<!-- Agent: Funzionario responsabile -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/CM/FUR)" />
					</rdfs:label>
				</rdf:Description>
				<!-- Role: Funzionario responsabile -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Role/OfficialInCharge')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="normalize-space(schede/*/CM/FUR/@hint)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Official in charge'" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<!-- Funzionario responsabile - AGGF -->
			<xsl:if
				test="schede/*/CM/AGG/AGGF and not(lower-case(normalize-space(schede/*/CM/AGG/AGGF))='nr' or lower-case(normalize-space(schede/*/CM/AGG/AGGF))='n.r.' or lower-case(normalize-space(schede/*/CM/AGG/AGGF))='nr (recupero pregresso)')">
				<xsl:for-each select="schede/*/CM/AGG">
					<xsl:if test="./AGGF">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                        <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(./AGGF/@hint)), '-', arco-fn:urify(normalize-space(./AGGF)))" />
                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                            <xsl:value-of
									select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat(./AGGF/@hint, ' di aggiornamento: ', normalize-space(./AGGF))" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Update official in charge', ': ', normalize-space(./AGGF))" />
							</rdfs:label>
							<roapit:withRole>
								<xsl:attribute name="rdf:resource">
                            <xsl:value-of
									select="concat($NS, 'Role/OfficialInCharge')" />
                        </xsl:attribute>
							</roapit:withRole>
							<roapit:isRoleInTimeOf>
								<xsl:attribute name="rdf:resource">
                            <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGF)))" />
                        </xsl:attribute>
							</roapit:isRoleInTimeOf>
						</rdf:Description>
						<!-- Agent: Funzionario responsabile AGGF -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                        <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGF)))" />
                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                            <xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./AGGF)" />
							</rdfs:label>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
				<!-- Role funzionario responsabile -->
				<xsl:if test="./AGGF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                        <xsl:value-of
							select="concat($NS, 'Role/OfficialInCharge')" />
                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                            <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="normalize-space(schede/*/CM/AGG/@hint)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Official in charge'" />
						</rdfs:label>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<!-- Version time interval - CMD -->
			<xsl:if test="schede/*/CM/CMP/CMPD">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPD)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/CM/CMP/CMPD)" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<!-- Version time interval - RVM -->
			<xsl:if test="schede/*/CM/RVM/RVMD">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMD)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/CM/RVM/RVMD)" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<!-- Participant role - Compilation -->
			<xsl:if test="schede/*/CM/CMP/CMPN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'TimeIndexedRole/', $itemURI, '-compilation-', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPN)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Compilation by ', normalize-space(schede/*/CM/CMP/CMPN))" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Compilazione da ', normalize-space(schede/*/CM/CMP/CMPN))" />
					</rdfs:label>
					<roapit:withRole>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Role/ResponsibleCompilation')" />
                        </xsl:attribute>
					</roapit:withRole>
					<roapit:isRoleInTimeOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPN)))" />
                        </xsl:attribute>
					</roapit:isRoleInTimeOf>
				</rdf:Description>
			</xsl:if>
			<!-- responsible research and compilation Agent -->
			<xsl:if test="schede/*/CM/CMP/CMPN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPN)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/CM/CMP/CMPN)" />
					</rdfs:label>
				</rdf:Description>
				<!-- responsible research and compilation role -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Role/ResponsibleCompilation')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Responsible research and compilation'" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Responsabile ricerca e redazione'" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<!-- Participant role - RVME -->
			<xsl:if test="schede/*/CM/RVM/RVME">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'TimeIndexedRole/', $itemURI, '-rvm-', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVME)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat(schede/*/CM/RVM/@hint, ' da ', normalize-space(schede/*/CM/RVM/RVME))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Digital transcription', ' by ', normalize-space(schede/*/CM/RVM/RVME))" />
					</rdfs:label>
					<roapit:withRole>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Role/DigitalTranscriptionResponsibleAgent')" />
                        </xsl:attribute>
					</roapit:withRole>
					<roapit:isRoleInTimeOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVME)))" />
                        </xsl:attribute>
					</roapit:isRoleInTimeOf>
				</rdf:Description>
				<!-- digital transcription responsible agent -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVME)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/CM/RVM/RVME)" />
					</rdfs:label>
				</rdf:Description>
				<!-- digital transcription responsible agent role -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Role/DigitalTranscriptionResponsibleAgent')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Digital transcription responsible agent'" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="'Responsabile della trascrizione per informatizzazione'" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<!-- Participant role - RVMN -->
			<xsl:if test="schede/*/CM/RVM/RVMN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'TimeIndexedRole/', $itemURI, '-rvm-', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMN)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat(schede/*/CM/RVM/@hint, ' da ', normalize-space(schede/*/CM/RVM/RVMN))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Digital transcription', ' by ', normalize-space(schede/*/CM/RVM/RVMN))" />
					</rdfs:label>
					<roapit:withRole>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Role/DigitalTranscriptionOperator')" />
                        </xsl:attribute>
					</roapit:withRole>
					<roapit:isRoleInTimeOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMN)))" />
                        </xsl:attribute>
					</roapit:isRoleInTimeOf>
				</rdf:Description>
				<!-- digital transcription agent -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMN)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/CM/RVM/RVMN)" />
					</rdfs:label>
				</rdf:Description>
				<!-- digital transciption operator role -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Role/DigitalTranscriptionOperator')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Digital transcription operator'" />
					</rdfs:label>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="'Operatore della trascrizione per informatizzazione'" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>



			<!-- We then introduce the cultural entity described by the sheet. -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                    <xsl:value-of
					select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                </xsl:attribute>
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
				<!-- rdfs:comment of cultural property -->
				<rdfs:comment>
					<xsl:for-each select="schede/*/OG/OGT/*">
						<xsl:choose>
							<xsl:when test="position() = 1">
								<xsl:value-of select="./text()" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(', ', ./text())" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
					<!-- comment for BDI 3.00 and 3.01 -->
					<xsl:for-each select="schede/*/DB/*">
						<xsl:choose>
							<xsl:when test="position() = 1">
								<xsl:value-of select="./text()" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat(', ', ./text())" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
					<xsl:if test="schede/*/SGT/SGTI">
						<xsl:value-of select="concat(' ', schede/*/SGT/SGTI)" />
					</xsl:if>
				</rdfs:comment>
				<xsl:for-each select="schede/*/OG/OGT">
					<arco-dd:hasCulturalPropertyType>
						<xsl:attribute name="rdf:resource">
                            <xsl:choose>
                                <xsl:when test="./OGTT">
                                    <xsl:value-of
							select="concat($NS, 'CulturalPropertyType/', arco-fn:urify(normalize-space(./OGTD)), '-', arco-fn:urify(normalize-space(./OGTT)))" />
                                </xsl:when>
                                <xsl:when test="./OGTD">
                                    <xsl:value-of
							select="concat($NS, 'CulturalPropertyType/', arco-fn:urify(normalize-space(./OGTD)))" />
                                </xsl:when>
                            </xsl:choose>
                        </xsl:attribute>
					</arco-dd:hasCulturalPropertyType>
				</xsl:for-each>
			</rdf:Description>
			<!-- Subject as an individual (sgti) -->
			<xsl:for-each select="schede/*/*/SGT/SGTI">
				<xsl:if
					test="not(lower-case(normalize-space(.))='nr' or lower-case(normalize-space(.))='n.r.' or lower-case(normalize-space(.))='nr (recupero pregresso)')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(.)))" />
            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                          <xsl:value-of
								select="'https://w3id.org/arco/context-description/Subject'" />
                        </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(.)" />
						</l0:name>
						<arco-cd:isSubjectOf>
							<xsl:attribute name="rdf:resource">
                    		<xsl:value-of
								select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                    	</xsl:attribute>
						</arco-cd:isSubjectOf>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Subject as an individual (aidi) -->
			<xsl:for-each select="schede/*/DA/AID/AIDI">
				<xsl:if
					test="not(lower-case(normalize-space(.))='nr' or lower-case(normalize-space(.))='n.r.' or lower-case(normalize-space(.))='nr (recupero pregresso)')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(.)))" />
            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                          <xsl:value-of
								select="'https://w3id.org/arco/context-description/Subject'" />
                        </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(.)" />
						</l0:name>
						<arco-cd:isSubjectOf>
							<xsl:attribute name="rdf:resource">
                    		<xsl:value-of
								select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                    	</xsl:attribute>
						</arco-cd:isSubjectOf>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Title as an individual for SG/SGL/SGLL -->
			<xsl:if
				test="not(lower-case(normalize-space(schede/*/SG/SGL/SGLL))='nr' or lower-case(normalize-space(schede/*/SG/SGL/SGLL))='n.r.' or lower-case(normalize-space(schede/*/SG/SGL/SGLL))='nr (recupero pregresso)')">
				<xsl:for-each select="schede/*/SG/SGL/SGLL">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
            			</xsl:attribute>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(.)" />
						</l0:name>
						<arco-cd:hasTitleType>
							<xsl:attribute name="rdf:resource">
            			<xsl:value-of
								select="'https://w3id.org/arco/context-description/Parallel'" />
            		</xsl:attribute>
						</arco-cd:hasTitleType>
						<xsl:if test="../SGLS">
							<arco-core:specifications>
								<xsl:value-of select="normalize-space(../SGLS)" />
							</arco-core:specifications>
						</xsl:if>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Title as an individual for SG/SGT/SGTT -->
			<xsl:for-each select="schede/*/OG/SGT/SGTT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            				<xsl:value-of
						select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
            			</xsl:attribute>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
					<xsl:if test="../SGTL">
						<arco-cd:hasSource>
							<xsl:attribute name="rdf:resource">
	            					<xsl:value-of
								select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../SGTL)))" />
	            				</xsl:attribute>
						</arco-cd:hasSource>
					</xsl:if>
				</rdf:Description>
				<!-- Title source as an individual -->
				<xsl:if test="../SGTL">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                				<xsl:value-of
							select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../SGTL)))" />
                			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                            		<xsl:value-of
								select="'https://w3id.org/arco/context-description/Source'" />
                        		</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(../SGTL)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(../SGTL)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Title as an individual for DA/AID/AIDT -->
			<xsl:for-each select="schede/*/DA/AID/AIDT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            				<xsl:value-of
						select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
            			</xsl:attribute>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
			<!-- Title as an individual for DA/AID/AIDN -->
			<xsl:for-each select="schede/*/DA/AID/AIDN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            				<xsl:value-of
						select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
            			</xsl:attribute>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
					<arco-cd:hasTitleType>
						<xsl:attribute name="rdf:resource">
            			<xsl:value-of
							select="'https://w3id.org/arco/context-description/Alternative'" />
            		</xsl:attribute>
					</arco-cd:hasTitleType>
				</rdf:Description>
			</xsl:for-each>
			<!-- Title as an individual for SG/SGT/SGTP -->
			<xsl:for-each select="schede/*/SG/SGT/SGTP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            				<xsl:value-of
						select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
            			</xsl:attribute>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
					<arco-cd:hasTitleType>
						<xsl:attribute name="rdf:resource">
            			<xsl:value-of
							select="'https://w3id.org/arco/context-description/Proper'" />
            		</xsl:attribute>
					</arco-cd:hasTitleType>
					<xsl:if test="../SGTL">
						<arco-cd:hasSource>
							<xsl:attribute name="rdf:resource">
	            					<xsl:value-of
								select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../SGTL)))" />
	            				</xsl:attribute>
						</arco-cd:hasSource>
					</xsl:if>
				</rdf:Description>
				<!-- Title source as an individual -->
				<xsl:if test="../SGTL">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                				<xsl:value-of
							select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../SGTL)))" />
                			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                            		<xsl:value-of
								select="'https://w3id.org/arco/context-description/Source'" />
                        		</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(../SGTL)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(../SGTL)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Title as an individual for SG/SGL/SGLT -->
			<xsl:if
				test="not(lower-case(normalize-space(schede/*/SG/SGL/SGLT))='nr' or lower-case(normalize-space(schede/*/SG/SGL/SGLT))='n.r.' or lower-case(normalize-space(schede/*/SG/SGL/SGLT))='nr (recupero pregresso)')">
				<xsl:for-each select="schede/*/SG/SGL/SGLT">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
            			</xsl:attribute>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(.)" />
						</l0:name>
						<arco-cd:hasTitleType>
							<xsl:attribute name="rdf:resource">
            			<xsl:value-of
								select="'https://w3id.org/arco/context-description/Proper'" />
            		</xsl:attribute>
						</arco-cd:hasTitleType>
						<xsl:if test="../SGLS">
							<arco-core:specifications>
								<xsl:value-of select="normalize-space(../SGLS)" />
							</arco-core:specifications>
						</xsl:if>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- Title as an individual for SG/SGT/SGTR -->
			<xsl:for-each select="schede/*/SG/SGT/SGTR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            				<xsl:value-of
						select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
            			</xsl:attribute>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
					<arco-cd:hasTitleType>
						<xsl:attribute name="rdf:resource">
            			<xsl:value-of
							select="'https://w3id.org/arco/context-description/Parallel'" />
            		</xsl:attribute>
					</arco-cd:hasTitleType>
					<xsl:if test="../SGTL">
						<arco-cd:hasSource>
							<xsl:attribute name="rdf:resource">
	            					<xsl:value-of
								select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../SGTL)))" />
	            				</xsl:attribute>
						</arco-cd:hasSource>
					</xsl:if>
				</rdf:Description>
				<!-- Title source as an individual -->
				<xsl:if test="../SGTL">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                				<xsl:value-of
							select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../SGTL)))" />
                			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                            		<xsl:value-of
								select="'https://w3id.org/arco/context-description/Source'" />
                        		</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(../SGTL)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(../SGTL)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Title as an individual for SG/SGL/SGLA -->
			<xsl:if
				test="not(lower-case(normalize-space(schede/*/SG/SGL/SGLA))='nr' or lower-case(normalize-space(schede/*/SG/SGL/SGLA))='n.r.' or lower-case(normalize-space(schede/*/SG/SGL/SGLA))='nr (recupero pregresso)')">
				<xsl:for-each select="schede/*/SG/SGL/SGLA">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Title/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
            			</xsl:attribute>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(.)" />
						</l0:name>
						<arco-cd:hasTitleType>
							<xsl:attribute name="rdf:resource">
            			<xsl:value-of
								select="'https://w3id.org/arco/context-description/Attributed'" />
            		</xsl:attribute>
						</arco-cd:hasTitleType>
						<xsl:if test="../SGLS">
							<arco-core:specifications>
								<xsl:value-of select="normalize-space(../SGLS)" />
							</arco-core:specifications>
						</xsl:if>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- relation with preparatory or final work (RO/ROF) -->
			<xsl:if test="schede/*/RO/ROF">
				<xsl:for-each select="schede/*/RO/ROF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:value-of
							select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-preparatory-final-work-', position())" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/RelatedWorkSituation'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e opera originale o finale')" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e opera originale o finale')" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and preparatory or final work')" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and preparatory or final work')" />
						</l0:name>
						<xsl:choose>
							<xsl:when
								test="lower-case(normalize-space(./ROFF))='calco' or lower-case(normalize-space(./ROFF))='calco parziale' or lower-case(normalize-space(./ROFF))='copia' or lower-case(normalize-space(./ROFF))='copia con varianti' or lower-case(normalize-space(./ROFF))='copia parziale' or lower-case(normalize-space(./ROFF))='derivazione' or lower-case(normalize-space(./ROFF))='derivazione con varianti' or lower-case(normalize-space(./ROFF))='derivazione parziale' or lower-case(normalize-space(./ROFF))='imitazione' or lower-case(normalize-space(./ROFF))='remake' or lower-case(normalize-space(./ROFF))='replica' or lower-case(normalize-space(./ROFF))='replica parziale' or lower-case(normalize-space(./ROFF))='replica con varianti' or lower-case(normalize-space(./ROFF))='positivo' or lower-case(normalize-space(./ROFF))='particolare' or lower-case(normalize-space(./ROFF))='fotomontaggio'">
								<arco-cd:hasRelatedWork>
									<xsl:attribute name="rdf:resource">
											<xsl:value-of
										select="concat($NS, 'PreparatoryWork/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
										</xsl:attribute>
								</arco-cd:hasRelatedWork>
							</xsl:when>
							<xsl:when
								test="lower-case(normalize-space(./ROFF))='bozzetto' or lower-case(normalize-space(./ROFF))='bozzetto parziale' or lower-case(normalize-space(./ROFF))='cartone' or lower-case(normalize-space(./ROFF))='cartone parziale' or lower-case(normalize-space(./ROFF))='disegno preparatorio parziale' or lower-case(normalize-space(./ROFF))='disegno preparatorio' or lower-case(normalize-space(./ROFF))='matrice' or lower-case(normalize-space(./ROFF))='matrice parziale' or lower-case(normalize-space(./ROFF))='modellino' or lower-case(normalize-space(./ROFF))='modellino parziale' or lower-case(normalize-space(./ROFF))='modello' or lower-case(normalize-space(./ROFF))='modello parziale' or lower-case(normalize-space(./ROFF))='modello in cera' or lower-case(normalize-space(./ROFF))='progetto' or lower-case(normalize-space(./ROFF))='prototipo' or lower-case(normalize-space(./ROFF))='prova' or lower-case(normalize-space(./ROFF))='schizzo' or lower-case(normalize-space(./ROFF))='sinopia' or lower-case(normalize-space(./ROFF))='sinopia parziale' or lower-case(normalize-space(./ROFF))='negativo' or lower-case(normalize-space(./ROFF))='internegativo' or lower-case(normalize-space(./ROFF))='prova a contatto' or lower-case(normalize-space(./ROFF))='prova di stampa' or lower-case(normalize-space(./ROFF))='prova intermedia' or lower-case(normalize-space(./ROFF))='prova in controparte' or lower-case(normalize-space(./ROFF))='prova finale' or lower-case(normalize-space(./ROFF))='provino' or lower-case(normalize-space(./ROFF))='maquette'">
								<arco-cd:hasRelatedWork>
									<xsl:attribute name="rdf:resource">
											<xsl:value-of
										select="concat($NS, 'FinalWork/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
										</xsl:attribute>
								</arco-cd:hasRelatedWork>
							</xsl:when>
							<xsl:otherwise>
								<arco-cd:hasRelatedWork>
									<xsl:attribute name="rdf:resource">
											<xsl:value-of
										select="concat($NS, 'PreparatoryOrFinalWork/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
										</xsl:attribute>
								</arco-cd:hasRelatedWork>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="./ROFF">
							<arco-cd:hasCulturalPropertyStage>
								<xsl:attribute name="rdf:resource">
										<xsl:value-of
									select="concat($NS, 'CulturalPropertyStage/', arco-fn:urify(normalize-space(./ROFF)))" />
									</xsl:attribute>
							</arco-cd:hasCulturalPropertyStage>
						</xsl:if>
						<xsl:if test="./ROFP">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./ROFP)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
					<!-- preparatory work, final work and preparatory or final work as individuals -->
					<xsl:choose>
						<!-- preparatory work as an individual -->
						<xsl:when
							test="lower-case(normalize-space(./ROFF))='calco' or lower-case(normalize-space(./ROFF))='calco parziale' or lower-case(normalize-space(./ROFF))='copia' or lower-case(normalize-space(./ROFF))='copia con varianti' or lower-case(normalize-space(./ROFF))='copia parziale' or lower-case(normalize-space(./ROFF))='derivazione' or lower-case(normalize-space(./ROFF))='derivazione con varianti' or lower-case(normalize-space(./ROFF))='derivazione parziale' or lower-case(normalize-space(./ROFF))='imitazione' or lower-case(normalize-space(./ROFF))='remake' or lower-case(normalize-space(./ROFF))='replica' or lower-case(normalize-space(./ROFF))='replica parziale' or lower-case(normalize-space(./ROFF))='replica con varianti'">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
										<xsl:value-of
									select="concat($NS, 'PreparatoryWork/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
									</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
		                          		<xsl:value-of
										select="'https://w3id.org/arco/context-description/PreparatoryWork'" />
		                       		</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="it">
									<xsl:value-of
										select="concat('Opera originale ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(./ROFO))" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of
										select="concat('Opera originale ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(./ROFO))" />
								</l0:name>
								<rdfs:label xml:lang="en">
									<xsl:value-of
										select="concat('Preparatory work ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(./ROFO))" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of
										select="concat('Preparatory work ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(./ROFO))" />
								</l0:name>
								<xsl:if test="./ROFS">
									<arco-cd:hasSubject>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(./ROFS)))" />
										</xsl:attribute>
									</arco-cd:hasSubject>
								</xsl:if>
								<xsl:if test="./ROFR">
									<arco-cd:preparatoryOrFinalWorkPreviousLocation>
										<xsl:value-of select="normalize-space(./ROFR)" />
									</arco-cd:preparatoryOrFinalWorkPreviousLocation>
								</xsl:if>
								<xsl:if test="./ROFC">
									<arco-cd:relatedWorkLocation>
										<xsl:value-of select="normalize-space(./ROFC)" />
									</arco-cd:relatedWorkLocation>
								</xsl:if>
								<xsl:if test="./ROFX">
									<arco-cd:preparatoryOrFinalWorkRecordIdentifier>
										<xsl:value-of select="normalize-space(./ROFX)" />
									</arco-cd:preparatoryOrFinalWorkRecordIdentifier>
								</xsl:if>
								<xsl:if test="./ROFI">
									<arco-cd:hasInventory>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Inventory/', $itemURI, '-preparatory-final-work-inventory-', arco-fn:urify(normalize-space(./ROFI)))" />
										</xsl:attribute>
									</arco-cd:hasInventory>
								</xsl:if>
								<xsl:if test="./ROFT">
									<arco-cd:hasTitle>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Title/', $itemURI, '-preparatory-final-work-title-', arco-fn:urify(normalize-space(./ROFT)))" />
										</xsl:attribute>
									</arco-cd:hasTitle>
								</xsl:if>
								<xsl:if test="./ROFD">
									<arco-cd:hasDating>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Dating/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />						
										</xsl:attribute>
									</arco-cd:hasDating>
								</xsl:if>
								<xsl:if test="./ROFA">
									<arco-cd:hasAuthor>
										<xsl:attribute name="rdf:resource">
			            					<xsl:value-of
											select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ROFA)))" />
			            				</xsl:attribute>
									</arco-cd:hasAuthor>
								</xsl:if>
							</rdf:Description>
						</xsl:when>
						<!-- final work as an individual -->
						<xsl:when
							test="lower-case(normalize-space(./ROFF))='bozzetto' or lower-case(normalize-space(./ROFF))='bozzetto parziale' or lower-case(normalize-space(./ROFF))='cartone' or lower-case(normalize-space(./ROFF))='cartone parziale' or lower-case(normalize-space(./ROFF))='disegno preparatorio parziale' or lower-case(normalize-space(./ROFF))='disegno preparatorio' or lower-case(normalize-space(./ROFF))='matrice' or lower-case(normalize-space(./ROFF))='matrice parziale' or lower-case(normalize-space(./ROFF))='modellino' or lower-case(normalize-space(./ROFF))='modellino parziale' or lower-case(normalize-space(./ROFF))='modello' or lower-case(normalize-space(./ROFF))='modello parziale' or lower-case(normalize-space(./ROFF))='modello in cera' or lower-case(normalize-space(./ROFF))='progetto' or lower-case(normalize-space(./ROFF))='prototipo' or lower-case(normalize-space(./ROFF))='prova' or lower-case(normalize-space(./ROFF))='schizzo' or lower-case(normalize-space(./ROFF))='sinopia' or lower-case(normalize-space(./ROFF))='sinopia parziale'">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
									<xsl:value-of
									select="concat($NS, 'FinalWork/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
								</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
										select="'https://w3id.org/arco/context-description/FinalWork'" />
	                       		</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="it">
									<xsl:value-of
										select="concat('Opera finale ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(./ROFO))" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of
										select="concat('Opera finale ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(./ROFO))" />
								</l0:name>
								<rdfs:label xml:lang="en">
									<xsl:value-of
										select="concat('Final work ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(./ROFO))" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of
										select="concat('Final work ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(./ROFO))" />
								</l0:name>
								<xsl:if test="./ROFS">
									<arco-cd:hasSubject>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(./ROFS)))" />
										</xsl:attribute>
									</arco-cd:hasSubject>
								</xsl:if>
								<xsl:if test="./ROFR">
									<arco-cd:preparatoryOrFinalWorkPreviousLocation>
										<xsl:value-of select="normalize-space(./ROFR)" />
									</arco-cd:preparatoryOrFinalWorkPreviousLocation>
								</xsl:if>
								<xsl:if test="./ROFC">
									<arco-cd:relatedWorkLocation>
										<xsl:value-of select="normalize-space(./ROFC)" />
									</arco-cd:relatedWorkLocation>
								</xsl:if>
								<xsl:if test="./ROFX">
									<arco-cd:preparatoryOrFinalWorkRecordIdentifier>
										<xsl:value-of select="normalize-space(./ROFX)" />
									</arco-cd:preparatoryOrFinalWorkRecordIdentifier>
								</xsl:if>
								<xsl:if test="./ROFI">
									<arco-cd:hasInventory>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Inventory/', $itemURI, '-preparatory-final-work-inventory-', arco-fn:urify(normalize-space(./ROFI)))" />
										</xsl:attribute>
									</arco-cd:hasInventory>
								</xsl:if>
								<xsl:if test="./ROFT">
									<arco-cd:hasTitle>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Title/', $itemURI, '-preparatory-final-work-title-', arco-fn:urify(normalize-space(./ROFT)))" />
										</xsl:attribute>
									</arco-cd:hasTitle>
								</xsl:if>
								<xsl:if test="./ROFD">
									<arco-cd:hasDating>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Dating/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />						
										</xsl:attribute>
									</arco-cd:hasDating>
								</xsl:if>
								<xsl:if test="./ROFA">
									<arco-cd:hasAuthor>
										<xsl:attribute name="rdf:resource">
			            					<xsl:value-of
											select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ROFA)))" />
			            				</xsl:attribute>
									</arco-cd:hasAuthor>
								</xsl:if>
							</rdf:Description>
						</xsl:when>
						<!-- final or preparatory work as an individual -->
						<xsl:otherwise>
							<rdf:Description>
								<xsl:attribute name="rdf:about">
										<xsl:value-of
									select="concat($NS, 'PreparatoryOrFinalWork/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
									</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
		                          		<xsl:value-of
										select="'https://w3id.org/arco/context-description/PreparatoryOrFinalWork'" />
		                       		</xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="it">
									<xsl:value-of
										select="concat('Opera originale o finale ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(./ROFO))" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of
										select="concat('Opera originale o finale ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(./ROFO))" />
								</l0:name>
								<rdfs:label xml:lang="en">
									<xsl:value-of
										select="concat('Preparatory or final work ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(./ROFO))" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of
										select="concat('Preparatory or final work ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(./ROFO))" />
								</l0:name>
								<xsl:if test="./ROFS">
									<arco-cd:hasSubject>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(./ROFS)))" />
										</xsl:attribute>
									</arco-cd:hasSubject>
								</xsl:if>
								<xsl:if test="./ROFR">
									<arco-cd:preparatoryOrFinalWorkPreviousLocation>
										<xsl:value-of select="normalize-space(./ROFR)" />
									</arco-cd:preparatoryOrFinalWorkPreviousLocation>
								</xsl:if>
								<xsl:if test="./ROFC">
									<arco-cd:relatedWorkLocation>
										<xsl:value-of select="normalize-space(./ROFC)" />
									</arco-cd:relatedWorkLocation>
								</xsl:if>
								<xsl:if test="./ROFX">
									<arco-cd:preparatoryOrFinalWorkRecordIdentifier>
										<xsl:value-of select="normalize-space(./ROFX)" />
									</arco-cd:preparatoryOrFinalWorkRecordIdentifier>
								</xsl:if>
								<xsl:if test="./ROFI">
									<arco-cd:hasInventory>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Inventory/', $itemURI, '-preparatory-final-work-inventory-', arco-fn:urify(normalize-space(./ROFI)))" />
										</xsl:attribute>
									</arco-cd:hasInventory>
								</xsl:if>
								<xsl:if test="./ROFT">
									<arco-cd:hasTitle>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Title/', $itemURI, '-preparatory-final-work-title-', arco-fn:urify(normalize-space(./ROFT)))" />
										</xsl:attribute>
									</arco-cd:hasTitle>
								</xsl:if>
								<xsl:if test="./ROFD">
									<arco-cd:hasDating>
										<xsl:attribute name="rdf:resource">
											<xsl:value-of
											select="concat($NS, 'Dating/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />						
										</xsl:attribute>
									</arco-cd:hasDating>
								</xsl:if>
								<xsl:if test="./ROFA">
									<arco-cd:hasAuthor>
										<xsl:attribute name="rdf:resource">
			            					<xsl:value-of
											select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ROFA)))" />
			            				</xsl:attribute>
									</arco-cd:hasAuthor>
								</xsl:if>
							</rdf:Description>
						</xsl:otherwise>
					</xsl:choose>
					<!-- cultural property stage as an individual -->
					<xsl:if test="./ROFF">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
										<xsl:value-of
								select="concat($NS, 'CulturalPropertyStage/', arco-fn:urify(normalize-space(./ROFF)))" />
									</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
			                          		<xsl:value-of
									select="'https://w3id.org/arco/context-description/CulturalPropertyStage'" />
			                       		</xsl:attribute>
							</rdf:type>
							<l0:name>
								<xsl:value-of select="normalize-space(./ROFF)" />
							</l0:name>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./ROFF)" />
							</rdfs:label>
						</rdf:Description>
					</xsl:if>
					<!-- subject of preparatory or final work as an individual -->
					<xsl:if test="./ROFS">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
				            			<xsl:value-of
								select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(./ROFS)))" />
				            		</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				                          <xsl:value-of
									select="'https://w3id.org/arco/context-description/Subject'" />
				                        </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./ROFS)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./ROFS)" />
							</l0:name>
							<arco-cd:isSubjectOf>
								<xsl:attribute name="rdf:resource">
				                    		<xsl:choose>
				                    			<xsl:when
									test="lower-case(normalize-space(./ROFF))='calco' or lower-case(normalize-space(./ROFF))='calco parziale' or lower-case(normalize-space(./ROFF))='copia' or lower-case(normalize-space(./ROFF))='copia con varianti' or lower-case(normalize-space(./ROFF))='copia parziale' or lower-case(normalize-space(./ROFF))='derivazione' or lower-case(normalize-space(./ROFF))='derivazione con varianti' or lower-case(normalize-space(./ROFF))='derivazione parziale' or lower-case(normalize-space(./ROFF))='imitazione' or lower-case(normalize-space(./ROFF))='remake' or lower-case(normalize-space(./ROFF))='replica' or lower-case(normalize-space(./ROFF))='replica parziale' or lower-case(normalize-space(./ROFF))='replica con varianti'">
				                    				<xsl:value-of
									select="concat($NS, 'PreparatoryWork/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
				                    			</xsl:when>
				                    			<xsl:when
									test="lower-case(normalize-space(./ROFF))='bozzetto' or lower-case(normalize-space(./ROFF))='bozzetto parziale' or lower-case(normalize-space(./ROFF))='cartone' or lower-case(normalize-space(./ROFF))='cartone parziale' or lower-case(normalize-space(./ROFF))='disegno preparatorio parziale' or lower-case(normalize-space(./ROFF))='disegno preparatorio' or lower-case(normalize-space(./ROFF))='matrice' or lower-case(normalize-space(./ROFF))='matrice parziale' or lower-case(normalize-space(./ROFF))='modellino' or lower-case(normalize-space(./ROFF))='modellino parziale' or lower-case(normalize-space(./ROFF))='modello' or lower-case(normalize-space(./ROFF))='modello parziale' or lower-case(normalize-space(./ROFF))='modello in cera' or lower-case(normalize-space(./ROFF))='progetto' or lower-case(normalize-space(./ROFF))='prototipo' or lower-case(normalize-space(./ROFF))='prova' or lower-case(normalize-space(./ROFF))='schizzo' or lower-case(normalize-space(./ROFF))='sinopia' or lower-case(normalize-space(./ROFF))='sinopia parziale'">
				                    				<xsl:value-of
									select="concat($NS, 'FinalWork/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
				                    			</xsl:when>
				                    			<xsl:otherwise>
				                    				<xsl:value-of
									select="concat($NS, 'PreparatoryOrFinalWork/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
				                    			</xsl:otherwise>
				                    		</xsl:choose>
				                    	</xsl:attribute>
							</arco-cd:isSubjectOf>
						</rdf:Description>
					</xsl:if>
					<!-- inventory about preparatory or final work as an individual -->
					<xsl:if test="./ROFI">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
				            			<xsl:value-of
								select="concat($NS, 'Inventory/', $itemURI, '-preparatory-final-work-inventory-', arco-fn:urify(normalize-space(./ROFI)))" />
				            		</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				                          <xsl:value-of
									select="'https://w3id.org/arco/context-description/Inventory'" />
				                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Inventory ', normalize-space(./ROFI), ' of preparatory or final work of cultural property ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Inventory ', normalize-space(./ROFI), ' of preparatory or final work of cultural property ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Inventario ', normalize-space(./ROFI), ' dell''opera originale o finale del bene ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Inventario ', normalize-space(./ROFI), ' dell''opera originale o finale del bene ', $itemURI)" />
							</l0:name>
							<arco-cd:inventoryIdentifier>
								<xsl:value-of select="normalize-space(./ROFI)" />
							</arco-cd:inventoryIdentifier>
						</rdf:Description>
					</xsl:if>
					<!-- preparatory or final work title as an individual -->
					<xsl:if test="./ROFT">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            						<xsl:value-of
								select="concat($NS, 'Title/', $itemURI, '-preparatory-final-work-title-', arco-fn:urify(normalize-space(./ROFT)))" />
	            					</xsl:attribute>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./ROFT)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./ROFT)" />
							</l0:name>
							<arco-cd:hasTitleType>
								<xsl:attribute name="rdf:resource">
					            			<xsl:value-of
									select="'https://w3id.org/arco/context-description/Proper'" />
					            		</xsl:attribute>
							</arco-cd:hasTitleType>
						</rdf:Description>
					</xsl:if>
					<!-- dating as an individual -->
					<xsl:if test="./ROFD">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
				                        <xsl:value-of
								select="concat($NS, 'Dating/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)))" />
				                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
									select="'https://w3id.org/arco/context-description/Dating'" />
				                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Cronologia dell''opera originale o finale ', position(), ' del bene ', $itemURI)" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Dating of preparatory or final work ', position(), ' of cultural property ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Cronologia dell''opera originale o finale ', position(), ' del bene ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Dating of preparatory or final work ', position(), ' of cultural property ', $itemURI)" />
							</rdfs:label>
							<arco-cd:hasEvent>
								<xsl:attribute name="rdf:resource">
				                           <xsl:value-of
									select="concat($NS, 'Event/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)), '-creation')" />
				                        </xsl:attribute>
							</arco-cd:hasEvent>
							<!-- Source of dating -->
							<xsl:if
								test="./ROFM and not(lower-case(normalize-space(./ROFM))='nr' or lower-case(normalize-space(./ROFM))='n.r.' or lower-case(normalize-space(./ROFM))='nr (recupero pregresso)' or lower-case(normalize-space(./ROFM))='nr' or lower-case(normalize-space(./ROFM))='n.r.' or lower-case(normalize-space(./ROFM))='nr (recupero pregresso)')">
								<arco-cd:hasSource>
									<xsl:attribute name="rdf:resource">
				                              <xsl:value-of
										select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./ROFM)))" />
				                         </xsl:attribute>
								</arco-cd:hasSource>
							</xsl:if>
						</rdf:Description>
						<!-- Source of dating as individual -->
						<xsl:if
							test="./ROFM and not(lower-case(normalize-space(./ROFM))='nr' or lower-case(normalize-space(./ROFM))='n.r.' or lower-case(normalize-space(./ROFM))='nr (recupero pregresso)' or lower-case(normalize-space(./ROFM))='nr' or lower-case(normalize-space(./ROFM))='n.r.' or lower-case(normalize-space(./ROFM))='nr (recupero pregresso)')">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
				                             <xsl:value-of
									select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./ROFM)))" />
				                        </xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
				                                <xsl:value-of
										select="'https://w3id.org/arco/context-description/Source'" />
				                            </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./ROFM)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./ROFM)" />
								</l0:name>
							</rdf:Description>
						</xsl:if>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
				                        <xsl:value-of
								select="concat($NS, 'Event/', $itemURI, '-', arco-fn:urify(normalize-space(./ROFO)), '-creation')" />
				                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Event'" />
				                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Realizzazione dell''opera originale o finale ', position(), ' del bene ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Realizzazione dell''opera originale o finale ', position(), ' del bene ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Creation of preparatory or final work ', position(), ' of cultural property ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Creation of preparatory or final work ', position(), ' of cultural property ', $itemURI)" />
							</l0:name>
							<tiapit:atTime>
								<xsl:attribute name="rdf:resource">
				                                <xsl:value-of
									select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./ROFD)))" />
				                            </xsl:attribute>
							</tiapit:atTime>
						</rdf:Description>
						<!-- Time interval as an individual -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
				                            <xsl:value-of
								select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./ROFD)))" />
				                        </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				                                <xsl:value-of
									select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				                            </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./ROFD)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./ROFD)" />
							</l0:name>
							<tiapit:time>
								<xsl:value-of select="normalize-space(./ROFD)" />
							</tiapit:time>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="./ROFA">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
				            				<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ROFA)))" />
				            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				            					<xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
				            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./ROFA)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./ROFA)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- relation with copy (RO/COP) -->
			<xsl:if test="schede/*/RO/COP or schede/*/RO/CRF/CRFT='copia'">
				<xsl:for-each select="schede/*/RO/COP | schede/*/RO/CRF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:value-of
							select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-copy-', position())" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/RelatedWorkSituation'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e copia')" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e copia')" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and copy')" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and copy')" />
						</l0:name>
						<arco-cd:hasRelatedWork>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of
								select="concat($NS, 'Copy/', $itemURI, '-copy-', position())" />
								</xsl:attribute>
						</arco-cd:hasRelatedWork>
						<xsl:if test="../CRF/CRFS">
							<arco-core:note>
								<xsl:value-of select="normalize-space(../CRF/CRFS)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
					<!-- copy as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
										<xsl:value-of
							select="concat($NS, 'Copy/', $itemURI, '-copy-', position())" />
									</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
		                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/Copy'" />
		                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Copia ', position(), ' del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Copia ', position(), ' del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Copy ', position(), ' of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Copy ', position(), ' of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="./COPR">
							<arco-cd:hasReferenceCatalogue>
								<xsl:attribute name="rdf:resource">
											<xsl:value-of
									select="concat($NS, 'ReferenceCatalogue/', $itemURI, '-reference-catalogue-', position())" />
										</xsl:attribute>
							</arco-cd:hasReferenceCatalogue>
						</xsl:if>
						<xsl:if test="./COPA">
							<arco-cd:hasAuthor>
								<xsl:attribute name="rdf:resource">
			            					<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./COPA)))" />
			            				</xsl:attribute>
							</arco-cd:hasAuthor>
						</xsl:if>
						<xsl:if test="../CRF/CRFN or ../CRF/CRFB">
							<arco-cd:hasAuthor>
								<xsl:attribute name="rdf:resource">
			            				<xsl:choose>
			            					<xsl:when test="../CRF/CRFN">
			            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../CRF/CRFN)))" />
			            					</xsl:when>
			            					<xsl:otherwise>
			            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../CRF/CRFB)))" />
			            					</xsl:otherwise>
			            				</xsl:choose>
			            				</xsl:attribute>
							</arco-cd:hasAuthor>
						</xsl:if>
						<xsl:if test="../CRF/CRFC">
							<arco-cd:relatedWorkLocation>
								<xsl:value-of select="normalize-space(../CRF/CRFC)" />
							</arco-cd:relatedWorkLocation>
						</xsl:if>
					</rdf:Description>
					<!-- reference catalogue as an individual -->
					<xsl:if test="./COPR">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
											<xsl:value-of
								select="concat($NS, 'ReferenceCatalogue/', $itemURI, '-reference-catalogue-', position())" />
										</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				            					<xsl:value-of
									select="'https://w3id.org/arco/context-description/ReferenceCatalogue'" />
				            				</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Repertorio della copia ', position(), ' del bene culturale ', $itemURI, ' : ', normalize-space(./COPR))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Repertorio della copia ', position(), ' del bene culturale ', $itemURI, ' : ', normalize-space(./COPR))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Reference catalogue of copy ', position(), ' of cultural property ', $itemURI, ' : ', normalize-space(./COPR))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Reference catalogue of copy ', position(), ' of cultural property ', $itemURI, ' : ', normalize-space(./COPR))" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- author of copy (RO/COP/COPA) as an individual -->
					<xsl:if test="./COPA">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
				            				<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./COPA)))" />
				            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				            					<xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
				            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./COPA)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./COPA)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- author of copy (RO/CRF/CRFN or RO/CRF/CRFB) as an individual -->
					<xsl:if test="../CRF/CRFN or ../CRF/CRFB">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
				            				<xsl:choose>
			            					<xsl:when test="../CRF/CRFN">
			            						<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../CRF/CRFN)))" />
			            					</xsl:when>
			            					<xsl:otherwise>
			            						<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../CRF/CRFB)))" />
			            					</xsl:otherwise>
			            				</xsl:choose>
				            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				                                <xsl:choose>
				                                	<xsl:when
									test="lower-case(normalize-space(../CRF/CRFP))='p'">
                                        				<xsl:value-of
									select="'https://w3id.org/italia/onto/CPV/Person'" />
                                    				</xsl:when>
				                                    <xsl:when
									test="lower-case(normalize-space(../CRF/CRFP))='e'">
				                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/COV/Organization'" />
				                                    </xsl:when>
				                                    <xsl:when test="../CRF/CRFN">
				                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/CPV/Person'" />
				                                    </xsl:when>
				                                    <xsl:when test="../CRF/CRFB">
				                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/COV/Organization'" />
				                                    </xsl:when>
				                                    <xsl:otherwise>
				                                    	<xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
				                                    </xsl:otherwise>
				                                </xsl:choose>
                            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:choose>
									<xsl:when test="../CRF/CRFN">
										<xsl:value-of select="normalize-space(../CRF/CRFN)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(../CRF/CRFB)" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<l0:name>
								<xsl:choose>
									<xsl:when test="../CRF/CRFN">
										<xsl:value-of select="normalize-space(../CRF/CRFN)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(../CRF/CRFB)" />
									</xsl:otherwise>
								</xsl:choose>
							</l0:name>
							<xsl:if test="./CRFH">
								<arco-cd:agentLocalIdentifier>
									<xsl:value-of select="../CRF/CRFH" />
								</arco-cd:agentLocalIdentifier>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- relation with a generic derivated work (if RO/CRF/CRFT != 'replica' 
				or 'contraffazione' or 'controtipo' or 'reimpiego' or 'copia') -->
			<xsl:if
				test="schede/*/RO/CRF and not(schede/*/RO/CRF/CRFT='copia' or schede/*/RO/CRF/CRFT='contraffazione' or schede/*/RO/CRF/CRFT='controtipo' or schede/*/RO/CRF/CRFT='replica' or schede/*/RO/CRF/CRFT='reimpiego')">
				<xsl:for-each select="schede/*/RO/CRF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:value-of
							select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-derivated-work-', position())" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/RelatedWorkSituation'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e opera derivata')" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e opera derivata')" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and derivated work')" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and derivated work')" />
						</l0:name>
						<arco-cd:hasRelatedWork>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of
								select="concat($NS, 'DerivatedWork/', $itemURI, '-derivated-work-', position())" />
								</xsl:attribute>
						</arco-cd:hasRelatedWork>
						<xsl:if test="./CRFS">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./CRFS)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
					<!-- derivated work as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
										<xsl:value-of
							select="concat($NS, 'DerivatedWork/', $itemURI, '-derivated-work-', position())" />
									</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
		                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/DerivatedWork'" />
		                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Opera derivata ', position(), ' del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Opera derivata ', position(), ' del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Derivated work ', position(), ' of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Derivated work ', position(), ' of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="./CRFT">
							<arco-cd:hasDerivatedWorkType>
								<xsl:attribute name="rdf:resource">
										<xsl:value-of
									select="concat($NS, 'DerivatedWorkType/', arco-fn:urify(normalize-space(./CRFT)))" />
									</xsl:attribute>
							</arco-cd:hasDerivatedWorkType>
						</xsl:if>
						<xsl:if test="./CRFN or ./CRFB">
							<arco-cd:hasAuthor>
								<xsl:attribute name="rdf:resource">
			            				<xsl:choose>
			            					<xsl:when test="./CRFN">
			            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFN)))" />
			            					</xsl:when>
			            					<xsl:otherwise>
			            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFB)))" />
			            					</xsl:otherwise>
			            				</xsl:choose>
			            				</xsl:attribute>
							</arco-cd:hasAuthor>
						</xsl:if>
						<xsl:if test="./CRFC">
							<arco-cd:relatedWorkLocation>
								<xsl:value-of select="normalize-space(./CRFC)" />
							</arco-cd:relatedWorkLocation>
						</xsl:if>
					</rdf:Description>
					<!-- author of derivated work as an individual -->
					<xsl:if test="./CRFN or ./CRFB">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
				            				<xsl:choose>
			            					<xsl:when test="./CRFN">
			            						<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFN)))" />
			            					</xsl:when>
			            					<xsl:otherwise>
			            						<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFB)))" />
			            					</xsl:otherwise>
			            				</xsl:choose>
				            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				                                <xsl:choose>
				                                	<xsl:when
									test="lower-case(normalize-space(./CRFP))='p'">
                                        				<xsl:value-of
									select="'https://w3id.org/italia/onto/CPV/Person'" />
                                    				</xsl:when>
				                                    <xsl:when
									test="lower-case(normalize-space(./CRFP))='e'">
				                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/COV/Organization'" />
				                                    </xsl:when>
				                                    <xsl:when test="./CRFN">
				                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/CPV/Person'" />
				                                    </xsl:when>
				                                    <xsl:when test="./CRFB">
				                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/COV/Organization'" />
				                                    </xsl:when>
				                                    <xsl:otherwise>
				                                    	<xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
				                                    </xsl:otherwise>
				                                </xsl:choose>
                            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:choose>
									<xsl:when test="./CRFN">
										<xsl:value-of select="normalize-space(./CRFN)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./CRFB)" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<l0:name>
								<xsl:choose>
									<xsl:when test="./CRFN">
										<xsl:value-of select="normalize-space(./CRFN)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./CRFB)" />
									</xsl:otherwise>
								</xsl:choose>
							</l0:name>
							<xsl:if test="./CRFH">
								<arco-cd:agentLocalIdentifier>
									<xsl:value-of select="./CRFH" />
								</arco-cd:agentLocalIdentifier>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
					<!-- derivated work type as an individual -->
					<xsl:if test="./CRFT">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
					            				<xsl:value-of
								select="concat($NS, 'DerivatedWorkType/', arco-fn:urify(normalize-space(./CRFT)))" />
					            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					            					<xsl:value-of
									select="'https://w3id.org/arco/context-description/DerivatedWorkType'" />
					            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./CRFT)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./CRFT)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- relation with a particular type of derivated work: forgery -->
			<xsl:if test="schede/*/RO/CRF/CFRT='contraffazione'">
				<xsl:for-each select="schede/*/RO/CRF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:value-of
							select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-forgery-', position())" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/RelatedWorkSituation'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e contraffazione')" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e contraffazione')" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and forgery')" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and forgery')" />
						</l0:name>
						<arco-cd:hasRelatedWork>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of
								select="concat($NS, 'Forgery/', $itemURI, '-forgery-', position())" />
								</xsl:attribute>
						</arco-cd:hasRelatedWork>
						<xsl:if test="./CRFS">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./CRFS)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
					<!-- forgery as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:value-of
							select="concat($NS, 'Forgery/', $itemURI, '-forgery-', position())" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/Forgery'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Contraffazione ', position(), ' del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Contraffazione ', position(), ' del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Forgery ', position(), ' of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Forgery ', position(), ' of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="./CRFN or ./CRFB">
							<arco-cd:hasAuthor>
								<xsl:attribute name="rdf:resource">
		            				<xsl:choose>
		            					<xsl:when test="./CRFN">
		            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFN)))" />
		            					</xsl:when>
		            					<xsl:otherwise>
		            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFB)))" />
		            					</xsl:otherwise>
		            				</xsl:choose>
		            				</xsl:attribute>
							</arco-cd:hasAuthor>
						</xsl:if>
						<xsl:if test="./CRFC">
							<arco-cd:relatedWorkLocation>
								<xsl:value-of select="normalize-space(./CRFC)" />
							</arco-cd:relatedWorkLocation>
						</xsl:if>
					</rdf:Description>
					<!-- author of forgery as an individual -->
					<xsl:if test="./CRFN or ./CRFB">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
			            				<xsl:choose>
		            					<xsl:when test="./CRFN">
		            						<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFN)))" />
		            					</xsl:when>
		            					<xsl:otherwise>
		            						<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFB)))" />
		            					</xsl:otherwise>
		            				</xsl:choose>
			            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
			                                <xsl:choose>
			                                	<xsl:when
									test="lower-case(normalize-space(./CRFP))='p'">
                                       				<xsl:value-of
									select="'https://w3id.org/italia/onto/CPV/Person'" />
                                   				</xsl:when>
			                                    <xsl:when
									test="lower-case(normalize-space(./CRFP))='e'">
			                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/COV/Organization'" />
			                                    </xsl:when>
			                                    <xsl:when test="./CRFN">
			                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/CPV/Person'" />
			                                    </xsl:when>
			                                    <xsl:when test="./CRFB">
			                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/COV/Organization'" />
			                                    </xsl:when>
			                                    <xsl:otherwise>
			                                    	<xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
			                                    </xsl:otherwise>
			                                </xsl:choose>
                           				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:choose>
									<xsl:when test="./CRFN">
										<xsl:value-of select="normalize-space(./CRFN)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./CRFB)" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<l0:name>
								<xsl:choose>
									<xsl:when test="./CRFN">
										<xsl:value-of select="normalize-space(./CRFN)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./CRFB)" />
									</xsl:otherwise>
								</xsl:choose>
							</l0:name>
							<xsl:if test="./CRFH">
								<arco-cd:agentLocalIdentifier>
									<xsl:value-of select="./CRFH" />
								</arco-cd:agentLocalIdentifier>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- relation with a particular type of derivated work: facsimile -->
			<xsl:if test="schede/*/RO/CRF/CFRT='controtipo'">
				<xsl:for-each select="schede/*/RO/CRF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:value-of
							select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-facsimile-', position())" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/RelatedWorkSituation'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e controtipo')" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e controtipo')" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and facsimile')" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and facsimile')" />
						</l0:name>
						<arco-cd:hasRelatedWork>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of
								select="concat($NS, 'Facsimile/', $itemURI, '-facsimile-', position())" />
								</xsl:attribute>
						</arco-cd:hasRelatedWork>
						<xsl:if test="./CRFS">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./CRFS)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
					<!-- facsimile as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:value-of
							select="concat($NS, 'Facsimile/', $itemURI, '-facsimile-', position())" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/Facsimile'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Controtipo ', position(), ' del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Controtipo ', position(), ' del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Facsimile ', position(), ' of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Facsimile ', position(), ' of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="./CRFN or ./CRFB">
							<arco-cd:hasAuthor>
								<xsl:attribute name="rdf:resource">
		            				<xsl:choose>
		            					<xsl:when test="./CRFN">
		            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFN)))" />
		            					</xsl:when>
		            					<xsl:otherwise>
		            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFB)))" />
		            					</xsl:otherwise>
		            				</xsl:choose>
		            				</xsl:attribute>
							</arco-cd:hasAuthor>
						</xsl:if>
						<xsl:if test="./CRFC">
							<arco-cd:relatedWorkLocation>
								<xsl:value-of select="normalize-space(./CRFC)" />
							</arco-cd:relatedWorkLocation>
						</xsl:if>
					</rdf:Description>
					<!-- author of facsimile as an individual -->
					<xsl:if test="./CRFN or ./CRFB">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
			            				<xsl:choose>
		            					<xsl:when test="./CRFN">
		            						<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFN)))" />
		            					</xsl:when>
		            					<xsl:otherwise>
		            						<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFB)))" />
		            					</xsl:otherwise>
		            				</xsl:choose>
			            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
			                                <xsl:choose>
			                                	<xsl:when
									test="lower-case(normalize-space(./CRFP))='p'">
                                       				<xsl:value-of
									select="'https://w3id.org/italia/onto/CPV/Person'" />
                                   				</xsl:when>
			                                    <xsl:when
									test="lower-case(normalize-space(./CRFP))='e'">
			                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/COV/Organization'" />
			                                    </xsl:when>
			                                    <xsl:when test="./CRFN">
			                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/CPV/Person'" />
			                                    </xsl:when>
			                                    <xsl:when test="./CRFB">
			                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/COV/Organization'" />
			                                    </xsl:when>
			                                    <xsl:otherwise>
			                                    	<xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
			                                    </xsl:otherwise>
			                                </xsl:choose>
                           				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:choose>
									<xsl:when test="./CRFN">
										<xsl:value-of select="normalize-space(./CRFN)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./CRFB)" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<l0:name>
								<xsl:choose>
									<xsl:when test="./CRFN">
										<xsl:value-of select="normalize-space(./CRFN)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./CRFB)" />
									</xsl:otherwise>
								</xsl:choose>
							</l0:name>
							<xsl:if test="./CRFH">
								<arco-cd:agentLocalIdentifier>
									<xsl:value-of select="./CRFH" />
								</arco-cd:agentLocalIdentifier>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- relation with a particular type of derivated work: same author copy -->
			<xsl:if test="schede/*/RO/CRF/CFRT='replica'">
				<xsl:for-each select="schede/*/RO/CRF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:value-of
							select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-same-author-copy-', position())" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/RelatedWorkSituation'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e replica')" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e replica')" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and copy by the same author')" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and copy by the same author')" />
						</l0:name>
						<arco-cd:hasRelatedWork>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of
								select="concat($NS, 'SameAuthorCopy/', $itemURI, '-same-author-copy-', position())" />
								</xsl:attribute>
						</arco-cd:hasRelatedWork>
						<xsl:if test="./CRFS">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./CRFS)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
					<!-- same author copy as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:value-of
							select="concat($NS, 'SameAuthorCopy/', $itemURI, '-same-author-copy-', position())" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/SameAuthorCopy'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Replica ', position(), ' del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Replica ', position(), ' del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Copy ', position(), ' by the same author of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Copy ', position(), ' by the same author of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="./CRFN or ./CRFB">
							<arco-cd:hasAuthor>
								<xsl:attribute name="rdf:resource">
		            				<xsl:choose>
		            					<xsl:when test="./CRFN">
		            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFN)))" />
		            					</xsl:when>
		            					<xsl:otherwise>
		            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFB)))" />
		            					</xsl:otherwise>
		            				</xsl:choose>
		            				</xsl:attribute>
							</arco-cd:hasAuthor>
						</xsl:if>
						<xsl:if test="./CRFC">
							<arco-cd:relatedWorkLocation>
								<xsl:value-of select="normalize-space(./CRFC)" />
							</arco-cd:relatedWorkLocation>
						</xsl:if>
					</rdf:Description>
					<!-- author of same author copy as an individual -->
					<xsl:if test="./CRFN or ./CRFB">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
			            				<xsl:choose>
		            					<xsl:when test="./CRFN">
		            						<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFN)))" />
		            					</xsl:when>
		            					<xsl:otherwise>
		            						<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CRFB)))" />
		            					</xsl:otherwise>
		            				</xsl:choose>
			            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
			                                <xsl:choose>
			                                	<xsl:when
									test="lower-case(normalize-space(./CRFP))='p'">
                                       				<xsl:value-of
									select="'https://w3id.org/italia/onto/CPV/Person'" />
                                   				</xsl:when>
			                                    <xsl:when
									test="lower-case(normalize-space(./CRFP))='e'">
			                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/COV/Organization'" />
			                                    </xsl:when>
			                                    <xsl:when test="./CRFN">
			                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/CPV/Person'" />
			                                    </xsl:when>
			                                    <xsl:when test="./CRFB">
			                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/COV/Organization'" />
			                                    </xsl:when>
			                                    <xsl:otherwise>
			                                    	<xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
			                                    </xsl:otherwise>
			                                </xsl:choose>
                           				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:choose>
									<xsl:when test="./CRFN">
										<xsl:value-of select="normalize-space(./CRFN)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./CRFB)" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<l0:name>
								<xsl:choose>
									<xsl:when test="./CRFN">
										<xsl:value-of select="normalize-space(./CRFN)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./CRFB)" />
									</xsl:otherwise>
								</xsl:choose>
							</l0:name>
							<xsl:if test="./CRFH">
								<arco-cd:agentLocalIdentifier>
									<xsl:value-of select="./CRFH" />
								</arco-cd:agentLocalIdentifier>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- relation with a particular type of derivated work: reuse -->
			<xsl:if
				test="schede/*/RO/REI or schede/*/RO/RIU or schede/*/RO/CRF/CFRT='reimpiego'">
				<xsl:for-each select="schede/*/RO/REI | schede/*/RO/RIU | schede/*/RO/CRF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:value-of
							select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-reuse-', position())" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/RelatedWorkSituation'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e riuso')" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra il bene culturale ', $itemURI, ' e riuso')" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and reuse')" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and reuse')" />
						</l0:name>
						<arco-cd:hasRelatedWork>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of
								select="concat($NS, 'Reuse/', $itemURI, '-reuse-', position())" />
								</xsl:attribute>
						</arco-cd:hasRelatedWork>
						<xsl:if test="../CRF/CRFS">
							<arco-core:note>
								<xsl:value-of select="normalize-space(../CRF/CRFS)" />
							</arco-core:note>
						</xsl:if>
						<xsl:if test="../REIS">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./REIS)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
					<!-- reuse as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:value-of
							select="concat($NS, 'Reuse/', $itemURI, '-reuse-', position())" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/Reuse'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Riuso ', position(), ' del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Riuso ', position(), ' del bene culturale ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Reuse ', position(), ' of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Reuse ', position(), ' of cultural property ', $itemURI)" />
						</l0:name>
						<xsl:if test="../CRF/CRFN or ../CRF/CRFB">
							<arco-cd:hasAuthor>
								<xsl:attribute name="rdf:resource">
		            				<xsl:choose>
		            					<xsl:when test="./CRFN">
		            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../CRF/CRFN)))" />
		            					</xsl:when>
		            					<xsl:otherwise>
		            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../CRF/CRFB)))" />
		            					</xsl:otherwise>
		            				</xsl:choose>
		            				</xsl:attribute>
							</arco-cd:hasAuthor>
						</xsl:if>
						<xsl:if test="../CRF/CRFC">
							<arco-cd:relatedWorkLocation>
								<xsl:value-of select="normalize-space(../CRF/CRFC)" />
							</arco-cd:relatedWorkLocation>
						</xsl:if>
						<xsl:if test="./REID or ../RIU/RIUD">
							<tiapit:date>
								<xsl:choose>
									<xsl:when test="./REID">
										<xsl:value-of select="normalize-space(./REID)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(../RIU/RIUD)" />
									</xsl:otherwise>
								</xsl:choose>
							</tiapit:date>
						</xsl:if>
						<xsl:if test="./REIT or ../RIU/RIUT">
							<arco-cd:hasDerivatedWorkType>
								<xsl:attribute name="rdf:resource">
									<xsl:choose>
										<xsl:when test="./REIT">
											<xsl:value-of
									select="concat($NS, 'DerivatedWorkType/', arco-fn:urify(normalize-space(./REIT)))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of
									select="concat($NS, 'DerivatedWorkType/', arco-fn:urify(normalize-space(../RIU/RIUT)))" />
										</xsl:otherwise>
									</xsl:choose>
									</xsl:attribute>
							</arco-cd:hasDerivatedWorkType>
						</xsl:if>
					</rdf:Description>
					<!-- derivated work type as an individual -->
					<xsl:if test="./REIT or ../RIU/RIUT">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
					            				<xsl:choose>
													<xsl:when test="./REIT">
														<xsl:value-of
								select="concat($NS, 'DerivatedWorkType/', arco-fn:urify(normalize-space(./REIT)))" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of
								select="concat($NS, 'DerivatedWorkType/', arco-fn:urify(normalize-space(../RIU/RIUT)))" />
													</xsl:otherwise>
												</xsl:choose>
					            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					            					<xsl:value-of
									select="'https://w3id.org/arco/context-description/DerivatedWorkType'" />
					            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:choose>
									<xsl:when test="./REIT">
										<xsl:value-of select="normalize-space(./REIT)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(../RIU/RIUD)" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<l0:name>
								<xsl:choose>
									<xsl:when test="./REIT">
										<xsl:value-of select="normalize-space(./REIT)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(../RIU/RIUD)" />
									</xsl:otherwise>
								</xsl:choose>
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- author of reuse as an individual -->
					<xsl:if test="../CRF/CRFN or ../CRF/CRFB">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
			            				<xsl:choose>
		            					<xsl:when test="../CRF/CRFN">
		            						<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../CRF/CRFN)))" />
		            					</xsl:when>
		            					<xsl:otherwise>
		            						<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../CRF/CRFB)))" />
		            					</xsl:otherwise>
		            				</xsl:choose>
			            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
			                                <xsl:choose>
			                                	<xsl:when
									test="lower-case(normalize-space(../CRF/CRFP))='p'">
                                       				<xsl:value-of
									select="'https://w3id.org/italia/onto/CPV/Person'" />
                                   				</xsl:when>
			                                    <xsl:when
									test="lower-case(normalize-space(../CRF/CRFP))='e'">
			                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/COV/Organization'" />
			                                    </xsl:when>
			                                    <xsl:when test="../CRF/CRFN">
			                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/CPV/Person'" />
			                                    </xsl:when>
			                                    <xsl:when test="../CRF/CRFB">
			                                        <xsl:value-of
									select="'https://w3id.org/italia/onto/COV/Organization'" />
			                                    </xsl:when>
			                                    <xsl:otherwise>
			                                    	<xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
			                                    </xsl:otherwise>
			                                </xsl:choose>
                           				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:choose>
									<xsl:when test="../CRF/CRFN">
										<xsl:value-of select="normalize-space(../CRF/CRFN)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(../CRF/CRFB)" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<l0:name>
								<xsl:choose>
									<xsl:when test="../CRF/CRFN">
										<xsl:value-of select="normalize-space(../CRF/CRFN)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(../CRF/CRFB)" />
									</xsl:otherwise>
								</xsl:choose>
							</l0:name>
							<xsl:if test="../CRF/CRFH">
								<arco-cd:agentLocalIdentifier>
									<xsl:value-of select="../CRF/CRFH" />
								</arco-cd:agentLocalIdentifier>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- relation with a particular type of derivated work: print in publication (S) -->
				<xsl:if test="schede/*/RO/ADL">
					<xsl:for-each select="schede/*/RO/ADL">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
			                            <xsl:value-of
									select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-print-in-publication-', position())" />
			                        </xsl:attribute>
			                 <rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/RelatedWorkSituation'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra la stampa ', $itemURI, ' e pubblicazione contenente la stampa')" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Rapporto ', position(), ' tra la stampa ', $itemURI, ' e pubblicazione contenente la stampa')" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the print ', $itemURI, ' and publication with print')" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the print ', $itemURI, ' and publication with print')" />
						</l0:name>
						<arco-cd:hasRelatedWork>
							<xsl:attribute name="rdf:resource">
									<xsl:value-of
								select="concat($NS, 'PrintInPublication/', $itemURI, '-print-in-publication-', position())" />
								</xsl:attribute>
						</arco-cd:hasRelatedWork>
					</rdf:Description>
					<!-- print in publication as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:value-of
							select="concat($NS, 'PrintInPublication/', $itemURI, '-print-in-publication-', position())" />
							</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                          		<xsl:value-of
								select="'https://w3id.org/arco/context-description/PrintInPublication'" />
	                       		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Pubblicazione ', position(), ' contenente la stampa ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Pubblicazione ', position(), ' contenente la stampa ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Publication ', position(), ' with print ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Publication ', position(), ' with print ', $itemURI)" />
						</l0:name>
						<xsl:if test="./ADLA">
							<arco-cd:hasAuthor>
								<xsl:attribute name="rdf:resource">
		            						<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ADLA)))" />
								</xsl:attribute>
							</arco-cd:hasAuthor>
						</xsl:if>
						<xsl:if test="./ADLL">
							<arco-cd:hasDerivatedWorkType>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="concat($NS, 'DerivatedWorkType/', arco-fn:urify(normalize-space(./ADLL)))" />
									</xsl:attribute>
							</arco-cd:hasDerivatedWorkType>
						</xsl:if>
						<xsl:if test="./ADLT">
							<arco-cd:hasTitle>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="concat($NS, 'Title/', $itemURI, '-publication-', arco-fn:urify(normalize-space(./ADLT)))" />
									</xsl:attribute>
							</arco-cd:hasTitle>
						</xsl:if>
						<xsl:if test="./ADLE">
							<arco-cd:hasEdition>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="concat($NS, 'Edition/', $itemURI, '-edition-', arco-fn:urify(normalize-space(./ADLE)))" />
									</xsl:attribute>
							</arco-cd:hasEdition>
						</xsl:if>
						<xsl:if test="./ADLP or ./ADLN">
							<arco-cd:hasReproduction>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="concat($NS, 'Reproduction/', $itemURI, '-reproduction')" />
									</xsl:attribute>
							</arco-cd:hasReproduction>
						</xsl:if>
						<xsl:if test="./ADLS">
							<arco-cd:hasReproduction>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="concat($NS, 'NoLongerInPublication/', $itemURI, '-reproduction')" />
									</xsl:attribute>
							</arco-cd:hasReproduction>
						</xsl:if>
					</rdf:Description>
					<!-- derivated work type as an individual -->
					<xsl:if test="./ADLA">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
										<xsl:value-of
								select="concat($NS, 'DerivatedWorkType/', arco-fn:urify(normalize-space(./ADLL)))" />
					         </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					            					<xsl:value-of
									select="'https://w3id.org/arco/context-description/DerivatedWorkType'" />
					            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./ADLL)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./ADLL)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- print in publication title as an individual -->
					<xsl:if test="./ADLT">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
										<xsl:value-of
								select="concat($NS, 'Title/', $itemURI, '-publication-', arco-fn:urify(normalize-space(./ADLT)))" />
					         </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					            					<xsl:value-of
									select="'https://w3id.org/arco/context-description/Title'" />
					            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./ADLT)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./ADLT)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- print in publication edition as an individual -->
					<xsl:if test="./ADLE">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
										<xsl:value-of
								select="concat($NS, 'Edition/', $itemURI, '-edition-', arco-fn:urify(normalize-space(./ADLE)))" />
					         </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					            					<xsl:value-of
									select="'https://w3id.org/arco/context-description/Edition'" />
					            				</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Edizione della pubblicazione contenente la stampa ', $itemURI, ' : ', normalize-space(./ADLE))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Edizione della pubblicazione contenente la stampa ', $itemURI, ' : ', normalize-space(./ADLE))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Edition of publication with print ', $itemURI, ' : ', normalize-space(./ADLE))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Edition of publication with print ', $itemURI, ' : ', normalize-space(./ADLE))" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- print in publication reproduction as an individual -->
					<xsl:if test="./ADLP or ./ADLN">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
										<xsl:value-of
								select="concat($NS, 'Reproduction/', $itemURI, '-reproduction')" />
					         </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					            					<xsl:value-of
									select="'https://w3id.org/arco/context-description/Reproduction'" />
					            				</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Riproduzione in pubblicazione della stampa ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Riproduzione in pubblicazione della stampa ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Reproduction in publication of print ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Reproduction in publication of print ', $itemURI)" />
							</l0:name>
							<arco-cd:hasReproductionPosition>
								<xsl:attribute name="rdf:resource">
								<xsl:choose>
									<xsl:when test="./ADLP">
										<xsl:value-of select="concat($NS, 'ReproductionPosition/', $itemURI, '-', arco-fn:urify(normalize-space(./ADLP)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'ReproductionPosition/', $itemURI, '-reproduction-position')" />
									</xsl:otherwise>
								</xsl:choose>
								</xsl:attribute>
							</arco-cd:hasReproductionPosition>
						</rdf:Description>
						<!-- reproduction position as an individual -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:choose>
									<xsl:when test="./ADLP">
										<xsl:value-of select="concat($NS, 'ReproductionPosition/', $itemURI, '-', arco-fn:urify(normalize-space(./ADLP)))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat($NS, 'ReproductionPosition/', $itemURI, '-reproduction-position')" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="'https://w3id.org/arco/context-description/ReproductionPosition'" />
								</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:choose>
									<xsl:when test="./ADLP">
										<xsl:value-of select="concat('Posizione della riproduzione della stampa ', $itemURI, ' nella pubblicazione: ', normalize-space(./ADLP))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat('Posizione della riproduzione della stampa ', $itemURI, ' nella pubblicazione')" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:choose>
									<xsl:when test="./ADLP">
										<xsl:value-of select="normalize-space(./ADLP)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat('Posizione della riproduzione della stampa ', $itemURI, ' nella pubblicazione: ', normalize-space(./ADLP))" />
									</xsl:otherwise>
								</xsl:choose>
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:choose>
									<xsl:when test="./ADLP">
										<xsl:value-of select="normalize-space(./ADLP)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat('Print ', $itemURI, ' reproduction position in publication: ', normalize-space())" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:choose>
									<xsl:when test="./ADLP">
										<xsl:value-of select="concat('Print ', $itemURI, ' reproduction position in publication: ', normalize-space(./ADLP))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat('Print ', $itemURI, ' reproduction position in publication')" />
									</xsl:otherwise>
								</xsl:choose>
							</l0:name>
							<xsl:if test="./ADLN">
								<arco-cd:pageOrTableNumber>
									<xsl:value-of select="./ADLN" />
								</arco-cd:pageOrTableNumber>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
					<!-- no longer in publication as an individual -->
					<xsl:if test="./ADLS">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
										<xsl:value-of
								select="concat($NS, 'NoLongerInPublication/', $itemURI, '-reproduction')" />
					         </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					            					<xsl:value-of
									select="'https://w3id.org/arco/context-description/NoLongerInPublication'" />
					            				</xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="concat('Riproduzione in pubblicazione della stampa ', $itemURI, ' non più presente in pubblicazione')" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="concat('Riproduzione in pubblicazione della stampa ', $itemURI, ' non più presente in pubblicatione')" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="concat('Reproduction in publication of print ', $itemURI, ' no longer in publication')" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="concat('Reproduction in publication of print ', $itemURI, ' no longer in publication')" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- author of print in publication as an individual -->
					<xsl:if test="./ADLA">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		            				<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ADLA)))" />
			            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
			                            <xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
                           				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./ADLA)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./ADLA)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					</xsl:for-each>
				</xsl:if>
			<!-- Number of components as an individual -->
			<xsl:if
				test="schede/*/OG/QNT/QNTN or schede/*/OG/QNT/QNTI or schede/*/OG/QNT/QNTS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'NumberOfComponents/', $itemURI, '-quantity')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                          <xsl:value-of
							select="'https://w3id.org/arco/core/NumberOfComponents'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:if test="schede/*/OG/QNT/QNTN">
							<xsl:value-of
								select="concat('Quantità degli esemplari del bene ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTN))" />
						</xsl:if>
						<xsl:if test="schede/*/OG/QNT/QNTI">
							<xsl:value-of
								select="concat('Quantità degli elementi del bene ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTI))" />
						</xsl:if>
						<xsl:if test="schede/*/OG/QNT/QNTS">
							<xsl:value-of
								select="concat('Quantità non rilevata: ', normalize-space(schede/*/OG/QNT/QNTS))" />
						</xsl:if>
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:if test="schede/*/OG/QNT/QNTN">
							<xsl:value-of
								select="concat('Quantità degli esemplari del bene ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTN))" />
						</xsl:if>
						<xsl:if test="schede/*/OG/QNT/QNTI">
							<xsl:value-of
								select="concat('Quantità degli elementi del bene ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTI))" />
						</xsl:if>
						<xsl:if test="schede/*/OG/QNT/QNTS">
							<xsl:value-of
								select="concat('Quantità non rilevata: ', normalize-space(schede/*/OG/QNT/QNTS))" />
						</xsl:if>
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:if test="schede/*/OG/QNT/QNTN">
							<xsl:value-of
								select="concat('Number of components of cultural property ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTN))" />
						</xsl:if>
						<xsl:if test="schede/*/OG/QNT/QNTI">
							<xsl:value-of
								select="concat('Number of components of cultural property ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTI))" />
						</xsl:if>
						<xsl:if test="schede/*/OG/QNT/QNTS">
							<xsl:value-of
								select="concat('Undetected quantity: ', normalize-space(schede/*/OG/QNT/QNTS))" />
						</xsl:if>
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:if test="schede/*/OG/QNT/QNTN">
							<xsl:value-of
								select="concat('Number of components of cultural property ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTN))" />
						</xsl:if>
						<xsl:if test="schede/*/OG/QNT/QNTI">
							<xsl:value-of
								select="concat('Number of components of cultural property ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTI))" />
						</xsl:if>
						<xsl:if test="schede/*/OG/QNT/QNTS">
							<xsl:value-of
								select="concat('Undetected quantity: ', normalize-space(schede/*/OG/QNT/QNTS))" />
						</xsl:if>
					</l0:name>
					<arco-core:isNumberOfComponentsOf>
						<xsl:attribute name="rdf:resource">
                    		<xsl:value-of
							select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                    	</xsl:attribute>
					</arco-core:isNumberOfComponentsOf>
					<arco-core:numberOfComponents>
						<xsl:if test="schede/*/OG/QNT/QNTN">
							<xsl:value-of select="normalize-space(schede/*/OG/QNT/QNTN)" />
						</xsl:if>
						<xsl:if test="schede/*/OG/QNT/QNTI">
							<xsl:value-of select="normalize-space(schede/*/OG/QNT/QNTI)" />
						</xsl:if>
						<xsl:if test="schede/*/OG/QNT/QNTS">
							<xsl:value-of select="normalize-space(schede/*/OG/QNT/QNTS)" />
						</xsl:if>
					</arco-core:numberOfComponents>
					<xsl:if test="schede/*/OG/QNT/QNTE">
						<arco-core:note>
							<xsl:value-of select="normalize-space(schede/*/OG/QNT/QNTE)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
			<!-- ERROR, this element has already been created in another section of 
				the sheet <xsl:for-each select="schede/*/OG/OGD"> <rdf:Description> <xsl:attribute 
				name="rdf:about"> <xsl:value-of select="concat('https://w3id.org/arco/resource/DesignationInTime/', 
				arco-fn:urify(normalize-space(./OGDN)))" /> </xsl:attribute> <rdfs:label> 
				<xsl:value-of select="normalize-space(./OGDN)" /> </rdfs:label> <l0:name> 
				<xsl:value-of select="normalize-space(./ODGN)" /> </l0:name> </rdf:Description> 
				</xsl:for-each> -->
			<xsl:for-each select="schede/*/AU/EDT">
				<xsl:if test="./EDTN">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
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
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/Edition'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:choose>
								<xsl:when test="./EDTE and ./EDTL">
									<xsl:value-of
										select="concat('Edizione ', normalize-space(./EDTE), '-', normalize-space(./EDTL), ' del bene ', $itemURI)" />
								</xsl:when>
								<xsl:when test="./EDTE">
									<xsl:value-of
										select="concat('Edizione ', normalize-space(./EDTE), ' del bene ', $itemURI)" />
								</xsl:when>
								<xsl:when test="./EDTL">
									<xsl:value-of
										select="concat('Edizione ', normalize-space(./EDTL), ' del bene ', $itemURI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Edizione ', position(), ' del bene ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:choose>
								<xsl:when test="./EDTE and ./EDTL">
									<xsl:value-of
										select="concat('Edizione ', normalize-space(./EDTE), '-', normalize-space(./EDTL), ' del bene ', $itemURI)" />
								</xsl:when>
								<xsl:when test="./EDTE">
									<xsl:value-of
										select="concat('Edizione ', normalize-space(./EDTE), ' del bene ', $itemURI)" />
								</xsl:when>
								<xsl:when test="./EDTL">
									<xsl:value-of
										select="concat('Edizione ', normalize-space(./EDTL), ' del bene ', $itemURI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Edizione ', position(), ' del bene ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:choose>
								<xsl:when test="./EDTE and ./EDTL">
									<xsl:value-of
										select="concat('Edition ', normalize-space(./EDTE), '-', normalize-space(./EDTL), ' of cultural property ', $itemURI)" />
								</xsl:when>
								<xsl:when test="./EDTE">
									<xsl:value-of
										select="concat('Edition ', normalize-space(./EDTE), ' of cultural property ', $itemURI)" />
								</xsl:when>
								<xsl:when test="./EDTL">
									<xsl:value-of
										select="concat('Edition ', normalize-space(./EDTL), ' of cultural property ', $itemURI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Edition ', position(), ' of cultural property ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:choose>
								<xsl:when test="./EDTE and ./EDTL">
									<xsl:value-of
										select="concat('Edition ', normalize-space(./EDTE), '-', normalize-space(./EDTL), ' of cultural property ', $itemURI)" />
								</xsl:when>
								<xsl:when test="./EDTE">
									<xsl:value-of
										select="concat('Edition ', normalize-space(./EDTE), ' of cultural property ', $itemURI)" />
								</xsl:when>
								<xsl:when test="./EDTL">
									<xsl:value-of
										select="concat('Edition ', normalize-space(./EDTL), ' of cultural property ', $itemURI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Edition ', position(), ' of cultural property ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
						<xsl:if test="./EDTE">
							<arco-cd:editionDate>
								<xsl:value-of select="normalize-space(./EDTE)" />
							</arco-cd:editionDate>
						</xsl:if>
						<xsl:if test="./EDTL">
							<arco-cd:editionLocation>
								<xsl:value-of select="normalize-space(./EDTL)" />
							</arco-cd:editionLocation>
						</xsl:if>
						<roapit:holdsRoleInTime>
							<xsl:attribute name="rdf:resource">
                                <!-- URI modificato da Valentina, aggiungendo $itemURI -->
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-edition-', position())" />
                            </xsl:attribute>
						</roapit:holdsRoleInTime>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of
							select="concat($NS, 'TimeIndexedRole/', $itemURI, '-edition-', position())" />
                            </xsl:attribute>
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/TimeIndexedRole'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:choose>
								<xsl:when test="./EDTR">
									<xsl:value-of
										select="concat(normalize-space(./EDTR), ' del bene ', $itemURI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat('Ruolo nel tempo del bene ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:choose>
								<xsl:when test="./EDTR">
									<xsl:value-of
										select="concat(normalize-space(./EDTR), ' of cultural property ', $itemURI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Time indexed role of cultural property ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<xsl:if test="./EDTN">
							<roapit:forAgent>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./EDTN)))" />
                                </xsl:attribute>
							</roapit:forAgent>
						</xsl:if>
						<xsl:if test="./EDTR">
							<roapit:withRole>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./EDTR)))" />
                                </xsl:attribute>
							</roapit:withRole>
						</xsl:if>
					</rdf:Description>
					<xsl:if test="./EDTR">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of
								select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./EDTR)))" />
                            </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="'https://w3id.org/italia/onto/RO/Role'" />
                                </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./EDTR)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./EDTR)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="./EDTN">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./EDTN)))" />
                            </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
                                </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./EDTN)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./EDTN)" />
							</l0:name>
							<xsl:if test="./EDTD">
								<arco-cd:agentDate>
									<xsl:value-of select="normalize-space(./EDTD)" />
								</arco-cd:agentDate>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="schede/*/DT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Dating/', $itemURI, '-', position())" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/context-description/Dating'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Cronologia ', position(), ' del bene ', $itemURI)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Dating ', position(), ' of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Cronologia ', position(), ' del bene ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Dating ', position(), ' of cultural property ', $itemURI)" />
					</rdfs:label>
					<arco-cd:hasEvent>
						<xsl:choose>
							<xsl:when test="./DTN/DTNS">
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="concat($NS, 'Event/', arco-fn:urify(normalize-space(./DTN/DTNS)))" />
                                </xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="concat($NS, 'Event/', $itemURI, '-creation-', position())" />
                                </xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-cd:hasEvent>
					<!-- Source of dating -->
					<xsl:if
						test="./DTM and not(lower-case(normalize-space(./DTM))='nr' or lower-case(normalize-space(./DTM))='n.r.' or lower-case(normalize-space(./DTM))='nr (recupero pregresso)' or lower-case(normalize-space(./DTM/DTMM))='nr' or lower-case(normalize-space(./DTM/DTMM))='n.r.' or lower-case(normalize-space(./DTM/DTMM))='nr (recupero pregresso)')">
						<arco-cd:hasSource>
							<xsl:choose>
								<xsl:when test="./DTM/DTMS">
									<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
										select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./DTM/DTMM)))" />
                                </xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
										select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./DTM)))" />
                                </xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</arco-cd:hasSource>
					</xsl:if>
				</rdf:Description>
				<!-- Source of dating as individual -->
				<xsl:if
					test="./DTM and not(lower-case(normalize-space(./DTM))='nr' or lower-case(normalize-space(./DTM))='n.r.' or lower-case(normalize-space(./DTM))='nr (recupero pregresso)' or lower-case(normalize-space(./DTM/DTMM))='nr' or lower-case(normalize-space(./DTM/DTMM))='n.r.' or lower-case(normalize-space(./DTM/DTMM))='nr (recupero pregresso)')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:choose>
                                <xsl:when test="./DTM/DTMS">
                                    <xsl:value-of
							select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./DTM/DTMM)))" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of
							select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./DTM)))" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/Source'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:choose>
								<xsl:when test="./DTM/DTMS">
									<xsl:value-of select="normalize-space(./DTM/DTMM)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(./DTM)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name>
							<xsl:choose>
								<xsl:when test="./DTM/DTMS">
									<xsl:value-of select="normalize-space(./DTM/DTMM)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(./DTM)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
						<xsl:if test="./DTMS">
							<arco-core:specifications>
								<xsl:value-of select="normalize-space(./DTMS)" />
							</arco-core:specifications>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:choose>
                            <xsl:when test="./DTN/DTNS">
                                <xsl:value-of
						select="concat($NS, 'Event/', arco-fn:urify(normalize-space(./DTNS)))" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of
						select="concat($NS, 'Event/', $itemURI, '-creation-', position())" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/l0/Event'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:choose>
							<xsl:when test="./DTN/DTNS">
								<xsl:value-of select="normalize-space(./DTN/DTNS)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('Realizzazione del bene ', $itemURI)" />
							</xsl:otherwise>
						</xsl:choose>
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:choose>
							<xsl:when test="./DTN/DTNS">
								<xsl:value-of select="normalize-space(./DTN/DTNS)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('Realizzazione del bene ', $itemURI)" />
							</xsl:otherwise>
						</xsl:choose>
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:choose>
							<xsl:when test="./DTN/DTNS">
								<xsl:value-of select="normalize-space(./DTN/DTNS)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat('Creation of cultural property ', $itemURI)" />
							</xsl:otherwise>
						</xsl:choose>
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:choose>
							<xsl:when test="./DTN/DTNS">
								<xsl:value-of select="normalize-space(./DTN/DTNS)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat('Creation of cultural property ', $itemURI)" />
							</xsl:otherwise>
						</xsl:choose>
					</l0:name>
					<xsl:if test="./DTN/DTNN">
						<l0:description>
							<xsl:value-of select="normalize-space(./DTN/DTNN)" />
						</l0:description>
					</xsl:if>
					<xsl:if test="./DTZ">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="./DTZ/DTZS">
                                        <xsl:value-of
								select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)), '-',  arco-fn:urify(normalize-space(./DTZ/DTZS)))" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of
								select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)))" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
						</tiapit:atTime>
						<xsl:if test="./DTS">
							<xsl:if test="./DTS/DTSI or ./DTS/DTSF">
								<xsl:variable name="startDate">
									<xsl:choose>
										<xsl:when test="./DTS/DTSV">
											<xsl:value-of
												select="concat(normalize-space(./DTS/DTSV), ' ', normalize-space(./DTS/DTSI))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="normalize-space(./DTS/DTSI)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<xsl:variable name="endDate">
									<xsl:choose>
										<xsl:when test="./DTS/DTSL">
											<xsl:value-of
												select="concat(normalize-space(./DTS/DTSL), ' ', normalize-space(./DTS/DTSF))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="normalize-space(./DTS/DTSF)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<arco-cd:specificTime>
									<xsl:attribute name="rdf:resource">
		                            	<xsl:value-of
										select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
		                        	</xsl:attribute>
								</arco-cd:specificTime>
							</xsl:if>
						</xsl:if>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./DTZ">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:choose>
                                <xsl:when test="./DTZ/DTZS">
                                    <xsl:value-of
							select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)), '-',  arco-fn:urify(normalize-space(./DTZ/DTZS)))" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of
							select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)))" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:choose>
								<xsl:when test="./DTZ/DTZS">
									<xsl:value-of
										select="concat(normalize-space(./DTZ/DTZG), ' ', normalize-space(./DTZ/DTZS))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(./DTZ/DTZG)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name>
							<xsl:choose>
								<xsl:when test="./DTZ/DTZS">
									<xsl:value-of
										select="concat(normalize-space(./DTZ/DTZG), ' ', normalize-space(./DTZ/DTZS))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(./DTZ/DTZG)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
						<!-- xsl:if test="./DTS"> <tiapit:startTime> <xsl:choose> <xsl:when 
							test="./DTS/DTSV"> <xsl:value-of select="concat(normalize-space(./DTS/DTSV), 
							' ', normalize-space(./DTS/DTSI))" /> </xsl:when> <xsl:otherwise> <xsl:value-of 
							select="normalize-space(./DTS/DTSI)" /> </xsl:otherwise> </xsl:choose> </tiapit:startTime> 
							<tiapit:endTime> <xsl:choose> <xsl:when test="./DTS/DTSL"> <xsl:value-of 
							select="concat(normalize-space(./DTS/DTSL), ' ', normalize-space(./DTS/DTSF))" 
							/> </xsl:when> <xsl:otherwise> <xsl:value-of select="normalize-space(./DTS/DTSF)" 
							/> </xsl:otherwise> </xsl:choose> </tiapit:endTime> </xsl:if -->
					</rdf:Description>
					<!-- Time intervall with start time and end time -->
					<xsl:if test="./DTS">
						<xsl:if test="./DTS/DTSI or ./DTS/DTSF">
							<xsl:variable name="startDate">
								<xsl:choose>
									<xsl:when test="./DTS/DTSV">
										<xsl:value-of
											select="concat(normalize-space(./DTS/DTSV), ' ', normalize-space(./DTS/DTSI))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./DTS/DTSI)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<xsl:variable name="endDate">
								<xsl:choose>
									<xsl:when test="./DTS/DTSL">
										<xsl:value-of
											select="concat(normalize-space(./DTS/DTSL), ' ', normalize-space(./DTS/DTSF))" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./DTS/DTSF)" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<rdf:Description>
								<xsl:attribute name="rdf:about">
		                            <xsl:value-of
									select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
		                        </xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
		                                <xsl:value-of
										select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
		                            </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="concat($startDate, ' - ', $endDate)" />
								</l0:name>
								<xsl:if test="./DTS">
									<tiapit:startTime>
										<xsl:value-of select="$startDate" />
									</tiapit:startTime>
									<tiapit:endTime>
										<xsl:value-of select="$endDate" />
									</tiapit:endTime>
								</xsl:if>
							</rdf:Description>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="schede/*/OG/OGT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:choose>
                            <xsl:when test="./OGTT">
                                <xsl:value-of
						select="concat($NS, 'CulturalPropertyType/', arco-fn:urify(normalize-space(./OGTD)), '-', arco-fn:urify(normalize-space(./OGTT)))" />
                            </xsl:when>
                            <xsl:when test="./OGTD">
                                <xsl:value-of
						select="concat($NS, 'CulturalPropertyType/', arco-fn:urify(normalize-space(./OGTD)))" />
                            </xsl:when>
                        </xsl:choose>
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/denotative-description/CulturalPropertyType'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:choose>
							<xsl:when test="./OGTT">
								<xsl:value-of select="concat('Tipo del bene: ', ./OGTD, ' ', ./OGTT)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('Tipo del bene: ', ./OGTD)" />
							</xsl:otherwise>
						</xsl:choose>
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:choose>
							<xsl:when test="./OGTT">
								<xsl:value-of
									select="concat('Cultural property type: ', ./OGTD, ' ', ./OGTT)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('Cultural property type: ', ./OGTD)" />
							</xsl:otherwise>
						</xsl:choose>
					</rdfs:label>
					<xsl:if
						test="./OGTD and not(lower-case(normalize-space(./OGTD))='nr' or lower-case(normalize-space(./OGTD))='n.r.' or lower-case(normalize-space(./OGTD))='nr (recupero pregresso)')">
						<arco-dd:hasCulturalPropertyDefinition>
							<xsl:attribute name="rdf:resource">
                            <xsl:value-of
								select="concat('https://w3id.org/arco/resource/CulturalPropertyDefinition/', arco-fn:urify(normalize-space(./OGTD)))" />
                        </xsl:attribute>
						</arco-dd:hasCulturalPropertyDefinition>
					</xsl:if>
					<xsl:if
						test="./OGTT and not(lower-case(normalize-space(./OGTT))='nr' or lower-case(normalize-space(./OGTT))='n.r.' or lower-case(normalize-space(./OGTT))='nr (recupero pregresso)')">
						<arco-dd:hasCulturalPropertySpecification>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat('https://w3id.org/arco/resource/CulturalPropertySpecification/', arco-fn:urify(normalize-space(./OGTT)))" />
                            </xsl:attribute>
						</arco-dd:hasCulturalPropertySpecification>
					</xsl:if>
				</rdf:Description>
			</xsl:for-each>
			<!-- We add the definition as an individual. The definition is associated 
				with a Cultural Property Type by the property arco-dd:hasCulturalPropertyDefinition. -->
			<xsl:if
				test="schede/*/OG/OGT/OGTD and not(lower-case(normalize-space(schede/*/OG/OGT/OGTD))='nr' or lower-case(normalize-space(schede/*/OG/OGT/OGTD))='n.r.' or lower-case(normalize-space(schede/*/OG/OGT/OGTD))='nr (recupero pregresso)')">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat('https://w3id.org/arco/resource/CulturalPropertyDefinition/', arco-fn:urify(normalize-space(schede/*/OG/OGT/OGTD)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/denotative-description/CulturalPropertyDefinition'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTD)" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<!-- We add the cultural property specification as an individual. It's 
				associated with a Cultural Property Type by the property arco-dd:hasCulturalPropertySpecification. -->
			<xsl:if
				test="schede/*/OG/OGT/OGTT and not(lower-case(normalize-space(schede/*/OG/OGT/OGTT))='nr' or lower-case(normalize-space(schede/*/OG/OGT/OGTT))='n.r.' or lower-case(normalize-space(schede/*/OG/OGT/OGTT))='nr (recupero pregresso)')">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat('https://w3id.org/arco/resource/CulturalPropertySpecification/', arco-fn:urify(normalize-space(schede/*/OG/OGT/OGTT)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/denotative-description/CulturalPropertySpecification'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTT)" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<!-- Cataloguing Agency - Agent Role CD/ESC -->
			<xsl:for-each select="schede/*/CD/ESC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'AgentRole/', $itemURI, '-cataloguing-agency')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/core/AgentRole'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Ente schedatore del bene ', $itemURI, ': ', .)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Cataloguing agency for cultural property ', $itemURI, ': ', .)" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Role/CataloguinAgency')" />
                        </xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                        </xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Role/CataloguinAgency')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Ente schedatore'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Cataloguing agency'" />
					</rdfs:label>
					<arco-core:isRoleOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-cataloguing-agency')" />
                        </xsl:attribute>
					</arco-core:isRoleOf>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="arco-fn:cataloguing-entity(normalize-space(.))" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:cataloguing-entity(normalize-space(.))" />
					</l0:name>
					<arco-core:isAgentOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-cataloguing-agency')" />
                        </xsl:attribute>
					</arco-core:isAgentOf>
				</rdf:Description>
			</xsl:for-each>
			<!-- Proponent Agency - Agent Role CD/EPR -->
			<xsl:for-each select="schede/*/CD/EPR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'AgentRole/', $itemURI, '-proponent-agency')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/core/AgentRole'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Ente proponente del bene ', $itemURI, ': ', .)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Proponent agency for cultural property ', $itemURI, ': ', .)" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Role/ProponentAgency')" />
                        </xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                        </xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Role/ProponentAgency')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Ente proponente'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Proponent agency'" />
					</rdfs:label>
					<arco-core:isRoleOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-proponent-agency')" />
                        </xsl:attribute>
					</arco-core:isRoleOf>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="arco-fn:cataloguing-entity(normalize-space(.))" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="arco-fn:cataloguing-entity(normalize-space(.))" />
					</l0:name>
					<arco-core:isAgentOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-proponent-agency')" />
                        </xsl:attribute>
					</arco-core:isAgentOf>
				</rdf:Description>
			</xsl:for-each>
			<!-- Heritage Protection Agency - Agent Role CD/ECP -->
			<xsl:if test="schede/*/CD/ECP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/core/AgentRole'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Ente competente per tutela del bene ', $itemURI, ': ', schede/*/CD/ECP)" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Heritage protection agency for cultural property ', $itemURI, ': ', schede/*/CD/ECP)" />
					</rdfs:label>
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Role/HeritageProtectionAgency')" />
                        </xsl:attribute>
					</arco-core:hasRole>
					<arco-core:hasAgent>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CD/ECP)))" />
                        </xsl:attribute>
					</arco-core:hasAgent>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Role/HeritageProtectionAgency')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Ente competente per tutela'" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Heritage Protection Agency'" />
					</rdfs:label>
					<arco-core:isRoleOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
                        </xsl:attribute>
					</arco-core:isRoleOf>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CD/ECP)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of
							select="arco-fn:cataloguing-entity(normalize-space(schede/*/CD/ECP))" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of
							select="arco-fn:cataloguing-entity(normalize-space(schede/*/CD/ECP))" />
					</l0:name>
					<arco-core:isAgentOf>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
                        </xsl:attribute>
					</arco-core:isAgentOf>
				</rdf:Description>
			</xsl:if>
			<!-- Acquisition of cultural property as an individual -->
			<xsl:for-each select="schede/*/TU/ACQ">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'Acquisition/', $itemURI, '-acquisition-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/context-description/Acquisition'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Acquisizione ', position(), ' del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Acquisizione ', position(), ' del bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Acquisition ', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Acquisition ', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./ACQT">
						<arco-cd:hasAcquisitionType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(./ACQT)))" />
            				</xsl:attribute>
						</arco-cd:hasAcquisitionType>
					</xsl:if>
					<xsl:if test="./ACQN">
						<arco-cd:hasPreviousOwner>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ACQN)))" />
            				</xsl:attribute>
						</arco-cd:hasPreviousOwner>
					</xsl:if>
					<xsl:if test="./ACQD">
						<tiapit:date>
							<xsl:value-of select="./ACQD" />
						</tiapit:date>
					</xsl:if>
					<xsl:if test="./ACQE">
						<arco-core:note>
							<xsl:value-of select="./ACQE" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./ACQL">
						<arco-cd:acquisitionLocation>
							<xsl:value-of select="./ACQL" />
						</arco-cd:acquisitionLocation>
					</xsl:if>
				</rdf:Description>
				<!-- acquisition type as an individual -->
				<xsl:if test="./ACQT">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(./ACQT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/AcquisitionType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./ACQT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./ACQT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- previous owner in acquisition as an individual -->
				<xsl:if test="./ACQN">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ACQN)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./ACQN)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./ACQN)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Change of availability of cultural property as an individual -->
			<xsl:for-each select="schede/*/TU/ALN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-change-of-availability')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/context-description/ChangeOfAvailability'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Mutamento condizione materiale del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Mutamento condizione materiale del bene culturale: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Change of availability of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Change of availability of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./ALNT">
						<arco-cd:hasChangeOfAvailabilityType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./ALNT)))" />
            				</xsl:attribute>
						</arco-cd:hasChangeOfAvailabilityType>
					</xsl:if>
					<xsl:if test="./ALND">
						<tiapit:date>
							<xsl:value-of select="./ALND" />
						</tiapit:date>
					</xsl:if>
					<xsl:if test="./ALNN">
						<arco-core:note>
							<xsl:value-of select="./ALNN" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
				<!-- acquisition type as an individual -->
				<xsl:if test="./ALNT">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./ALNT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/ChangeOfAvailabilityType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./ALNT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./ALNT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Photographic documentation of cultural property as an individual -->
			<xsl:for-each select="schede/*/DO/FTA">
				<xsl:variable name="photodocu-position">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-photographic-documentation-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/context-description/PhotographicDocumentation'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Photographic documentation ', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Photographic documentation ', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Documentazione fotografica ', position(), ' del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Documentazione fotografica ', position(), ' del bene culturale: ', $itemURI)" />
					</l0:name>
					<xsl:if test="FTAM">
						<arco-cd:documentationTitle>
							<xsl:value-of select="./FTAM" />
						</arco-cd:documentationTitle>
					</xsl:if>
					<xsl:if test="FTAM">
						<arco-cd:caption>
							<xsl:value-of select="./FTAM" />
						</arco-cd:caption>
					</xsl:if>
					<xsl:if test="./FTAN">
						<arco-cd:documentationIdentifier>
							<xsl:value-of select="./FTAN" />
						</arco-cd:documentationIdentifier>
					</xsl:if>
					<xsl:if test="./FTAD">
						<tiapit:date>
							<xsl:value-of select="./FTAD" />
						</tiapit:date>
					</xsl:if>
					<xsl:if test="./FTAC">
						<arco-cd:documentationLocation>
							<xsl:value-of select="./FTAC" />
						</arco-cd:documentationLocation>
					</xsl:if>
					<xsl:if test="./FTAS">
						<arco-core:specifications>
							<xsl:value-of select="./FTAS" />
						</arco-core:specifications>
					</xsl:if>
					<xsl:if test="./FTAK">
						<arco-cd:digitalFileName>
							<xsl:value-of select="./FTAK" />
						</arco-cd:digitalFileName>
					</xsl:if>
					<xsl:if test="./FTAT">
						<arco-core:note>
							<xsl:value-of select="./FTAT" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./FTAW">
						<smapit:URL>
							<xsl:value-of select="./FTAW" />
						</smapit:URL>
					</xsl:if>
					<xsl:if test="./FTAY">
						<arco-cd:rights>
							<xsl:value-of select="./FTAY" />
						</arco-cd:rights>
					</xsl:if>
					<xsl:if test="./FTAR">
						<arco-cd:stripRunAndFrameNumber>
							<xsl:value-of select="./FTAR" />
						</arco-cd:stripRunAndFrameNumber>
					</xsl:if>
					<xsl:if
						test="./FTAX and not(lower-case(normalize-space(./FTAX))='nr' or lower-case(normalize-space(./FTAX))='n.r.' or lower-case(normalize-space(./FTAX))='nr (recupero pregresso)')">
						<arco-core:hasCategory>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when
								test="lower-case(normalize-space(./FTAX))='documentazione esistente'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/ExistingDocumentation'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./FTAX))='documentazione allegata'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/AttachedDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="./FTAX">
                                        <xsl:value-of
								select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FTAX)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
						</arco-core:hasCategory>
					</xsl:if>
					<xsl:if test="./FTAP">
						<arco-cd:hasDocumentationType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FTAP)))" />
            				</xsl:attribute>
						</arco-cd:hasDocumentationType>
					</xsl:if>
					<xsl:if test="./FTAF">
						<arco-cd:hasFormat>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./FTAF)))" />
            				</xsl:attribute>
						</arco-cd:hasFormat>
					</xsl:if>
					<xsl:if test="./FTAA">
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FTAA)))" />
            				</xsl:attribute>
						</arco-cd:hasAuthor>
					</xsl:if>
					<xsl:if test="./FTAE">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-photographic-documentation-', $photodocu-position, '-photographic-documentation-owner')" />
            				</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
				</rdf:Description>
				<!-- documentation category of photographic documentation as an individual -->
				<xsl:if
					test="./FTAX and not(lower-case(normalize-space(./FTAX))='nr' or lower-case(normalize-space(./FTAX))='n.r.' or lower-case(normalize-space(./FTAX))='nr (recupero pregresso)')">
					<xsl:choose>
						<xsl:when
							test="lower-case(normalize-space(./FTAX))='documentazione esistente'" />
						<xsl:when
							test="lower-case(normalize-space(./FTAX))='documentazione allegata'" />
						<xsl:when test="./FTAX">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FTAX)))" />
                                </xsl:attribute>
								<rdf:type
									rdf:resource="https://w3id.org/arco/context-description/DocumentationCategory" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(./FTAX)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./FTAX)" />
								</l0:name>
							</rdf:Description>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<!-- documentation type of photographic documentation as an individual -->
				<xsl:if test="./FTAP">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FTAP)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/DocumentationType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FTAP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FTAP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- documentation format of photographic documentation as an individual -->
				<xsl:if test="./FTAF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./FTAF)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/Format'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FTAF)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FTAF)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- documentation author of photographic documentation as an individual -->
				<xsl:if test="./FTAA">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FTAA)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FTAA)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FTAA)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- agent role of photographic documentation as an individual -->
				<xsl:if test="./FTAE">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                        		<xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-photographic-documentation-', $photodocu-position, '-photographic-documentation-owner')" />
		                    		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Ente proprietario della documentazione fotografica ', $photodocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./FTAE))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Owner agency of photographic documentation ', $photodocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./FTAE))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Ente proprietario della documentazione fotografica ', $photodocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./FTAE))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Owner agency of photographic documentation ', $photodocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./FTAE))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Role/Owner')" />
				                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FTAE)))" />
				                        </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Ente proprietario della documentazione'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Owner of documentation'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-photographic-documentation-', $photodocu-position, '-photographic-documentation-owner')" />
				                        </xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FTAE)))" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FTAE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FTAE)" />
						</l0:name>
						<arco-core:isAgentOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-photographic-documentation-', $photodocu-position, '-photographic-documentation-owner')" />
				                        </xsl:attribute>
						</arco-core:isAgentOf>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Graphic or cartographic documentation of cultural property as an 
				individual -->
			<xsl:for-each select="schede/*/DO/DRA">
				<xsl:variable name="cartodocu-position">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'GraphicOrCartographicDocumentation/', $itemURI, '-graphic-cartographic-documentation-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/context-description/GraphicOrCartographicDocumentation'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Graphic or cartographic documentation ', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Graphic or cartographic documentation ', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Documentazione grafica o cartografica ', position(), ' del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Documentazione grafica o cartografica ', position(), ' del bene culturale: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./DRAN">
						<arco-cd:documentationIdentifier>
							<xsl:value-of select="./DRAN" />
						</arco-cd:documentationIdentifier>
					</xsl:if>
					<xsl:if test="./DRAD">
						<tiapit:date>
							<xsl:value-of select="./DRAD" />
						</tiapit:date>
					</xsl:if>
					<xsl:if test="./DRAC">
						<arco-cd:documentationLocation>
							<xsl:value-of select="./DRAC" />
						</arco-cd:documentationLocation>
					</xsl:if>
					<xsl:if test="./DRAP">
						<arco-core:specifications>
							<xsl:value-of select="./DRAP" />
						</arco-core:specifications>
					</xsl:if>
					<xsl:if test="./DRAK">
						<arco-cd:digitalFileName>
							<xsl:value-of select="./DRAK" />
						</arco-cd:digitalFileName>
					</xsl:if>
					<xsl:if test="./DRAO">
						<arco-core:note>
							<xsl:value-of select="./DRAO" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./DRAW">
						<smapit:URL>
							<xsl:value-of select="./DRAW" />
						</smapit:URL>
					</xsl:if>
					<xsl:if test="./DRAY">
						<arco-cd:rights>
							<xsl:value-of select="./DRAY" />
						</arco-cd:rights>
					</xsl:if>
					<xsl:if test="./DRAM">
						<arco-cd:documentationTitle>
							<xsl:value-of select="./DRAM" />
						</arco-cd:documentationTitle>
					</xsl:if>
					<xsl:if test="./DRAS">
						<arco-cd:hasScale>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Scale/', arco-fn:urify(normalize-space(./DRAS)))" />
            				</xsl:attribute>
						</arco-cd:hasScale>
					</xsl:if>
					<xsl:if
						test="./DRAX and not(lower-case(normalize-space(./DRAX))='nr' or lower-case(normalize-space(./DRAX))='n.r.' or lower-case(normalize-space(./DRAX))='nr (recupero pregresso)')">
						<arco-core:hasCategory>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when
								test="lower-case(normalize-space(./DRAX))='documentazione esistente'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/ExistingDocumentation'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./DRAX))='documentazione allegata'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/AttachedDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="./DRAX">
                                        <xsl:value-of
								select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./DRAX)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
						</arco-core:hasCategory>
					</xsl:if>
					<xsl:if test="./DRAT">
						<arco-cd:hasDocumentationType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./DRAT)))" />
            				</xsl:attribute>
						</arco-cd:hasDocumentationType>
					</xsl:if>
					<xsl:if test="./DRAF">
						<arco-cd:hasFormat>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./DRAF)))" />
            				</xsl:attribute>
						</arco-cd:hasFormat>
					</xsl:if>
					<xsl:if test="./DRAA">
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./DRAA)))" />
            				</xsl:attribute>
						</arco-cd:hasAuthor>
					</xsl:if>
					<xsl:if test="./DRAE">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-carto-graphic-documentation-', $cartodocu-position, '-carto-graphic-documentation-owner')" />
            				</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
				</rdf:Description>
				<!-- documentation scale of graphic or cartographic documentation as 
					an individual -->
				<xsl:if test="./DRAS">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Scale/', arco-fn:urify(normalize-space(./DRAS)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/Scale'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DRAS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DRAS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- documentation category of graphic or cartographic documentation 
					as an individual -->
				<xsl:if
					test="./DRAX and not(lower-case(normalize-space(./DRAX))='nr' or lower-case(normalize-space(./DRAX))='n.r.' or lower-case(normalize-space(./DRAX))='nr (recupero pregresso)')">
					<xsl:choose>
						<xsl:when
							test="lower-case(normalize-space(./DRAX))='documentazione esistente'" />
						<xsl:when
							test="lower-case(normalize-space(./DRAX))='documentazione allegata'" />
						<xsl:when test="./DRAX">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./DRAX)))" />
                                </xsl:attribute>
								<rdf:type
									rdf:resource="https://w3id.org/arco/context-description/DocumentationCategory" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(./DRAX)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./DRAX)" />
								</l0:name>
							</rdf:Description>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<!-- documentation type of graphic and cartographic documentation as 
					an individual -->
				<xsl:if test="./DRAT">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./DRAT)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/DocumentationType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DRAT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DRAT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- documentation format of graphic or cartographic documentation as 
					an individual -->
				<xsl:if test="./DRAF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./DRAF)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/Format'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DRAF)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DRAF)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- documentation author of photographic documentation as an individual -->
				<xsl:if test="./DRAA">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./DRAA)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DRAA)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DRAA)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- agent role of graphic or cartographic documentation as an individual -->
				<xsl:if test="./DRAE">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                        		<xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-carto-graphic-documentation-', $cartodocu-position, '-carto-graphic-documentation-owner')" />
		                    		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Ente proprietario della documentazione grafica o cartografica ', $cartodocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./DRAE))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Owner agency of graphic or cartographic documentation ', $cartodocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./DRAE))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Ente proprietario della documentazione grafica o cartografica ', $cartodocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./DRAE))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Owner agency of graphic or cartographic documentation ', $cartodocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./DRAE))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Role/Owner')" />
				                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./DRAE)))" />
				                        </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Ente proprietario della documentazione'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Owner of documentation'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-carto-graphic-documentation-', $cartodocu-position, '-carto-graphic-documentation-owner')" />
				                        </xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./DRAE)))" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DRAE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DRAE)" />
						</l0:name>
						<arco-core:isAgentOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-carto-graphic-documentation-', $cartodocu-position, '-carto-graphic-documentation-owner')" />
				                        </xsl:attribute>
						</arco-core:isAgentOf>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Film documentation of cultural property as an individual -->
			<xsl:for-each select="schede/*/DO/VDC">
				<xsl:variable name="filmdocu-position">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'FilmDocumentation/', $itemURI, '-film-documentation-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/context-description/FilmDocumentation'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Film documentation ', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Film documentation ', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Documentazione video-cinematografica ', position(), ' del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Documentazione video-cinematografica ', position(), ' del bene culturale: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./VDCN">
						<arco-cd:documentationIdentifier>
							<xsl:value-of select="./VDCN" />
						</arco-cd:documentationIdentifier>
					</xsl:if>
					<xsl:if test="./VDCD">
						<tiapit:date>
							<xsl:value-of select="./VDCD" />
						</tiapit:date>
					</xsl:if>
					<xsl:if test="./VDCC">
						<arco-cd:documentationLocation>
							<xsl:value-of select="./VDCC" />
						</arco-cd:documentationLocation>
					</xsl:if>
					<xsl:if test="./VDCS">
						<arco-core:specifications>
							<xsl:value-of select="./VDCS" />
						</arco-core:specifications>
					</xsl:if>
					<xsl:if test="./VDCK">
						<arco-cd:digitalFileName>
							<xsl:value-of select="./VDCK" />
						</arco-cd:digitalFileName>
					</xsl:if>
					<xsl:if test="./VDCT">
						<arco-core:note>
							<xsl:value-of select="./VDCT" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./VDCW">
						<smapit:URL>
							<xsl:value-of select="./VDCW" />
						</smapit:URL>
					</xsl:if>
					<xsl:if test="./VDCY">
						<arco-cd:rights>
							<xsl:value-of select="./VDCY" />
						</arco-cd:rights>
					</xsl:if>
					<xsl:if test="./VDCA">
						<arco-cd:documentationTitle>
							<xsl:value-of select="./VDCA" />
						</arco-cd:documentationTitle>
					</xsl:if>
					<xsl:if
						test="./VDCX and not(lower-case(normalize-space(./VDCX))='nr' or lower-case(normalize-space(./VDCX))='n.r.' or lower-case(normalize-space(./VDCX))='nr (recupero pregresso)')">
						<arco-core:hasCategory>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when
								test="lower-case(normalize-space(./VDCX))='documentazione esistente'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/ExistingDocumentation'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./VDCX))='documentazione allegata'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/AttachedDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="./VDCX">
                                        <xsl:value-of
								select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./VDCX)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
						</arco-core:hasCategory>
					</xsl:if>
					<xsl:if test="./VDCP">
						<arco-cd:hasDocumentationType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./VDCP)))" />
            				</xsl:attribute>
						</arco-cd:hasDocumentationType>
					</xsl:if>
					<xsl:if test="./VDCP">
						<arco-cd:hasFormat>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./VDCP)))" />
            				</xsl:attribute>
						</arco-cd:hasFormat>
					</xsl:if>
					<xsl:if test="./VDCR">
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./VDCR)))" />
            				</xsl:attribute>
						</arco-cd:hasAuthor>
					</xsl:if>
					<xsl:if test="./VDCE">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-film-documentation-', $filmdocu-position, '-film-documentation-owner')" />
            				</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
				</rdf:Description>
				<!-- documentation category of graphic or cartographic documentation 
					as an individual -->
				<xsl:if
					test="./VDCX and not(lower-case(normalize-space(./VDCX))='nr' or lower-case(normalize-space(./VDCX))='n.r.' or lower-case(normalize-space(./VDCX))='nr (recupero pregresso)')">
					<xsl:choose>
						<xsl:when
							test="lower-case(normalize-space(./VDCX))='documentazione esistente'" />
						<xsl:when
							test="lower-case(normalize-space(./VDCX))='documentazione allegata'" />
						<xsl:when test="./VDCX">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./VDCX)))" />
                                </xsl:attribute>
								<rdf:type
									rdf:resource="https://w3id.org/arco/context-description/DocumentationCategory" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(./VDCX)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./VDCX)" />
								</l0:name>
							</rdf:Description>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<!-- documentation type of film documentation as an individual - for 
					film documentation type and format are the same resource -->
				<xsl:if test="./VDCP">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./VDCP)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/DocumentationType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VDCP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VDCP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- documentation format of film documentation as an individual - for 
					film documentation type and format are the same resource -->
				<xsl:if test="./VDCP">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./VDCP)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/Format'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VDCP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VDCP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- documentation author of FILM documentation as an individual -->
				<xsl:if test="./VDCR">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./VDCR)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./VDCR)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./VDCR)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- agent role of film documentation as an individual -->
				<xsl:if test="./VDCE">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                        		<xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-film-documentation-', $filmdocu-position, '-film-documentation-owner')" />
		                    		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Ente proprietario della documentazione video-cinematografica ', $filmdocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./VDCE))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Owner agency of film documentation ', $filmdocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./VDCE))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Ente proprietario della documentazione video-cinematografica ', $filmdocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./VDCE))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Owner agency of film documentation ', $filmdocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./VDCE))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Role/Owner')" />
				                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./VDCE)))" />
				                        </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Ente proprietario della documentazione'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Owner of documentation'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-film-documentation-', $filmdocu-position, '-film-documentation-owner')" />
				                        </xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./DRAE)))" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./DRAE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./DRAE)" />
						</l0:name>
						<arco-core:isAgentOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-film-documentation-', $filmdocu-position, '-film-documentation-owner')" />
				                        </xsl:attribute>
						</arco-core:isAgentOf>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Audio documentation of cultural property as an individual -->
			<xsl:for-each select="schede/*/DO/REG">
				<xsl:variable name="audiodocu-position">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'AudioDocumentation/', $itemURI, '-audio-documentation-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/context-description/AudioDocumentation'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Audio documentation ', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Audio documentation ', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Documentazione audio ', position(), ' del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Documentazione audio ', position(), ' del bene culturale: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./REGN">
						<arco-cd:documentationIdentifier>
							<xsl:value-of select="./REGN" />
						</arco-cd:documentationIdentifier>
					</xsl:if>
					<xsl:if test="./REGD">
						<tiapit:date>
							<xsl:value-of select="./REGD" />
						</tiapit:date>
					</xsl:if>
					<xsl:if test="./REGC">
						<arco-cd:documentationLocation>
							<xsl:value-of select="./REGC" />
						</arco-cd:documentationLocation>
					</xsl:if>
					<xsl:if test="./REGS">
						<arco-core:specifications>
							<xsl:value-of select="./REGS" />
						</arco-core:specifications>
					</xsl:if>
					<xsl:if test="./REGK">
						<arco-cd:digitalFileName>
							<xsl:value-of select="./REGK" />
						</arco-cd:digitalFileName>
					</xsl:if>
					<xsl:if test="./REGT">
						<arco-core:note>
							<xsl:value-of select="./REGT" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./REGW">
						<smapit:URL>
							<xsl:value-of select="./REGW" />
						</smapit:URL>
					</xsl:if>
					<xsl:if test="./REGZ">
						<arco-cd:documentationTitle>
							<xsl:value-of select="./REGZ" />
						</arco-cd:documentationTitle>
					</xsl:if>
					<xsl:if
						test="./REGX and not(lower-case(normalize-space(./REGX))='nr' or lower-case(normalize-space(./REGX))='n.r.' or lower-case(normalize-space(./REGX))='nr (recupero pregresso)')">
						<arco-core:hasCategory>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when
								test="lower-case(normalize-space(./REGX))='documentazione esistente'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/ExistingDocumentation'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./REGX))='documentazione allegata'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/AttachedDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="./REGX">
                                        <xsl:value-of
								select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./REGX)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
						</arco-core:hasCategory>
					</xsl:if>
					<xsl:if test="./REGP">
						<arco-cd:hasDocumentationType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./REGP)))" />
            				</xsl:attribute>
						</arco-cd:hasDocumentationType>
					</xsl:if>
					<xsl:if test="./REGP">
						<arco-cd:hasFormat>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./REGP)))" />
            				</xsl:attribute>
						</arco-cd:hasFormat>
					</xsl:if>
					<xsl:if test="./REGA">
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./REGA)))" />
            				</xsl:attribute>
						</arco-cd:hasAuthor>
					</xsl:if>
					<xsl:if test="./REGE">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-audio-documentation-', $audiodocu-position, '-audio-documentation-owner')" />
            				</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
				</rdf:Description>
				<!-- documentation category of audio documentation as an individual -->
				<xsl:if
					test="./REGX and not(lower-case(normalize-space(./REGX))='nr' or lower-case(normalize-space(./REGX))='n.r.' or lower-case(normalize-space(./REGX))='nr (recupero pregresso)')">
					<xsl:choose>
						<xsl:when
							test="lower-case(normalize-space(./REGX))='documentazione esistente'" />
						<xsl:when
							test="lower-case(normalize-space(./REGX))='documentazione allegata'" />
						<xsl:when test="./REGX">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./REGX)))" />
                                </xsl:attribute>
								<rdf:type
									rdf:resource="https://w3id.org/arco/context-description/DocumentationCategory" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(./REGX)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./REGX)" />
								</l0:name>
							</rdf:Description>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<!-- documentation type of audio documentation as an individual - for 
					audio documentation type and format are the same resource -->
				<xsl:if test="./REGP">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./REGP)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/DocumentationType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./REGP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./REGP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- documentation format of audio documentation as an individual - for 
					audio documentation type and format are the same resource -->
				<xsl:if test="./REGP">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./REGP)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/Format'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./REGP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./REGP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- documentation author of audio documentation as an individual -->
				<xsl:if test="./REGA">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./REGA)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./REGA)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./REGA)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- agent role of audio documentation as an individual -->
				<xsl:if test="./REGE">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                        		<xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-audio-documentation-', $audiodocu-position, '-audio-documentation-owner')" />
		                    		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Ente proprietario della documentazione audio ', $audiodocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./REGE))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Owner agency of audio documentation ', $audiodocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./REGE))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Ente proprietario della documentazione audio ', $audiodocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./REGE))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Owner agency of audio documentation ', $audiodocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./REGE))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Role/Owner')" />
				                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./REGE)))" />
				                        </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Ente proprietario della documentazione'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Owner of documentation'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-audio-documentation-', $audiodocu-position, '-audio-documentation-owner')" />
				                        </xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./REGE)))" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./REGE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./REGE)" />
						</l0:name>
						<arco-core:isAgentOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-audio-documentation-', $audiodocu-position, '-audio-documentation-owner')" />
				                        </xsl:attribute>
						</arco-core:isAgentOf>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Sources and documents of cultural property as an individual -->
			<xsl:for-each select="schede/*/DO/FNT">
				<xsl:variable name="sourcedocu-position">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'SourceAndDocument/', $itemURI, '-source-document-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/context-description/SourceAndDocument'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Sources and documents ', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Sources and documents ', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Fonti e documenti ', position(), ' del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Fonti e documenti ', position(), ' del bene culturale: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./FNTI">
						<arco-cd:documentationIdentifier>
							<xsl:value-of select="./FNTI" />
						</arco-cd:documentationIdentifier>
					</xsl:if>
					<xsl:if test="./FNTD">
						<tiapit:date>
							<xsl:value-of select="./FNTD" />
						</tiapit:date>
					</xsl:if>
					<xsl:if test="./FNTS and not(./FNTS='-' or ./FNTS='.')">
						<arco-cd:documentationLocation>
							<xsl:value-of select="./FNTS" />
						</arco-cd:documentationLocation>
					</xsl:if>
					<xsl:if test="./FNTF">
						<arco-cd:folio>
							<xsl:value-of select="./FNTF" />
						</arco-cd:folio>
					</xsl:if>
					<xsl:if test="./FNTY">
						<arco-cd:rights>
							<xsl:value-of select="./FNTY" />
						</arco-cd:rights>
					</xsl:if>
					<xsl:if test="./FNTK">
						<arco-cd:digitalFileName>
							<xsl:value-of select="./FNTK" />
						</arco-cd:digitalFileName>
					</xsl:if>
					<xsl:if test="./FNTO">
						<arco-core:note>
							<xsl:value-of select="./FNTO" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./FNTW">
						<smapit:URL>
							<xsl:value-of select="./FNTW" />
						</smapit:URL>
					</xsl:if>
					<xsl:if test="./FNTT">
						<arco-cd:documentationTitle>
							<xsl:value-of select="./FNTT" />
						</arco-cd:documentationTitle>
					</xsl:if>
					<xsl:if
						test="./FNTX and not(lower-case(normalize-space(./FNTX))='nr' or lower-case(normalize-space(./FNTX))='n.r.' or lower-case(normalize-space(./FNTX))='nr (recupero pregresso)')">
						<arco-core:hasCategory>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when
								test="lower-case(normalize-space(./FNTX))='documentazione esistente'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/ExistingDocumentation'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./FNTX))='documentazione allegata'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/AttachedDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="./FNTX">
                                        <xsl:value-of
								select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FNTX)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
						</arco-core:hasCategory>
					</xsl:if>
					<xsl:if test="./FNTP">
						<arco-cd:hasDocumentationType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FNTP)))" />
            				</xsl:attribute>
						</arco-cd:hasDocumentationType>
					</xsl:if>
					<xsl:if test="./FNTR">
						<arco-cd:hasFormat>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./FNTR)))" />
            				</xsl:attribute>
						</arco-cd:hasFormat>
					</xsl:if>
					<xsl:if test="./FNTA">
						<arco-cd:hasAuthor>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FNTA)))" />
            				</xsl:attribute>
						</arco-cd:hasAuthor>
					</xsl:if>
					<xsl:if test="./FNTN">
						<arco-cd:hasArchive>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FNTN)))" />
            				</xsl:attribute>
						</arco-cd:hasArchive>
					</xsl:if>
					<xsl:if test="./FNTE">
						<arco-core:hasAgentRole>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-source-document-', $sourcedocu-position, '-source-document-owner')" />
            				</xsl:attribute>
						</arco-core:hasAgentRole>
					</xsl:if>
				</rdf:Description>
				<!-- documentation category of sources and documents as an individual -->
				<xsl:if
					test="./FNTX and not(lower-case(normalize-space(./FNTX))='nr' or lower-case(normalize-space(./FNTX))='n.r.' or lower-case(normalize-space(./FNTX))='nr (recupero pregresso)')">
					<xsl:choose>
						<xsl:when
							test="lower-case(normalize-space(./FNTX))='documentazione esistente'" />
						<xsl:when
							test="lower-case(normalize-space(./FNTX))='documentazione allegata'" />
						<xsl:when test="./FNTX">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FNTX)))" />
                                </xsl:attribute>
								<rdf:type
									rdf:resource="https://w3id.org/arco/context-description/DocumentationCategory" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(./FNTX)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./FNTX)" />
								</l0:name>
							</rdf:Description>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<!-- documentation type of sources and documents as an individual -->
				<xsl:if test="./FNTP">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FNTP)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/DocumentationType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FNTP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FNTP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- documentation format of sources and documents as an individual -->
				<xsl:if test="./FNTR">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./FNTR)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/Format'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FNTR)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FNTR)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- documentation author of sources and documents as an individual -->
				<xsl:if test="./FNTA">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FNTA)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FNTA)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FNTA)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- archive of sources and documents as an individual -->
				<xsl:if test="./FNTN">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FNTN)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FNTN)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FNTN)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- agent role of sources and documents as an individual -->
				<xsl:if test="./FNTE">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                        		<xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-source-document-', $sourcedocu-position, '-source-document-owner')" />
		                    		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Ente proprietario di fonti e documenti ', $sourcedocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./FNTE))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Owner agency of sources and documents ', $sourcedocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./FNTE))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Ente proprietario di fonti e documenti ', $sourcedocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./FNTE))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Owner agency of sources and documents ', $sourcedocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./FNTE))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Role/Owner')" />
				                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FNTE)))" />
				                        </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Ente proprietario della documentazione'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Owner of documentation'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-source-document-', $sourcedocu-position, '-source-document-owner')" />
				                        </xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FNTE)))" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./FNTE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./FNTE)" />
						</l0:name>
						<arco-core:isAgentOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-source-document-', $sourcedocu-position, '-source-document-owner')" />
				                        </xsl:attribute>
						</arco-core:isAgentOf>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Bibliography of cultural property as an individual -->
			<xsl:for-each select="schede/*/DO/BIB">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'Bibliography/', $itemURI, '-bibliography-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/context-description/Bibliography'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Bibliography ', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Bibliography ', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Bibliografia ', position(), ' del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Bibliografia ', position(), ' del bene culturale: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./BIBH">
						<arco-cd:bibliographyLocalIdentifier>
							<xsl:value-of select="normalize-space(./BIBH)" />
						</arco-cd:bibliographyLocalIdentifier>
					</xsl:if>
					<xsl:if test="./BIBK or ./NCUN">
						<arco-cd:bibliographyICCDIdentifier>
							<xsl:choose>
								<xsl:when test="./BIBK">
									<xsl:value-of select="normalize-space(./BIBK)" />
								</xsl:when>
								<xsl:when test="./NCUN">
									<xsl:value-of select="normalize-space(./NCUN)" />
								</xsl:when>
							</xsl:choose>
						</arco-cd:bibliographyICCDIdentifier>
					</xsl:if>
					<xsl:if test="./BIBM or ../BIL">
						<arco-cd:completeBibliographicReference>
							<xsl:choose>
								<xsl:when test="./BIBM">
									<xsl:value-of select="normalize-space(./BIBM)" />
								</xsl:when>
								<xsl:when test="../BIL">
									<xsl:value-of select="normalize-space(../BIL)" />
								</xsl:when>
							</xsl:choose>
						</arco-cd:completeBibliographicReference>
					</xsl:if>
					<xsl:if test="./BIBR">
						<arco-cd:abbreviation>
							<xsl:value-of select="normalize-space(./BIBR)" />
						</arco-cd:abbreviation>
					</xsl:if>
					<xsl:if test="./BIBY">
						<arco-cd:rights>
							<xsl:value-of select="normalize-space(./BIBY)" />
						</arco-cd:rights>
					</xsl:if>
					<xsl:if test="./BIBN or ./BIBI">
						<arco-core:note>
							<xsl:choose>
								<xsl:when test="./BIBI">
									<xsl:value-of
										select="concat(normalize-space(./BIBM), normalize-space(./BIBI))" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(./BIBN)" />
								</xsl:otherwise>
							</xsl:choose>
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./BIBW">
						<smapit:URL>
							<xsl:value-of select="normalize-space(./BIBW)" />
						</smapit:URL>
					</xsl:if>
					<xsl:if test="./BIBJ">
						<arco-cd:hasAuthorityFileCataloguingAgency>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./BIBJ)))" />
            				</xsl:attribute>
						</arco-cd:hasAuthorityFileCataloguingAgency>
					</xsl:if>
					<xsl:if
						test="./BIBX and not(lower-case(normalize-space(./BIBX))='nr' or lower-case(normalize-space(./BIBX))='n.r.' or lower-case(normalize-space(./BIBX))='nr (recupero pregresso)')">
						<arco-core:hasCategory>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when
								test="lower-case(normalize-space(./BIBX))='bibliografia di corredo'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/AccompanyingBibliography'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./BIBX))='bibliografia di confronto'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/ComparativeBibliography'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./BIBX))='bibliografia specifica'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/SpecificBibliography'" />
                                    </xsl:when>
                                    <xsl:when test="./BIBX">
                                        <xsl:value-of
								select="concat($NS, 'BibliographyCategory/', arco-fn:urify(normalize-space(./BIBX)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
						</arco-core:hasCategory>
					</xsl:if>
					<xsl:if test="./BIBF">
						<arco-cd:hasBibliographyType>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'BibliographyType/', arco-fn:urify(normalize-space(./BIBF)))" />
            				</xsl:attribute>
						</arco-cd:hasBibliographyType>
					</xsl:if>
				</rdf:Description>
				<!-- bibliography category as an individual -->
				<xsl:if
					test="./BIBX and not(lower-case(normalize-space(./BIBX))='nr' or lower-case(normalize-space(./BIBX))='n.r.' or lower-case(normalize-space(./BIBX))='nr (recupero pregresso)')">
					<xsl:choose>
						<xsl:when
							test="lower-case(normalize-space(./BIBX))='bibliografia di corredo'" />
						<xsl:when
							test="lower-case(normalize-space(./BIBX))='bibliografia di confronto'" />
						<xsl:when
							test="lower-case(normalize-space(./BIBX))='bibliografia specifica'" />
						<xsl:when test="./BIBX">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'BibliographyCategory/', arco-fn:urify(normalize-space(./BIBX)))" />
                                </xsl:attribute>
								<rdf:type
									rdf:resource="https://w3id.org/arco/context-description/BibliographyCategory" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(./BIBX)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./BIBX)" />
								</l0:name>
							</rdf:Description>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<!-- bibliography cataloguing agent as an individual -->
				<xsl:if test="./BIBJ">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                				<xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./BIBJ)))" />
                			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                            		<xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
                        		</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./BIBJ)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./BIBJ)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- bibliography type as an individual -->
				<xsl:if test="./BIBF">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            				<xsl:value-of
							select="concat($NS, 'BibliographyType/', arco-fn:urify(normalize-space(./BIBF)))" />
            			</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="'https://w3id.org/arco/context-description/BibliographyType'" />
            				</xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./BIBF)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./BIBF)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Legal situation of cultural property as an individual -->
			<xsl:if test="schede/*/TU/CDG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of
						select="concat($NS, 'LegalSituation/', $itemURI, '-legal-situation-', arco-fn:urify(normalize-space(schede/*/TU/CDG/CDGG)))" />
                	</xsl:attribute>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Condizione giuridica del bene culturale ', $itemURI, ': ', normalize-space(schede/*/TU/CDG/CDGG))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Condizione giuridica del bene culturale ', $itemURI, ': ', normalize-space(schede/*/TU/CDG/CDGG))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Legal situation of cultural property ', $itemURI, ': ', normalize-space(schede/*/TU/CDG/CDGG))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Legal situation of cultural property ', $itemURI, ': ', normalize-space(schede/*/TU/CDG/CDGG))" />
					</l0:name>
					<xsl:if test="schede/*/TU/CDG/CDGN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(schede/*/TU/CDG/CDGN)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="schede/*/TU/CDG/CDGS">
						<arco-cd:hasOwner>
							<xsl:attribute name="rdf:resource">
	            				<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/TU/CDG/CDGS)))" />
	            			</xsl:attribute>
						</arco-cd:hasOwner>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="schede/*/TU/CDG/CDGS">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/TU/CDG/CDGS)))" />
	            		</xsl:attribute>
						<rdfs:label>
							<xsl:value-of select="normalize-space(schede/*/TU/CDG/CDGS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(schede/*/TU/CDG/CDGS)" />
						</l0:name>
						<xsl:if test="schede/*/TU/CDG/CDGI">
							<arco-cd:address>
								<xsl:value-of select="normalize-space(schede/*/TU/CDG/CDGI)" />
							</arco-cd:address>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:if>
			<!-- Export import certification of cultural property as an individual -->
			<xsl:for-each select="schede/*/TU/ESP">
				<xsl:variable name="exp-position">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                		<xsl:value-of
						select="concat($NS, 'ExportImportCertification/', $itemURI, '-export-import-certification-', position())" />
                	</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/context-description/ExportImportCertification'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:choose>
							<xsl:when test="./ESPT">
								<xsl:value-of
									select="concat(normalize-space(./ESPT), ' ', position(), ' del bene culturale ', $itemURI)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat('Certificazione ', position(), ' per la circolazione del bene culturale ', $itemURI)" />
							</xsl:otherwise>
						</xsl:choose>
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:choose>
							<xsl:when test="./ESPT">
								<xsl:value-of
									select="concat(normalize-space(./ESPT), ' ', position(), ' del bene culturale ', $itemURI)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of
									select="concat('Certificazione ', position(), ' per la circolazione del bene culturale ', $itemURI)" />
							</xsl:otherwise>
						</xsl:choose>
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Certification ', position(), ' for import and export of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Certification ', position(), ' for import and export of cultural property ', $itemURI)" />
					</l0:name>
					<xsl:if test="./ESPD">
						<arco-cd:issueDate>
							<xsl:value-of select="normalize-space(./ESPD)" />
						</arco-cd:issueDate>
					</xsl:if>
					<xsl:if test="./ESPN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./ESPN)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./ESPT">
						<arco-cd:hasExportImportCertificationType>
							<xsl:attribute name="rdf:resource">
	                				<xsl:if
								test="./ESPT and not(./ESPT='.' or ./ESPT='-' or ./ESPT='/')">
	                                <xsl:choose>
	                                    <xsl:when
								test="lower-case(normalize-space(./ESPT))='attestato di libera circolazione' or lower-case(normalize-space(./ESPT))='attestato libera circolazione'">
	                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/FreeMovementCertification'" />
	                                    </xsl:when>
	                                    <xsl:when
								test="lower-case(normalize-space(./ESPT))='attestato di circolazione temporanea' or lower-case(normalize-space(./ESPT))='attestato circolazione temporanea'">
	                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/TemporaryMovementCertification'" />
	                                    </xsl:when>
	                                    <xsl:when
								test="lower-case(normalize-space(./ESPT))='licenza di esportazione definitiva' or lower-case(normalize-space(./ESPT))='licenza esportazione definitiva'">
	                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/PermanentExportLicense'" />
	                                    </xsl:when>
	                                    <xsl:when
								test="lower-case(normalize-space(./ESPT))='licenza di esportazione temporanea' or lower-case(normalize-space(./ESPT))='licenza esportazione temporanea'">
	                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/TemporaryExportLicense'" />
	                                    </xsl:when>
	                                    <xsl:when
								test="lower-case(normalize-space(./ESPT))='certificato di avvenuta spedizione' or lower-case(normalize-space(./ESPT))='certificato avvenuta spedizione'">
	                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/DeliveryConfirmationCertification'" />
	                                    </xsl:when>
	                                    <xsl:when
								test="lower-case(normalize-space(./ESPT))='certificato di avvenuta importazione' or lower-case(normalize-space(./ESPT))='certificato avvenuta importazione'">
	                                        <xsl:value-of
								select="'https://w3id.org/arco/context-description/ImportConfirmationCertification'" />
	                                    </xsl:when>
	                                    <xsl:when test="./ESPT">
	                                        <xsl:value-of
								select="concat($NS, 'ExportImportCertificationType/', arco-fn:urify(normalize-space(./ESPT)))" />
	                                    </xsl:when>
	                                </xsl:choose>
                    			</xsl:if>
	                			</xsl:attribute>
						</arco-cd:hasExportImportCertificationType>
					</xsl:if>
					<xsl:if test="./ESPU">
						<arco-cd:hasExportOffice>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ESPU)))" />
	                			</xsl:attribute>
						</arco-cd:hasExportOffice>
						<arco-core:hasAgentRole>
							<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-export-import-certification-', $exp-position, '-export-office')" />
						</arco-core:hasAgentRole>
					</xsl:if>
				</rdf:Description>
				<!-- export import certification type as an individual -->
				<xsl:if test="./ESPT">
					<xsl:choose>
						<xsl:when
							test="lower-case(normalize-space(./ESPT))='attestato di libera circolazione' or lower-case(normalize-space(./ESPT))='attestato libera circolazione'" />
						<xsl:when
							test="lower-case(normalize-space(./ESPT))='attestato di circolazione temporanea' or lower-case(normalize-space(./ESPT))='attestato circolazione temporanea'" />
						<xsl:when
							test="lower-case(normalize-space(./ESPT))='licenza di esportazione definitiva' or lower-case(normalize-space(./ESPT))='licenza esportazione definitiva'" />
						<xsl:when
							test="lower-case(normalize-space(./ESPT))='licenza di esportazione temporanea' or lower-case(normalize-space(./ESPT))='licenza esportazione temporanea'" />
						<xsl:when
							test="lower-case(normalize-space(./ESPT))='certificato di avvenuta spedizione' or lower-case(normalize-space(./ESPT))='certificato avvenuta spedizione'" />
						<xsl:when
							test="lower-case(normalize-space(./ESPT))='certificato di avvenuta importazione' or lower-case(normalize-space(./ESPT))='certificato avvenuta importazione'" />
						<xsl:when test="./ESPT and not(./ESPT='.' or ./ESPT='-' or ./ESPT='/')">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'ExportImportCertificationType/', arco-fn:urify(normalize-space(./ESPT)))" />
                                </xsl:attribute>
								<rdf:type
									rdf:resource="https://w3id.org/arco/context-description/ExportImportCertificationType" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(./ESPT)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./ESPT)" />
								</l0:name>
							</rdf:Description>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<!-- agent role of export import certification as an individual -->
				<xsl:if test="./ESPU">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                        		<xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-export-import-certification-', $exp-position, '-export-office')" />
		                    		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Ufficio Esportazione della certificazione ', $exp-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./ESPU))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Export Office of certification ', $exp-position, ' of cultural property ', $itemURI, ': ', normalize-space(./ESPU))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Ufficio Esportazione della certificazione ', $exp-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./ESPU))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Export Office of certification ', $exp-position, ' of cultural property ', $itemURI, ': ', normalize-space(./ESPU))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Role/ExportOffice')" />
				                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ESPU)))" />
				                        </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of
							select="concat($NS, 'Role/ExportOffice')" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Ufficio Esportazione'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Export Office'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-export-import-certification-', $exp-position, '-export-office')" />
				                        </xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ESPU)))" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./ESPU)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./ESPU)" />
						</l0:name>
						<arco-core:isAgentOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-export-import-certification-', $exp-position, '-export-office')" />
				                        </xsl:attribute>
						</arco-core:isAgentOf>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Protective measures of cultural property as an individual -->
			<xsl:for-each select="schede/*/TU/NVC">
				<xsl:variable name="measure-position">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                			<xsl:value-of
						select="concat($NS, 'ProtectiveMeasure/', $itemURI, '-protective-measure-', position())" />
                		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/context-description/ProtectiveMeasure'" />
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Protective measure ', position(), ' of cultural property ', $itemURI, ' : ', normalize-space(./NVCT))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Protective measure ', position(), ' of cultural property ', $itemURI, ' : ', normalize-space(./NVCT))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Provvedimento di tutela ', position(), ' del bene culturale ', $itemURI, ' : ', normalize-space(./NVCT))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Provvedimento di tutela ', position(), ' del bene culturale ', $itemURI, ' : ', normalize-space(./NVCT))" />
					</l0:name>
					<xsl:if test="./NVCE">
						<arco-cd:issueDate>
							<xsl:value-of select="normalize-space(./NVCE)" />
						</arco-cd:issueDate>
					</xsl:if>
					<xsl:if test="./NVCR">
						<arco-cd:registrationDateOrGU>
							<xsl:value-of select="normalize-space(./NVCR)" />
						</arco-cd:registrationDateOrGU>
					</xsl:if>
					<xsl:if test="./NVCI">
						<arco-cd:openingNoticeDate>
							<xsl:value-of select="normalize-space(./NVCI)" />
						</arco-cd:openingNoticeDate>
					</xsl:if>
					<xsl:if test="./NVCD">
						<arco-cd:noticeDate>
							<xsl:value-of select="normalize-space(./NVCD)" />
						</arco-cd:noticeDate>
					</xsl:if>
					<xsl:if test="./NVCW">
						<smapit:URL>
							<xsl:value-of select="normalize-space(./NVCW)" />
						</smapit:URL>
					</xsl:if>
					<xsl:if test="./NVCN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./NVCN)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./NVCA">
						<arco-cd:hasProponentAgency>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./NVCA)))" />
	                			</xsl:attribute>
						</arco-cd:hasProponentAgency>
						<arco-core:hasAgentRole>
							<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-protective-meausure-', $measure-position, '-proponent-agency')" />
						</arco-core:hasAgentRole>
					</xsl:if>
				</rdf:Description>
				<!-- agent role for protective measure as an individual -->
				<xsl:if test="./NVCA">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                        		<xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-protective-meausure-', $measure-position, '-proponent-agency')" />
		                    		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Ente proponente del provvedimento di tutela ', $measure-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./NVCA))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Proponent agency of protective measure ', $measure-position, ' of cultural property ', $itemURI, ': ', normalize-space(./NVCA))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Ente proponente del provvedimento di tutela ', $measure-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./NVCA))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Proponent agency of protective measure ', $measure-position, ' of cultural property ', $itemURI, ': ', normalize-space(./NVCA))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Role/ProponentAgency')" />
				                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./NVCA)))" />
				                        </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of
							select="concat($NS, 'Role/ProponentAgency')" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Ente proponente'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Proponent Agency'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-protective-meausure-', $measure-position, '-proponent-agency')" />
				                        </xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./NVCA)))" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./NVCA)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./NVCA)" />
						</l0:name>
						<arco-core:isAgentOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-protective-meausure-', $measure-position, '-proponent-agency')" />
				                        </xsl:attribute>
						</arco-core:isAgentOf>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Urban planning instrument of culturale property as an individual -->
			<xsl:for-each select="schede/*/TU/STU">
				<xsl:variable name="upinstrument-position">
					<xsl:value-of select="position()" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                			<xsl:value-of
						select="concat($NS, 'UrbanPlanningInstrument/', $itemURI, '-urban-planning-instrument-', position())" />
                		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/context-description/UrbanPlanningInstrument'" />
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Urban planning instrument ', position(), ' of cultural property ', $itemURI, ' : ', normalize-space(./STUT))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Urban planning instrument ', position(), ' of cultural property ', $itemURI, ' : ', normalize-space(./STUT))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Strumento urbanistico-territoriale ', position(), ' del bene culturale ', $itemURI, ' : ', normalize-space(./STUT))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Strumento urbanistico-territoriale ', position(), ' del bene culturale ', $itemURI, ' : ', normalize-space(./STUT))" />
					</l0:name>
					<xsl:if test="./STUW">
						<smapit:URL>
							<xsl:value-of select="normalize-space(./STUW)" />
						</smapit:URL>
					</xsl:if>
					<xsl:if test="./STUS">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./STUS)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./STUE">
						<arco-cd:hasIssuingAgency>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./STUE)))" />
	                			</xsl:attribute>
						</arco-cd:hasIssuingAgency>
						<arco-core:hasAgentRole>
							<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-urban-planning-instrument-', $upinstrument-position, '-issuing-agency')" />
						</arco-core:hasAgentRole>
					</xsl:if>
					<xsl:if test="./STUN">
						<arco-cd:hasEligibleIntervention>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'EligibleIntervention/', arco-fn:urify(normalize-space(./STUN)))" />
	                			</xsl:attribute>
						</arco-cd:hasEligibleIntervention>
					</xsl:if>
				</rdf:Description>
				<!-- agent role for urban planning instrument as an individual -->
				<xsl:if test="./STUE">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                        		<xsl:value-of
							select="concat($NS, 'AgentRole/', $itemURI, '-urban-planning-instrument-', $upinstrument-position, '-issuing-agency')" />
		                    		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Ente che ha emanato il provvedimento ', $upinstrument-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./STUE))" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Issuing agency of urban planning instrument ', $upinstrument-position, ' of cultural property ', $itemURI, ': ', normalize-space(./STUE))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Ente che ha emanato il provvedimento ', $upinstrument-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./STUE))" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Issuing agency of urban planning instrument ', $upinstrument-position, ' of cultural property ', $itemURI, ': ', normalize-space(./STUE))" />
						</l0:name>
						<arco-core:hasRole>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Role/IssuingAgency')" />
				                        </xsl:attribute>
						</arco-core:hasRole>
						<arco-core:hasAgent>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./STUE)))" />
				                        </xsl:attribute>
						</arco-core:hasAgent>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of
							select="concat($NS, 'Role/IssuingAgency')" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Ente che ha emanato il provvedimento'" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Issuing Agency'" />
						</rdfs:label>
						<arco-core:isRoleOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-urban-planning-instrument-', $upinstrument-position, '-issuing-agency')" />
				                        </xsl:attribute>
						</arco-core:isRoleOf>
					</rdf:Description>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
				                        <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./STUE)))" />
				                    </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./STUE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./STUE)" />
						</l0:name>
						<arco-core:isAgentOf>
							<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-urban-planning-instrument-', $upinstrument-position, '-issuing-agency')" />
				                        </xsl:attribute>
						</arco-core:isAgentOf>
					</rdf:Description>
				</xsl:if>
				<!-- eligible intervention of u.p.instrument as an individual -->
				<xsl:if test="./STUN">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
			                			<xsl:value-of
							select="concat($NS, 'EligibleIntervention/', arco-fn:urify(normalize-space(./STUN)))" />
									</xsl:attribute>
						<rdf:type>
							<xsl:value-of
								select="'https://w3id.org/arco/context-description/EligibleIntervention'" />
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./STUN)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./STUN)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Other related agents of cultural property as an individual -->
			<xsl:for-each select="schede/*/AU/NMC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                			<xsl:choose>
                				<xsl:when test="./NMCA">
                					<xsl:value-of
						select="concat($NS, 'RelatedAgent/', $itemURI, '-', arco-fn:urify(normalize-space(./NMCN)), '-', arco-fn:urify(normalize-space(./NMCA)))" />
                				</xsl:when>
                				<xsl:otherwise>
                					<xsl:value-of
						select="concat($NS, 'RelatedAgent/', $itemURI, '-', arco-fn:urify(normalize-space(./NMCN)))" />
                				</xsl:otherwise>
                			</xsl:choose>
                		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/context-description/RelatedAgent'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Related agent ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(./NMCN))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Related agent ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(./NMCN))" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Agente correlato ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(./NMCN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Agente correlato ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(./NMCN))" />
					</l0:name>
					<xsl:if test="./NMCA">
						<arco-cd:agentDate>
							<xsl:value-of select="normalize-space(./NMCA)" />
						</arco-cd:agentDate>
					</xsl:if>
					<xsl:if test="./NMCY">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./NMCY)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
			</xsl:for-each>
			<!-- Surveys -->
                <!-- Archaeological field survey of cultural property -->
                <xsl:if test="not(schede/*/RE/RCG/RCGD='0000/00/00' or schede/*/RE/RCG/RCGD='/')">
                <xsl:for-each select="schede/*/RE/RCG">
	                <xsl:variable name="survey-position">
						<xsl:value-of select="position()" />
					</xsl:variable>
                	<rdf:Description>
                		<xsl:attribute name="rdf:about">
                			<xsl:value-of select="concat($NS, 'ArchaeologicalFieldSurvey/', $itemURI, '-survey-', position())" />
                		</xsl:attribute>
                		<rdf:type>
                			<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="'https://w3id.org/arco/context-description/ArchaeologicalFieldSurvey'" />
                		</xsl:attribute>
                		</rdf:type>
                		<rdfs:label xml:lang="it">
                			<xsl:choose>
                				<xsl:when test="./RCGV">
                					<xsl:value-of select="concat('Ricognizione archeologica ', position(), ' sul bene ', $itemURI, ' : ', normalize-space(./RCGV))" />
                				</xsl:when>
                				<xsl:otherwise>
                					<xsl:value-of select="concat('Ricognizione archeologica ' , position(), ' sul bene ', $itemURI)" />
                				</xsl:otherwise>
                			</xsl:choose>
                		</rdfs:label>
                		<l0:name xml:lang="it">
                			<xsl:choose>
                				<xsl:when test="./RCGV">
                					<xsl:value-of select="concat('Ricognizione archeologica ', position(), ' sul bene ', $itemURI, ' : ', normalize-space(./RCGV))" />
                				</xsl:when>
                				<xsl:otherwise>
                					<xsl:value-of select="concat('Ricognizione archeologica ' , position(), ' sul bene ', $itemURI)" />
                				</xsl:otherwise>
                			</xsl:choose>
                		</l0:name>
                		<rdfs:label xml:lang="en">
                			<xsl:choose>
                				<xsl:when test="./RCGV">
                					<xsl:value-of select="concat('Archaeological field survey ', position(), ' of cultural property ', $itemURI, ' : ', normalize-space(./RCGV))" />
                				</xsl:when>
                				<xsl:otherwise>
                					<xsl:value-of select="concat('Archaeological field survey ' , position(), ' of cultural property ', $itemURI)" />
                				</xsl:otherwise>
                			</xsl:choose>
                		</rdfs:label>
                		<l0:name xml:lang="en">
                			<xsl:choose>
                				<xsl:when test="./RCGV">
                					<xsl:value-of select="concat('Ricognizione archeologica ', position(), ' of cultural property ', $itemURI, ' : ', normalize-space(./RCGV))" />
                				</xsl:when>
                				<xsl:otherwise>
                					<xsl:value-of select="concat('Ricognizione archeologica ' , position(), ' of cultural property ', $itemURI)" />
                				</xsl:otherwise>
                			</xsl:choose>
                		</l0:name>
                		<xsl:if test="./RCGZ">
                			<arco-core:note>
                				<xsl:value-of select="normalize-space(./RCGZ)" />
                			</arco-core:note>
                		</xsl:if>
                		<xsl:if test="./RCGD">
                			<tiapit:date>
                				<xsl:value-of select="normalize-space(./RCGD)" />
                			</tiapit:date>
                		</xsl:if>
                		<xsl:if test="./RCGK">
                			<arco-cd:archeologicalFieldSurveyICCDIdentifier>
                				<xsl:value-of select="normalize-space(./RCGK)" />
                			</arco-cd:archeologicalFieldSurveyICCDIdentifier>
                		</xsl:if>
                		<xsl:if test="./NCUN">
                			<arco-cd:archeologicalFieldSurveyICCDIdentifier>
                				<xsl:value-of select="normalize-space(./NCUN)" />
                			</arco-cd:archeologicalFieldSurveyICCDIdentifier>
                		</xsl:if>
                		<xsl:if test="./RCGH">
                			<arco-cd:archeologicalFielSurveyLocalIdentifier>
                				<xsl:value-of select="normalize-space(./RCGK)" />
                			</arco-cd:archeologicalFielSurveyLocalIdentifier>
                		</xsl:if>
                		<xsl:if test="./RCGU or ./RCGT or ./RCGC">
                			<arco-cd:environmentalState>
                				<xsl:choose>
                					<xsl:when test="./RCGT">
                						<xsl:value-of select="normalize-space(./RCGT)" />
                					</xsl:when>
                					<xsl:when test="./RCGU and ./RCGC">
                						<xsl:value-of select="concat(normalize-space(./RCGU), ' - ', normalize-space(./RCGC))" />
                					</xsl:when>
                					<xsl:otherwise>
                						<xsl:value-of select="concat(normalize-space(./RCGC), normalize-space(./RCGU))" />
                					</xsl:otherwise>
                				</xsl:choose>
                			</arco-cd:environmentalState>
                		</xsl:if>
                		<xsl:if test="./RCGS">
                			<arco-cd:hasBibliography>
                				<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'Bibliography/', $itemURI, '-survey-bibliography-', position())" />
	                		</xsl:attribute>
                			</arco-cd:hasBibliography>
                		</xsl:if>
                		<xsl:if test="./RCGM">
                			<arco-cd:hasMethod>
                				<xsl:attribute name="rdf:resource">
	                			<xsl:value-of
							select="concat($NS, 'Method/', arco-fn:urify(normalize-space(./RCGM)))" />
	                		</xsl:attribute>
                			</arco-cd:hasMethod>
                		</xsl:if>
                		<xsl:if test="./RCGA">
						<arco-cd:hasSurveyScientificDirector>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./RCGA)))" />
	                			</xsl:attribute>
						</arco-cd:hasSurveyScientificDirector>
						<arco-core:hasAgentRole>
							<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-archaeological-field-survey-', $survey-position, '-scientific-director')" />
						</arco-core:hasAgentRole>
					</xsl:if>
					<xsl:if test="./RCGR">
						<arco-cd:hasSurveyScientificDirector>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./RCGR)))" />
	                			</xsl:attribute>
						</arco-cd:hasSurveyScientificDirector>
						<arco-core:hasAgentRole>
							<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-archaeological-field-survey-', $survey-position, '-activity-responsible')" />
						</arco-core:hasAgentRole>
					</xsl:if>
					<xsl:if test="./RCGJ">
						<arco-cd:hasSurveyScientificDirector>
							<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./RCGJ)))" />
	                			</xsl:attribute>
						</arco-cd:hasSurveyScientificDirector>
						<arco-core:hasAgentRole>
							<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-archaeological-field-survey-', $survey-position, '-cataloguing-agency')" />
						</arco-core:hasAgentRole>
					</xsl:if>
                	</rdf:Description>
                	<!-- bibliography of survey as an individual -->
                	<xsl:if test="./RCGS">
                			<rdf:Description>
                				<xsl:attribute name="rdf:about">
		                			<xsl:value-of
								select="concat($NS, 'Bibliography/', $itemURI, '-archaeological-field-survey-bibliography-', position())" />
	                		</xsl:attribute>
	                		<rdf:type>
	                			<xsl:attribute name="rdf:resource">
	                				<xsl:value-of select="'https://w3id.org.arco/context-description/Bibliography'" />
	                			</xsl:attribute>
	                		</rdf:type>
	                		<rdfs:label xml:lang="it">
	                			<xsl:value-of select="concat('Bibliografia relativa alla ricognizione archeologica sul bene ', $itemURI)" />
	                		</rdfs:label>
	                		<l0:name xml:lang="it">
	                			<xsl:value-of select="concat('Bibliografia relativa alla ricognizione archeologica sul bene ', $itemURI)" />
	                		</l0:name>
	                		<rdfs:label xml:lang="en">
	                			<xsl:value-of select="concat('Bibliography about archaeological field survey of cultural property ', $itemURI)" />
	                		</rdfs:label>
	                		<l0:name xml:lang="en">
	                			<xsl:value-of select="concat('Bibliography about archaeological field survey of cultural property ', $itemURI)" />
	                		</l0:name>
	                		<arco-cd:completeBibliographicReference>
	                			<xsl:value-of select="./RCGS" />
	                		</arco-cd:completeBibliographicReference>
                		</rdf:Description>
                	</xsl:if>
                	<!-- method of survey as an individual -->
                	<xsl:if test="./RCGM">
                		<rdf:Description>
                			<xsl:attribute name="rdf:about">
	                			<xsl:value-of
							select="concat($NS, 'Method/', arco-fn:urify(normalize-space(./RCGM)))" />
	                		</xsl:attribute>
	                		<rdfs:label>
	                			<xsl:value-of select="normalize-space(./RCGM)" />
	                		</rdfs:label>
	                		<l0:name>
	                			<xsl:value-of select="normalize-space(./RCGM)" />
	                		</l0:name>
                		</rdf:Description>
                	</xsl:if>
                	<!-- agent role of survey scientific director as an individual -->
					<xsl:if test="./RCGA">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
			                        		<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-archaeological-field-survey-', $survey-position, '-scientific-director')" />
			                    		</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="'https://w3id.org/arco/core/AgentRole'" />
					                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Responsabile scientifico della ricognizione archeologica ', $survey-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./RCGA))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Responsabile scientifico della ricognizione archeologica ', $survey-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./RCGA))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Scientific director of archaeological field survey ', $survey-position, ' of cultural property ', $itemURI, ': ', normalize-space(./RCGA))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="cconcat('Scientific director of archaeological field survey ', $survey-position, ' of cultural property ', $itemURI, ': ', normalize-space(./RCGA))" />
							</l0:name>
							<arco-core:hasRole>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="concat($NS, 'Role/ScientificDirector')" />
					                        </xsl:attribute>
							</arco-core:hasRole>
							<arco-core:hasAgent>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./RCGA)))" />
					                        </xsl:attribute>
							</arco-core:hasAgent>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
					                        <xsl:value-of
								select="concat($NS, 'Role/ScientificDirector')" />
					                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="'https://w3id.org/italia/onto/RO/Role'" />
					                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="'Responsabile Scientifico'" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="'Scientific Director'" />
							</rdfs:label>
							<arco-core:isRoleOf>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="concat($NS, 'AgentRole/', $itemURI, '-archaeological-field-survey-', $survey-position, '-scientific-director')" />
					                        </xsl:attribute>
							</arco-core:isRoleOf>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
					                        <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./RCGA)))" />
					                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
					                        </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./RCGA)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./RCGA)" />
							</l0:name>
							<arco-core:isAgentOf>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="concat($NS, 'AgentRole/', $itemURI, '-archaeological-field-survey-', $survey-position, '-scientific-director')" />
					                        </xsl:attribute>
							</arco-core:isAgentOf>
						</rdf:Description>
					</xsl:if>
					<!-- agent role of activity responsible as an individual -->
					<xsl:if test="./RCGR">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
			                        		<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-archaeological-field-survey-', $survey-position, '-activity-responsible')" />
			                    		</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="'https://w3id.org/arco/core/AgentRole'" />
					                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Ente responsabile della ricognizione archeologica ', $survey-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./RCGR))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Ente responsabile della ricognizione archeologica ', $survey-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./RCGR))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Responsible agency of archaeological field survey ', $survey-position, ' of cultural property ', $itemURI, ': ', normalize-space(./RCGR))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="cconcat('Responsible agency of archaeological field survey ', $survey-position, ' of cultural property ', $itemURI, ': ', normalize-space(./RCGR))" />
							</l0:name>
							<arco-core:hasRole>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="concat($NS, 'Role/ActivityResponsible')" />
					                        </xsl:attribute>
							</arco-core:hasRole>
							<arco-core:hasAgent>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./RCGR)))" />
					                        </xsl:attribute>
							</arco-core:hasAgent>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
					                        <xsl:value-of
								select="concat($NS, 'Role/ActivityResponsible')" />
					                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="'https://w3id.org/italia/onto/RO/Role'" />
					                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="'Responsabile dell''attività'" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="'Activity Responsible'" />
							</rdfs:label>
							<arco-core:isRoleOf>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="concat($NS, 'AgentRole/', $itemURI, '-archaeological-field-survey-', $survey-position, '-activity-responsible')" />
					                        </xsl:attribute>
							</arco-core:isRoleOf>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
					                        <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./RCGR)))" />
					                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
					                        </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./RCGR)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./RCGR)" />
							</l0:name>
							<arco-core:isAgentOf>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="concat($NS, 'AgentRole/', $itemURI, '-archaeological-field-survey-', $survey-position, '-activity-responsible')" />
					                        </xsl:attribute>
							</arco-core:isAgentOf>
						</rdf:Description>
					</xsl:if>
					<!-- agent role of authority file cataloguing agency as an individual -->
					<xsl:if test="./RCGJ">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
			                        		<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-archaeological-field-survey-', $survey-position, '-cataloguing-agency')" />
			                    		</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="'https://w3id.org/arco/core/AgentRole'" />
					                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Ente schedatore dell''Authority File della ricognizione archeologica ', $survey-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./RCGJ))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Ente schedatore dell''Authority File della ricognizione archeologica ', $survey-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./RCGJ))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Authority File cataloguing agency of archaeological field survey ', $survey-position, ' of cultural property ', $itemURI, ': ', normalize-space(./RCGJ))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Authority File cataloguing agency of archaeological field survey ', $survey-position, ' of cultural property ', $itemURI, ': ', normalize-space(./RCGJ))" />
							</l0:name>
							<arco-core:hasRole>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="concat($NS, 'Role/AuthorityFileCataloguingAgency')" />
					                        </xsl:attribute>
							</arco-core:hasRole>
							<arco-core:hasAgent>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./RCGJ)))" />
					                        </xsl:attribute>
							</arco-core:hasAgent>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
					                        <xsl:value-of
								select="concat($NS, 'Role/AuthorityFileCataloguingAgency')" />
					                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="'https://w3id.org/italia/onto/RO/Role'" />
					                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="'Ente Schedatore dell''Authority File'" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="'Authority File Cataloguing Agency'" />
							</rdfs:label>
							<arco-core:isRoleOf>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="concat($NS, 'AgentRole/', $itemURI, '-archaeological-field-survey-', $survey-position, '-cataloguing-agency')" />
					                        </xsl:attribute>
							</arco-core:isRoleOf>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
					                        <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./RCGJ)))" />
					                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
					                        </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./RCGJ)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./RCGJ)" />
							</l0:name>
							<arco-core:isAgentOf>
								<xsl:attribute name="rdf:resource">
					                            <xsl:value-of
									select="concat($NS, 'AgentRole/', $itemURI, '-archaeological-field-survey-', $survey-position, '-cataloguing-agency')" />
					                        </xsl:attribute>
							</arco-core:isAgentOf>
						</rdf:Description>
					</xsl:if>
                </xsl:for-each>
               </xsl:if>
			<!-- Use of cultural property -->
			<xsl:if test="not(schede/A/UT or schede/PG/UT)">
				<xsl:for-each select="schede/*/UT">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'Use/', $itemURI, '-use-', position())" />
            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/context-description/Use'" />
            			</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Use ', position(), ' of cultural property ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Use ', position(), ' of cultural property ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Uso ', position(), ' del bene culturale ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Uso ', position(), ' del bene culturale ', $itemURI)" />
						</l0:name>
						<xsl:if test="./UTA">
							<arco-cd:isKeptIn>
								<xsl:value-of select="normalize-space(./UTA)" />
							</arco-cd:isKeptIn>
						</xsl:if>
						<xsl:if test="./UTU/UTUN">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./UTU/UTUN)" />
							</arco-core:note>
						</xsl:if>
						<xsl:if test="./UTU/UTUD or ./UTS">
							<tiapit:date>
								<xsl:choose>
									<xsl:when test="./UTU/UTUD">
										<xsl:value-of select="normalize-space(./UTU/UTUD)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./UTS)" />
									</xsl:otherwise>
								</xsl:choose>
							</tiapit:date>
						</xsl:if>
						<xsl:if test="./UTU/UTUT or ./UTF">
							<arco-cd:useFunction>
								<xsl:choose>
									<xsl:when test="./UTU/UTUF">
										<xsl:value-of select="normalize-space(./UTU/UTUF)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./UTF)" />
									</xsl:otherwise>
								</xsl:choose>
							</arco-cd:useFunction>
						</xsl:if>
						<xsl:if test="./UTU/UTUM or ./UTM">
							<arco-cd:useConditions>
								<xsl:choose>
									<xsl:when test="./UTU/UTUM">
										<xsl:value-of select="normalize-space(./UTU/UTUM)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./UTM)" />
									</xsl:otherwise>
								</xsl:choose>
							</arco-cd:useConditions>
						</xsl:if>
						<xsl:if test="./UTU/UTUT">
							<arco-cd:hasUseType>
								<xsl:attribute name="rdf:resource">
	                				<xsl:if
									test="./UTU/UTUT and not(./UTU/UTUT='.' or ./UTU/UTUT='-' or ./UTU/UTUT='/')">
		                                <xsl:choose>
		                                    <xsl:when
									test="lower-case(normalize-space(./UTU/UTUT))='attuale'">
		                                        <xsl:value-of
									select="'https://w3id.org/arco/context-description/Current'" />
		                                    </xsl:when>
		                                    <xsl:when
									test="lower-case(normalize-space(./UTU/UTUT))='precedente'">
		                                        <xsl:value-of
									select="'https://w3id.org/arco/context-description/Previous'" />
		                                    </xsl:when>
		                                    <xsl:when
									test="lower-case(normalize-space(./UTU/UTUT))='storico'">
		                                        <xsl:value-of
									select="'https://w3id.org/arco/context-description/Historical'" />
		                                    </xsl:when>
		                                    <xsl:when
									test="lower-case(normalize-space(./UTU/UTUT))='dato non disponibile'">
		                                        <xsl:value-of
									select="'https://w3id.org/arco/context-description/UseTypeUnavailable'" />
		                                    </xsl:when>
		                                    <xsl:when test="./UTU/UTUT">
		                                        <xsl:value-of
									select="concat($NS, 'UseType/', arco-fn:urify(normalize-space(./UTU/UTUT)))" />
		                                    </xsl:when>
		                                </xsl:choose>
                    				</xsl:if>
	                			</xsl:attribute>
							</arco-cd:hasUseType>
						</xsl:if>
						<xsl:if test="./UTU/UTUS">
							<arco-cd:hasUseTypeSpecification>
								<xsl:attribute name="rdf:resource">
	                				<xsl:if
									test="./UTU/UTUS and not(./UTU/UTUS='.' or ./UTU/UTUS='-' or ./UTU/UTUS='/')">
		                                <xsl:choose>
		                                    <xsl:when
									test="lower-case(normalize-space(./UTU/UTUS))='edilizio'">
		                                        <xsl:value-of
									select="'https://w3id.org/arco/context-description/Building'" />
		                                    </xsl:when>
		                                    <xsl:when
									test="lower-case(normalize-space(./UTU/UTUS))='epigrafico'">
		                                        <xsl:value-of
									select="'https://w3id.org/arco/context-description/Epigraphic'" />
		                                    </xsl:when>
		                                    <xsl:when
									test="lower-case(normalize-space(./UTU/UTUS))='strutturale'">
		                                        <xsl:value-of
									select="'https://w3id.org/arco/context-description/Structural'" />
		                                    </xsl:when>
		                                    <xsl:when
									test="lower-case(normalize-space(./UTU/UTUS))='ornamentale'">
		                                        <xsl:value-of
									select="'https://w3id.org/arco/context-description/Ornamental'" />
		                                    </xsl:when>
		                                    <xsl:when
									test="lower-case(normalize-space(./UTU/UTUS))='strumentale'">
		                                        <xsl:value-of
									select="'https://w3id.org/arco/context-description/Instrumental'" />
		                                    </xsl:when>
		                                    <xsl:when
									test="lower-case(normalize-space(./UTU/UTUS))='reimpiego'">
		                                        <xsl:value-of
									select="'https://w3id.org/arco/context-description/Reusing'" />
		                                    </xsl:when>
		                                    <xsl:when test="./UTU/UTUS">
		                                        <xsl:value-of
									select="concat($NS, 'UseTypeSpecification/', arco-fn:urify(normalize-space(./UTU/UTUS)))" />
		                                    </xsl:when>
		                                </xsl:choose>
                    				</xsl:if>
	                			</xsl:attribute>
							</arco-cd:hasUseTypeSpecification>
						</xsl:if>
						<xsl:if test="./UTU/UTUO or ./UTO">
							<arco-cd:hasCircumstance>
								<xsl:attribute name="rdf:resource">
	                				<xsl:choose>
	                					<xsl:when test="./UTU/UTUO">
	                						<xsl:value-of
									select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./UTU/UTUO)))" />
	                					</xsl:when>
	                					<xsl:otherwise>
	                						<xsl:value-of
									select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./UTO)))" />
	                					</xsl:otherwise>
	                				</xsl:choose>
	                			</xsl:attribute>
							</arco-cd:hasCircumstance>
						</xsl:if>
						<xsl:if test="./UTN">
							<arco-cd:hasUser>
								<xsl:attribute name="rdf:resource">
	                				<xsl:choose>
				            			<xsl:when test="./UTN/UTNN">
				            				<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./UTNN)))" />
				            			</xsl:when>
				            			<xsl:otherwise>
				            				<xsl:value-of
									select="concat($NS, 'Agent/', $itemURI, '-user')" />
				            			</xsl:otherwise>
		            				</xsl:choose>
	                			</xsl:attribute>
							</arco-cd:hasUser>
						</xsl:if>
						<xsl:if test="./UTL">
							<clvapit:hasSpatialCoverage>
								<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
									select="concat($NS, 'Feature/', arco-fn:urify(arco-fn:md5(normalize-space(./UTL))))" />
	                			</xsl:attribute>
							</clvapit:hasSpatialCoverage>
						</xsl:if>
						<xsl:if test="./AGC">
							<clvapit:hasSpatialCoverage>
								<xsl:attribute name="rdf:resource">
	                				<xsl:value-of
									select="concat($NS, 'Feature/', arco-fn:urify(normalize-space(./AGC)))" />
	                			</xsl:attribute>
							</clvapit:hasSpatialCoverage>
						</xsl:if>
					</rdf:Description>
					<!-- use type as an individual -->
					<xsl:if test="./UTU/UTUT">
						<xsl:choose>
							<xsl:when test="lower-case(normalize-space(./UTU/UTUT))='attuale'" />
							<xsl:when test="lower-case(normalize-space(./UTU/UTUT))='precedente'" />
							<xsl:when test="lower-case(normalize-space(./UTU/UTUT))='storico'" />
							<xsl:when
								test="lower-case(normalize-space(./UTU/UTUT))='dato non disponibile'" />
							<xsl:when
								test="../UTU/UTUT and not(./UTU/UTUT='.' or ./UTU/UTUT='-' or ./UTU/UTUT='/')">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                    <xsl:value-of
										select="concat($NS, 'UseType/', arco-fn:urify(normalize-space(./UTU/UTUT)))" />
                                </xsl:attribute>
									<rdf:type rdf:resource="https://w3id.org/arco/context-description/UseType" />
									<rdfs:label>
										<xsl:value-of select="normalize-space(./UTU/UTUT)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./UTU/UTUT)" />
									</l0:name>
								</rdf:Description>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
					<!-- use type specification as an individual -->
					<xsl:if test="./UTU/UTUS">
						<xsl:choose>
							<xsl:when test="lower-case(normalize-space(./UTU/UTUS))='strumentale'" />
							<xsl:when test="lower-case(normalize-space(./UTU/UTUS))='strutturale'" />
							<xsl:when test="lower-case(normalize-space(./UTU/UTUS))='edilizio'" />
							<xsl:when test="lower-case(normalize-space(./UTU/UTUS))='ornamentale'" />
							<xsl:when test="lower-case(normalize-space(./UTU/UTUS))='epigrafico'" />
							<xsl:when test="lower-case(normalize-space(./UTU/UTUS))='reimpiego'" />
							<xsl:when
								test="../UTU/UTUS and not(./UTU/UTUS='.' or ./UTU/UTUS='-' or ./UTU/UTUS='/')">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                    <xsl:value-of
										select="concat($NS, 'UseTypeSpecification/', arco-fn:urify(normalize-space(./UTU/UTUS)))" />
                                </xsl:attribute>
									<rdf:type rdf:resource="https://w3id.org/arco/context-description/UseType" />
									<rdfs:label>
										<xsl:value-of select="normalize-space(./UTU/UTUT)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./UTU/UTUT)" />
									</l0:name>
								</rdf:Description>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
					<!-- use circumstance as an individual -->
					<xsl:if test="./UTU/UTUO or ./UTO">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                             <xsl:choose>
	                			<xsl:when test="./UTU/UTUO">
	                				<xsl:value-of
								select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./UTU/UTUO)))" />
	                			</xsl:when>
	                			<xsl:otherwise>
	                				<xsl:value-of
								select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./UTO)))" />
	                			</xsl:otherwise>
	                		</xsl:choose>
                           </xsl:attribute>
							<rdf:type>
								<xsl:value-of select="'https://w3id.org/arco/context-description/Circumstance'" />
							</rdf:type>
							<rdfs:label>
								<xsl:choose>
									<xsl:when test="./UTU/UTUO">
										<xsl:value-of select="normalize-space(./UTU/UTUO)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./UTO)" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<l0:name>
								<xsl:choose>
									<xsl:when test="./UTU/UTUO">
										<xsl:value-of select="normalize-space(./UTU/UTUO)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./UTO)" />
									</xsl:otherwise>
								</xsl:choose>
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- user as individual -->
					<xsl:if test="./UTN">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		            		<xsl:choose>
		            			<xsl:when test="./UTN/UTNN">
		            				<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./UTNN)))" />
		            			</xsl:when>
		            			<xsl:otherwise>
		            				<xsl:value-of
								select="concat($NS, 'Agent/', $itemURI, '-user')" />
		            			</xsl:otherwise>
		            		</xsl:choose>	
	            		</xsl:attribute>
							<xsl:choose>
								<xsl:when test="./UTN/UTNN">
									<rdfs:label>
										<xsl:value-of select="normalize-space(./UTNN)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./UTNN)" />
									</l0:name>
								</xsl:when>
								<xsl:otherwise>
									<rdfs:label xml:lang="en">
										<xsl:value-of select="concat('User of cultural property ', $itemURI)" />
									</rdfs:label>
									<l0:name xml:lang="en">
										<xsl:value-of select="concat('User of cultural property ', $itemURI)" />
									</l0:name>
									<rdfs:label xml:lang="it">
										<xsl:value-of select="concat('Utente del bene culturale ', $itemURI)" />
									</rdfs:label>
									<l0:name xml:lang="it">
										<xsl:value-of select="concat('Utente del bene culturale ', $itemURI)" />
									</l0:name>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="./UTN/UTNA">
								<arco-cd:agentDate>
									<xsl:value-of select="normalize-space(./UTN/UTNA)" />
								</arco-cd:agentDate>
							</xsl:if>
							<xsl:if test="./UTN/UTNM">
								<arco-cd:hasProfession>
									<xsl:attribute name="rdf:resource">
	            					<xsl:value-of
										select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(./UTN/UTNM)))" />
	            				</xsl:attribute>
								</arco-cd:hasProfession>
							</xsl:if>
							<xsl:if test="./UTN/UTNC">
								<arco-cd:hasUserSocialCategory>
									<xsl:attribute name="rdf:resource">
	            					<xsl:value-of
										select="concat($NS, 'SocialCategory/', arco-fn:urify(normalize-space(./UTN/UTNC)))" />
	            				</xsl:attribute>
								</arco-cd:hasUserSocialCategory>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
					<!-- profession of user as an individual -->
					<xsl:if test="./UTN/UTNM">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
            				<xsl:value-of
								select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(./UTN/UTNM)))" />
            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
            					<xsl:value-of
									select="'https://w3id.org/arco/context-description/Profession'" />
            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./UTN/UTNM)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./UTN/UTNM)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- social category of user as an individual -->
					<xsl:if test="./UTN/UTNC">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
            				<xsl:value-of
								select="concat($NS, 'UserSocialCategory/', arco-fn:urify(normalize-space(./UTN/UTNC)))" />
            			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
            					<xsl:value-of
									select="'https://w3id.org/arco/context-description/UserSocialCategory'" />
            				</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./UTN/UTNC)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./UTN/UTNC)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- use location AGC as an individual -->
					<xsl:if test="./AGC">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                	<xsl:value-of
								select="concat($NS, 'Feature/', arco-fn:urify(normalize-space(./AGC)))" />
		                </xsl:attribute>
							<rdf:type>
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Luogo identificato da: ', normalize-space(./AGC))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Luogo identificato da: ', normalize-space(./AGC))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Location identified by: ', normalize-space(./AGC))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Location identified by: ', normalize-space(./AGC))" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- use location UTL as an individual -->
					<xsl:if test="./UTL">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                	<xsl:value-of
								select="concat($NS, 'Feature/', arco-fn:urify(arco-fn:md5(normalize-space(./UTL))))" />
		                </xsl:attribute>
							<rdf:type>
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./UTL)" />
							</rdfs:label>
							<clvapit:hasAddress>
								<xsl:attribute name="rdf:resource">
	                           <xsl:value-of
									select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(normalize-space(./UTL))))" />
	                        </xsl:attribute>
							</clvapit:hasAddress>
						</rdf:Description>
						<!-- address of use location as an individual -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                	<xsl:value-of
								select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(normalize-space(./UTL))))" />
		                </xsl:attribute>
							<rdf:type>
								<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
							</rdf:type>
							<rdfs:label>
								<xsl:for-each select="./UTL/*">
									<xsl:choose>
										<xsl:when test="position() = 1">
											<xsl:value-of select="./text()" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat(', ', ./text())" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</rdfs:label>
							<l0:name>
								<xsl:for-each select="./UTL/*">
									<xsl:choose>
										<xsl:when test="position() = 1">
											<xsl:value-of select="./text()" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="concat(', ', ./text())" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</l0:name>
							<xsl:if test="./UTL/UTLL">
								<clvapit:hasAddressArea>
									<xsl:value-of
										select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./UTL/UTLL)))" />
								</clvapit:hasAddressArea>
							</xsl:if>
							<xsl:if test="./UTL/UTLF">
								<clvapit:hasAddressArea>
									<xsl:value-of
										select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./UTL/UTLF)))" />
								</clvapit:hasAddressArea>
							</xsl:if>
							<xsl:if test="./UTL/UTLS">
								<clvapit:hasCountry>
									<xsl:value-of
										select="concat($NS, 'Country/', arco-fn:urify(normalize-space(./UTL/UTLS)))" />
								</clvapit:hasCountry>
							</xsl:if>
							<xsl:if test="./UTL/UTLR">
								<clvapit:hasRegion>
									<xsl:value-of
										select="concat($NS, 'Region/', arco-fn:urify(normalize-space(./UTL/UTLR)))" />
								</clvapit:hasRegion>
							</xsl:if>
							<xsl:if test="./UTL/UTLP">
								<clvapit:hasProvince>
									<xsl:value-of
										select="concat($NS, 'Province/', arco-fn:urify(normalize-space(./UTL/UTLP)))" />
								</clvapit:hasProvince>
							</xsl:if>
							<xsl:if test="./UTL/UTLC">
								<clvapit:hasCity>
									<xsl:value-of
										select="concat($NS, 'City/', arco-fn:urify(normalize-space(./UTL/UTLC)))" />
								</clvapit:hasCity>
							</xsl:if>
						</rdf:Description>
						<xsl:if test="./UTL/UTLL">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                            	<xsl:value-of
									select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./UTL/UTLL)))" />
                       	 	</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
                                <xsl:value-of
										select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                            </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./UTL/UTLL)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./UTL/UTLL)" />
								</l0:name>
							</rdf:Description>
						</xsl:if>
						<xsl:if test="./UTL/UTLF">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                            	<xsl:value-of
									select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./UTL/UTLF)))" />
                       	 	</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
                                <xsl:value-of
										select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                            </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./UTL/UTLF)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./UTL/UTLF)" />
								</l0:name>
							</rdf:Description>
						</xsl:if>
						<xsl:if test="./UTL/UTLS">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                            	<xsl:value-of
									select="concat($NS, 'Country/', arco-fn:urify(normalize-space(./UTL/UTLS)))" />
                       	 	</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
	                                <xsl:value-of
										select="'https://w3id.org/italia/onto/CLV/Country'" />
	                            </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./UTL/UTLS)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./UTL/UTLS)" />
								</l0:name>
							</rdf:Description>
						</xsl:if>
						<xsl:if test="./UTL/UTLR">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                            	<xsl:value-of
									select="concat($NS, 'Region/', arco-fn:urify(normalize-space(./UTL/UTLR)))" />
                       	 	</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
	                                <xsl:value-of
										select="'https://w3id.org/italia/onto/CLV/Region'" />
	                            </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./UTL/UTLR)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./UTL/UTLR)" />
								</l0:name>
							</rdf:Description>
						</xsl:if>
						<xsl:if test="./UTL/UTLP">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                            	<xsl:value-of
									select="concat($NS, 'Province/', arco-fn:urify(normalize-space(./UTL/UTLP)))" />
                       	 	</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
	                                <xsl:value-of
										select="'https://w3id.org/italia/onto/CLV/Province'" />
	                            </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./UTL/UTLP)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./UTL/UTLP)" />
								</l0:name>
							</rdf:Description>
						</xsl:if>
						<xsl:if test="./UTL/UTLC">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                            	<xsl:value-of
									select="concat($NS, 'City/', arco-fn:urify(normalize-space(./UTL/UTLC)))" />
                       	 	</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
	                                <xsl:value-of
										select="'https://w3id.org/italia/onto/CLV/City'" />
	                            </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(./UTL/UTLC)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./UTL/UTLC)" />
								</l0:name>
							</rdf:Description>
						</xsl:if>
					</xsl:if>
					<!-- address of location of use as an individual -->
				</xsl:for-each>
			</xsl:if>
			<!-- SMO and PST NORM - Use of cultural property -->
			<xsl:if test="schede/*/DA/UTM or schede/*/DA/UTF or schede/*/DA/UTS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-use')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/context-description/Use'" />
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Use of cultural property ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Use of cultural property ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Uso del bene culturale ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Uso del bene culturale ', $itemURI)" />
					</l0:name>
					<xsl:if test="schede/*/DA/UTS">
						<tiapit:date>
							<xsl:value-of select="normalize-space(schede/*/DA/UTS)" />
						</tiapit:date>
					</xsl:if>
					<xsl:if test="schede/*/DA/UTF">
						<arco-cd:useFunction>
							<xsl:value-of select="normalize-space(schede/*/DA/UTF)" />
						</arco-cd:useFunction>
					</xsl:if>
					<xsl:if test="schede/*/DA/UTM">
						<arco-cd:useConditions>
							<xsl:value-of select="normalize-space(schede/*/DA/UTM)" />
						</arco-cd:useConditions>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
			<!-- material of cultural property (version 4.00) and VeAC as an individual -->
			<xsl:for-each select="schede/*/MT/MTC/MTCM | schede/VeAC/MT/MTC/MTCF">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-material-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<xsl:choose>
						<xsl:when test=".">
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Materia ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Materia ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Material ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(.))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Material ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(.))" />
							</l0:name>
							<xsl:if test="../MTCS">
								<arco-core:note>
									<xsl:value-of select="../MTCS" />
								</arco-core:note>
							</xsl:if>
						</xsl:when>
						<xsl:when test="schede/VeAC/MT/MTC/MTCF">
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Materia ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(schede/VeAC/MT/MTC/MTCF))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Materia ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(schede/VeAC/MT/MTC/MTCF))" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Material ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(schede/VeAC/MT/MTC/MTCF))" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Material ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(schede/VeAC/MT/MTC/MTCF))" />
							</l0:name>
						</xsl:when>
					</xsl:choose>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:choose>
            					<xsl:when test=".">
            						<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(.)))" />
            					</xsl:when>
            					<xsl:when test="schede/VeAC/MT/MTC/MTCF">
            						<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/VeAC/MT/MTC/MTCF)))" />
            					</xsl:when>
            				</xsl:choose>
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/Material'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:choose>
            				<xsl:when test=".">
            					<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(.)))" />
            				</xsl:when>
            				<xsl:when test="schede/VeAC/MT/MTC/MTCF">
            					<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/VeAC/MT/MTC/MTCF)))" />
            				</xsl:when>
            			</xsl:choose>
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<xsl:choose>
						<xsl:when test=".">
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(.)" />
							</l0:name>
						</xsl:when>
						<xsl:when test="schede/VeAC/MT/MTC/MTCF">
							<rdfs:label>
								<xsl:value-of select="normalize-space(schede/VeAC/MT/MTC/MTCF)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(schede/VeAC/MT/MTC/MTCF)" />
							</l0:name>
						</xsl:when>
					</xsl:choose>
				</rdf:Description>
			</xsl:for-each>
			<!-- technique of cultural property (version 4.00) as an individual -->
			<xsl:for-each select="schede/*/MT/MTC/MTCT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-technique-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Tecnica ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Tecnica ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Technique ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(.))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Technique ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(.))" />
					</l0:name>
					<xsl:if test="../MTCS">
						<arco-core:note>
							<xsl:value-of select="../MTCS" />
						</arco-core:note>
					</xsl:if>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(.)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/Technique'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(.)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
			<!-- materialOrTechnique of cultural property (previous versions) as an 
				individual -->
			<xsl:if test="not(schede/*/MT/MTC/*)">
				<xsl:for-each select="schede/*/MT/MTC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-material-technique-', position())" />
            		</xsl:attribute>
						<rdf:type>
							<xsl:value-of
								select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Materia e/o tecnica ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Materia e/o tecnica ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Material and/or technique ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Material and/or technique ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(.))" />
						</l0:name>
						<arco-dd:satisfiesTechnicalDetail>
							<xsl:attribute name="rdf:resource">
            				<xsl:value-of
								select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(.)))" />
            			</xsl:attribute>
						</arco-dd:satisfiesTechnicalDetail>
						<arco-dd:usesTechnicalCharacteristic>
							<xsl:attribute name="rdf:resource">
            				<xsl:value-of
								select="'https://w3id.org/arco/denotative-description/MaterialOrTechnique'" />
            			</xsl:attribute>
						</arco-dd:usesTechnicalCharacteristic>
					</rdf:Description>
					<!-- Technical detail as an individual -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(.)))" />
            		</xsl:attribute>
						<rdf:type>
							<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(.)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(.)" />
						</l0:name>
					</rdf:Description>
				</xsl:for-each>
			</xsl:if>
			<!-- shape of cultural property as an individual -->
			<xsl:if test="schede/*/MT/FRM and not(schede/F/MT/FRM)">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-shape')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Formato del bene culturale ', $itemURI, ': ', normalize-space(schede/*/MT/FRM))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Formato del bene culturale ', $itemURI, ': ', normalize-space(schede/*/MT/FRM))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Shape of cultural property ', $itemURI, ': ', normalize-space(schede/*/MT/FRM))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Shape of cultural property ', $itemURI, ': ', normalize-space(schede/*/MT/FRM))" />
					</l0:name>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/*/MT/FRM)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/denotative-description/Shape'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/*/MT/FRM)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/MT/FRM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(schede/*/MT/FRM)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- filigree of cultural property as an individual -->
			<xsl:if test="schede/*/MT/FIL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-filigree')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Filigrana del bene culturale ', $itemURI, ': ', normalize-space(schede/*/MT/FIL))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Filigrana del bene culturale ', $itemURI, ': ', normalize-space(schede/*/MT/FIL))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Filigree of cultural property ', $itemURI, ': ', normalize-space(schede/*/MT/FIL))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Filigree of cultural property ', $itemURI, ': ', normalize-space(schede/*/MT/FIL))" />
					</l0:name>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/*/MT/FIL)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/Filigree'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/*/MT/FIL)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/MT/FIL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(schede/*/MT/FIL)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- file format of photograph (F) as an individual -->
			<xsl:if test="schede/F/MT/FVC/FVCF">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-file-format')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Formato di compressione/estensione file del bene culturale ', $itemURI, ': ', normalize-space(schede/*/MT/FVC/FVCF))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Formato di compressione/estensione file del bene culturale ', $itemURI, ': ', normalize-space(schede/*/MT/FVC/FVCF))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('File format of cultural property ', $itemURI, ': ', normalize-space(schede/*/MT/FVC/FVCF))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('File format of cultural property ', $itemURI, ': ', normalize-space(schede/*/MT/FVC/FVCF))" />
					</l0:name>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/*/MT/FVC/FVCF)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/FileFormat'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/*/MT/FVC/FVCF)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/MT/FVC/FVCF)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(schede/*/MT/FVC/FVCF)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- photo size of photograph (F) as an individual -->
			<xsl:if test="schede/F/MT/FRM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-photo-size')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Formato (dimensione standard) del bene culturale ', $itemURI, ': ', normalize-space(schede/F/MT/FRM))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Formato (dimensione standard) del bene culturale ', $itemURI, ': ', normalize-space(schede/F/MT/FRM))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Photo size of cultural property ', $itemURI, ': ', normalize-space(schede/F/MT/FRM))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Photo size of cultural property ', $itemURI, ': ', normalize-space(schede/F/MT/FRM))" />
					</l0:name>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/F/MT/FRM)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/PhotoSize'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/F/MT/FRM)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/F/MT/FRM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(schede/F/MT/FRM)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- photo program of photograph (F) as an individual -->
			<xsl:if test="schede/F/MT/FVC/FVCP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-photo-program')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Programma di visualizzazione, memorizzazione ed elaborazione del bene culturale ', $itemURI, ': ', normalize-space(schede/F/MT/FVC/FVCP))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Programma di visualizzazione, memorizzazione ed elaborazione del bene culturale ', $itemURI, ': ', normalize-space(schede/F/MT/FVC/FVCP))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Visualization, storage and processing program of cultural property ', $itemURI, ': ', normalize-space(schede/F/MT/FVC/FVCP))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Visualization, storage and processing program of cultural property ', $itemURI, ': ', normalize-space(schede/F/MT/FVC/FVCP))" />
					</l0:name>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/F/MT/FVC/FVCP)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/PhotoProgram'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/F/MT/FVC/FVCP)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/F/MT/FVC/FVCP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(schede/F/MT/FVC/FVCP)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- storage method and colour depth of photograph (F) as an individual -->
			<xsl:if test="schede/F/MT/FVC/FVCC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-storage-method-colour-depth')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Metodo di memorizzazione e profondità di colore del bene culturale ', $itemURI, ': ', normalize-space(schede/F/MT/FVC/FVCC))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Metodo di memorizzazione e profondità di colore del bene culturale ', $itemURI, ': ', normalize-space(schede/F/MT/FVC/FVCC))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Storage method and colour depth of cultural property ', $itemURI, ': ', normalize-space(schede/F/MT/FVC/FVCC))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Storage method and colour depth of cultural property ', $itemURI, ': ', normalize-space(schede/F/MT/FVC/FVCC))" />
					</l0:name>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/F/MT/FVC/FVCC)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/StorageMethodColourDepth'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/F/MT/FVC/FVCC)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/F/MT/FVC/FVCC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(schede/F/MT/FVC/FVCC)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- resolution of photograph (F) as an individual -->
			<xsl:if test="schede/F/MT/FVC/FVCU">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-resolution')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Risoluzione del bene culturale ', $itemURI, ': ', normalize-space(schede/F/MT/FVC/FVCU))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Risoluzione del bene culturale ', $itemURI, ': ', normalize-space(schede/F/MT/FVC/FVCU))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Resolution of cultural property ', $itemURI, ': ', normalize-space(schede/F/MT/FVC/FVCU))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Resolution of cultural property ', $itemURI, ': ', normalize-space(schede/F/MT/FVC/FVCU))" />
					</l0:name>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/F/MT/FVC/FVCU)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/Resolution'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/F/MT/FVC/FVCU)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/F/MT/FVC/FVCU)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(schede/F/MT/FVC/FVCU)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- pixel dimension of photograph (F) -->
			<xsl:for-each select="schede/F/MT/FVC/FVCM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-pixel-dimension-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Dimensioni in pixel ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Dimensioni in pixel ', position(), ' del bene culturale ', $itemURI, ': ', normalize-space(.))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Pixel dimension ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(.))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Pixel dimension ', position(), ' of cultural property ', $itemURI, ': ', normalize-space(.))" />
					</l0:name>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(.)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/PixelDimension'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(.)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(.)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(.)" />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
			<!-- mass storage of photograph (F) as an individual -->
			<xsl:if test="schede/F/MT/FVM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-mass-storage')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Memoria di massa del bene culturale ', $itemURI, ': ', normalize-space(schede/F/MT/FVM))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Memoria di massa del bene culturale ', $itemURI, ': ', normalize-space(schede/F/MT/FVM))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Mass storage of cultural property ', $itemURI, ': ', normalize-space(schede/F/MT/FVM))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Mass storage of cultural property ', $itemURI, ': ', normalize-space(schede/F/MT/FVM))" />
					</l0:name>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/F/MT/FVM)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/MassStorage'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/F/MT/FVM)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/F/MT/FVM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(schede/F/MT/FVM)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- colour of photograph (F) as an individual -->
			<xsl:if test="schede/F/MT/MTX">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-photo-colour')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Colore del bene culturale ', $itemURI, ': ', normalize-space(schede/F/MT/MTX))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Colore del bene culturale ', $itemURI, ': ', normalize-space(schede/F/MT/MTX))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Colour of cultural property ', $itemURI, ': ', normalize-space(schede/F/MT/MTX))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Colour of cultural property ', $itemURI, ': ', normalize-space(schede/F/MT/MTX))" />
					</l0:name>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/F/MT/MTX)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/PhotoColour'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/F/MT/MTX)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/F/MT/MTX)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(schede/F/MT/MTX)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- garment colour (VeAC) as an individual -->
			<xsl:if test="schede/VeAC/MT/MTC/MTCC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-garment-colour')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Colore del bene culturale ', $itemURI, ': ', normalize-space(schede/VeAC/MT/MTC/MTCC))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Colore del bene culturale ', $itemURI, ': ', normalize-space(schede/VeAC/MT/MTC/MTCC))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Colour of cultural property ', $itemURI, ': ', normalize-space(schede/VeAC/MT/MTC/MTCC))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Colour of cultural property ', $itemURI, ': ', normalize-space(schede/VeAC/MT/MTC/MTCC))" />
					</l0:name>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/VeAC/MT/MTC/MTCC)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/GarmentColour'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/VeAC/MT/MTC/MTCC)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/VeAC/MT/MTC/MTCC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(schede/VeAC/MT/MTC/MTCC)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- garment analysis (VeAC) as an individual -->
			<xsl:if test="schede/VeAC/MT/MTC/MTCA">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetailOccurrence/', $itemURI, '-garment-analysis')" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/TechnicalDetailOccurrence'" />
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Analisi del bene culturale ', $itemURI, ': ', normalize-space(schede/VeAC/MT/MTC/MTCA))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Analisi del bene culturale ', $itemURI, ': ', normalize-space(schede/VeAC/MT/MTC/MTCA))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Analysis of cultural property ', $itemURI, ': ', normalize-space(schede/VeAC/MT/MTC/MTCA))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Analysis of cultural property ', $itemURI, ': ', normalize-space(schede/VeAC/MT/MTC/MTCA))" />
					</l0:name>
					<arco-dd:satisfiesTechnicalDetail>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/VeAC/MT/MTC/MTCA)))" />
            			</xsl:attribute>
					</arco-dd:satisfiesTechnicalDetail>
					<arco-dd:usesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/arco/denotative-description/GarmentAnalysis'" />
            			</xsl:attribute>
					</arco-dd:usesTechnicalCharacteristic>
				</rdf:Description>
				<!-- Technical detail as an individual -->
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'TechnicalDetail/', arco-fn:urify(normalize-space(schede/VeAC/MT/MTC/MTCA)))" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/TechnicalDetail'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/VeAC/MT/MTC/MTCA)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(schede/VeAC/MT/MTC/MTCA)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Geometry of cultural property as an individual for GE (version 4.00) -->
			<xsl:for-each
				select="schede/*/GE | schede/*/MT/MTA/MTAR | schede/*/MT/MTA/MTAX / schede/*/MT/MTA/MTAM">
				<xsl:variable name="geometry-position" select="position()" />
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'Geometry/', $itemURI, '-geometry-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/italia/onto/CLV/Geometry'" />
            			</xsl:attribute>
					</rdf:type>
					<clvapit:isGeometryFor>
						<xsl:attribute name="rdf:resource">
				           <xsl:value-of
							select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
				        </xsl:attribute>
					</clvapit:isGeometryFor>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Geometry ', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Geometry ', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Georeferenziazione ', position(), ' del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Georeferenziazione ', position(), ' del bene culturale: ', $itemURI)" />
					</l0:name>
					<clvapit:hasGeometryType>
						<xsl:attribute name="rdf:resource">
                            <xsl:choose>
                                <xsl:when
							test="./GET='georeferenziazione puntuale'">
                                    <xsl:value-of
							select="'https://w3id.org/italia/onto/CLV/Point'" />
                                </xsl:when>
                                <xsl:when
							test="./GET='georeferenziazione areale'">
                                    <xsl:value-of
							select="'https://w3id.org/italia/onto/CLV/Polygon'" />
                                </xsl:when>
                                <xsl:when
							test="./GET='georeferenziazione lineare'">
                                    <xsl:value-of
							select="'https://w3id.org/italia/onto/CLV/Line'" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of
							select="concat($NS, 'GeometryType/', arco-fn:urify(normalize-space(./GET)))" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
					</clvapit:hasGeometryType>
					<xsl:for-each select="./GEC">
						<arco-location:hasCoordinates>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Coordinates/', $itemURI, '-geometry-', $geometry-position, '-coordinates', '-', position())" />
            				</xsl:attribute>
						</arco-location:hasCoordinates>
					</xsl:for-each>
					<xsl:if test="./GEP">
						<arco-location:spacialReferenceSystem>
							<xsl:value-of select="./GEP" />
						</arco-location:spacialReferenceSystem>
					</xsl:if>
					<xsl:if test="./GPT">
						<arco-location:hasGeometryTechnique>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GPT)))" />
            				</xsl:attribute>
						</arco-location:hasGeometryTechnique>
					</xsl:if>
					<xsl:if test="./GPM">
						<arco-location:hasGeometryMethod>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GPM)))" />
            				</xsl:attribute>
						</arco-location:hasGeometryMethod>
					</xsl:if>
					<xsl:if test="./GPB">
						<arco-location:hasBaseMap>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
            				</xsl:attribute>
						</arco-location:hasBaseMap>
					</xsl:if>
					
					<xsl:if test="./GEL">
						<arco-location:hasReferredLocationType>
							<xsl:attribute name="rdf:resource">
					                                <xsl:choose>
					                                    <xsl:when
								test="lower-case(normalize-space(./GEL))='luogo di provenienza/collocazione precedente' or lower-case(normalize-space(./GEL))='luogo di provenienza' or lower-case(normalize-space(./GEL))='provenienza' or lower-case(normalize-space(./GEL))='provenienza'">
					                                        <xsl:value-of
								select="'https://w3id.org/arco/location/LastLocation'" />
					                                    </xsl:when>
					                                    <xsl:when
								test="lower-case(normalize-space(./GEL))='luogo di produzione/realizzazione' or lower-case(normalize-space(./GEL))='luogo di esecuzione/fabbricazione'">
					                                        <xsl:value-of
								select="'https://w3id.org/arco/location/ProductionRealizationLocation'" />
					                                    </xsl:when>
					                                    <xsl:when
								test="lower-case(normalize-space(./GEL))='luogo di reperimento' or lower-case(normalize-space(./GEL))='luogo di reperimento' or lower-case(normalize-space(./GEL))='reperimento' or lower-case(normalize-space(./GEL))='reperimento'">
					                                        <xsl:value-of
								select="'https://w3id.org/arco/location/FindingLocation'" />
					                                    </xsl:when>
					                                    <xsl:when
								test="lower-case(normalize-space(./GEL))='luogo di deposito' or lower-case(normalize-space(./GEL))='luogo di deposito' or lower-case(normalize-space(./GEL))='deposito temporaneo' or lower-case(normalize-space(./GEL))='deposito temporaneo' or lower-case(normalize-space(./GEL))='deposito' or lower-case(normalize-space(./GEL))='deposito'">
					                                        <xsl:value-of
								select="'https://w3id.org/arco/location/StorageLocation'" />
					                                    </xsl:when>
					                                    <xsl:when
								test="lower-case(normalize-space(./GEL))='luogo di esposizione' or lower-case(normalize-space(./GEL))='luogo di esposizione' or lower-case(normalize-space(./GEL))='espositiva' or lower-case(normalize-space(./GEL))='espositiva' or lower-case(normalize-space(./GEL))='espositivo' or lower-case(normalize-space(./GEL))='espositivo' or lower-case(normalize-space(./GEL))='esposizione' or lower-case(normalize-space(./GEL))='esposizione'">
					                                        <xsl:value-of
								select="'https://w3id.org/arco/location/ExhibitionLocation'" />
					                                    </xsl:when>
					                                    <xsl:when
								test="lower-case(normalize-space(./GEL))='luogo di rilevamento' or lower-case(normalize-space(./GEL))='luogo di rilevamento' or lower-case(normalize-space(./GEL))='di rilevamento' or lower-case(normalize-space(./GEL))='di rilevamento' or lower-case(normalize-space(./GEL))='localizzazione di rilevamento' or lower-case(normalize-space(./GEL))='localizzazione di rilevamento'">
					                                        <xsl:value-of
								select="'https://w3id.org/arco/location/ObservationLocation'" />
					                                    </xsl:when>
					                                    <xsl:when
								test="lower-case(normalize-space(./GEL))='area rappresentata' or lower-case(normalize-space(./GEL))='area rappresentata'">
					                                        <xsl:value-of
								select="'https://w3id.org/arco/location/SubjectLocation'" />
					                                    </xsl:when>
					                                    <xsl:when
								test="lower-case(normalize-space(./GEL))='localizzazione fisica'">
					                                        <xsl:value-of
								select="'https://w3id.org/arco/location/CurrentPhysicalLocation'" />
					                                    </xsl:when>
					                                    <xsl:when test="./GEL">
					                                        <xsl:variable
								name="GEL" select="normalize-space(./GEL)" />
					                                        <xsl:value-of
								select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./GEL)))" />
					                                    </xsl:when>
					                                    <xsl:when test="./GEL">
					                                        <xsl:variable
								name="GEL" select="normalize-space(./GEL)" />
					                                        <xsl:value-of
								select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./GEL)))" />
					                                    </xsl:when>
					                                    <xsl:when test="../../F/LR">
					                                    	<xsl:value-of
								select="'https://w3id.org/arco/location/ShotLocation'" />
					                                    </xsl:when>
					                                </xsl:choose>
					                            </xsl:attribute>
						</arco-location:hasReferredLocationType>
					
					</xsl:if>
					
				</rdf:Description>
				<!-- geometry type for GE as an individual -->
				<xsl:if test="./GET">
					<xsl:choose>
						<xsl:when test="./GET='georeferenziazione puntuale'" />
						<xsl:when test="./GET='georeferenziazione areale'" />
						<xsl:when test="./GET='georeferenziazione lineare'" />
						<xsl:otherwise>
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'GeometryType/', arco-fn:urify(normalize-space(./GET)))" />
                                </xsl:attribute>
								<rdf:type rdf:resource="https://w3id.org/italia/onto/CLV/GeometryType" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(./GET)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./GET)" />
								</l0:name>
							</rdf:Description>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<!-- geometry coordinates for GE as an individual -->
				<xsl:for-each select="./GEC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'Coordinates/', $itemURI, '-geometry-', $geometry-position, '-coordinates', '-', position())" />
            		</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/location/Coordinates" />
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
						</l0:name>
						<xsl:if test="./GECX">
							<arco-location:long>
								<xsl:value-of select="./GECX" />
							</arco-location:long>
						</xsl:if>
						<xsl:if test="./GECY">
							<arco-location:lat>
								<xsl:value-of select="./GECY" />
							</arco-location:lat>
						</xsl:if>
						<xsl:if
							test="./GECZ | ../../MT/MTA/MTAR | ../../MT/MTA/MTAX / ../../MT/MTA/MTAM">
							<arco-location:hasAltitude>
								<xsl:attribute name="rdf:resource">
            					<xsl:value-of
									select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
            				</xsl:attribute>
							</arco-location:hasAltitude>
						</xsl:if>
					</rdf:Description>
				</xsl:for-each>
				<!-- geometry technique for GE as an individual -->
				<xsl:if test="./GPT">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GPT)))" />
            		</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/location/GeometryTechnique" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./GPT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./GPT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- geometry method for GE as an individual -->
				<xsl:if test="./GPM">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GPM)))" />
            		</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/location/GeometryMethod" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./GPM)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./GPM)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- geometry base map for GE as an individual -->
				<xsl:if test="./GPB">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
            		</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/location/BaseMap" />
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Base cartografica del bene culturale: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Base cartografica del bene culturale: ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Base map of cultural property: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Base map of cultural property: ', $itemURI)" />
						</l0:name>
						<xsl:if test="./GPB/GPBB">
							<arco-core:description>
								<xsl:value-of select="./GPB/GPBB" />
							</arco-core:description>
						</xsl:if>
						<xsl:if test="./GPB/GPBT">
							<tiapit:date>
								<xsl:value-of select="./GPB/GPBT" />
							</tiapit:date>
						</xsl:if>
						<xsl:if test="./GPB/GPBU">
							<smapit:url>
								<xsl:value-of select="./GPB/GPBU" />
							</smapit:url>
						</xsl:if>
						<xsl:if test="./GPB/GPBO">
							<arco-core:note>
								<xsl:value-of select="./GPB/GPBO" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
				<!-- altitude for GE as an individual -->
				<xsl:if
					test="./GEC/GECZ | ../MT/MTA/MTAR | ../MT/MTA/MTAX / ../MT/MTA/MTAM">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
            		</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/location/Altitude" />
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Altitudine del bene culturale: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Altitudine del bene culturale: ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Altitude of cultural property: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Altitude of cultural property: ', $itemURI)" />
						</l0:name>
						<xsl:if test="./GEC/GECZ">
							<arco-location:alt>
								<xsl:value-of select="./GEC/GECZ" />
							</arco-location:alt>
						</xsl:if>
						<xsl:if test="../MT/MTA/MTAR">
							<arco-location:relativeAlt>
								<xsl:value-of select="../MT/MTA/MTAR" />
							</arco-location:relativeAlt>
						</xsl:if>
						<xsl:if test="../MT/MTA/MTAX">
							<arco-location:maxAlt>
								<xsl:value-of select="../MT/MTA/MTAX" />
							</arco-location:maxAlt>
						</xsl:if>
						<xsl:if test="../MT/MTA/MTAM">
							<arco-location:minAlt>
								<xsl:value-of select="../MT/MTA/MTAM" />
							</arco-location:minAlt>
						</xsl:if>
						<xsl:if test="../MT/MTA/MTAS">
							<arco-core:note>
								<xsl:value-of select="../MT/MTA/MTAS" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Geometry of cultural property as an individual for GP (Point) -->
			<xsl:for-each select="schede/*/GP">
				<xsl:variable name="geometry-position" select="position()" />
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of
						select="concat($NS, 'Geometry/', $itemURI, '-geometry-point-', position())" />
            		</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of
							select="'https://w3id.org/italia/onto/CLV/Geometry'" />
            			</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Geometry (point) ', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Geometry (point) ', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Georeferenziazione (puntuale) ', position(), ' del bene culturale: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Georeferenziazione (puntuale) ', position(), ' del bene culturale: ', $itemURI)" />
					</l0:name>
					<clvapit:isGeometryFor>
						<xsl:attribute name="rdf:resource">
				           <xsl:value-of
							select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
				        </xsl:attribute>
					</clvapit:isGeometryFor>
					<clvapit:hasGeometryType>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/CLV/Point'" />
                        </xsl:attribute>
					</clvapit:hasGeometryType>
					<xsl:for-each select="./GPD/GPDP">
						<arco-location:hasCoordinates>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'Coordinates/', $itemURI, '-geometry-point-', $geometry-position, '-coordinates', '-', position())" />
            				</xsl:attribute>
						</arco-location:hasCoordinates>
					</xsl:for-each>
					<xsl:if test="./GPP">
						<arco-location:spacialReferenceSystem>
							<xsl:value-of select="./GPP" />
						</arco-location:spacialReferenceSystem>
					</xsl:if>
					<xsl:if test="./GPC/GPCT">
						<arco-location:pointType>
							<xsl:value-of select="./GPP" />
						</arco-location:pointType>
					</xsl:if>
					<xsl:if test="./GPT">
						<arco-location:hasGeometryTechnique>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GPT)))" />
            				</xsl:attribute>
						</arco-location:hasGeometryTechnique>
					</xsl:if>
					<xsl:if test="./GPM">
						<arco-location:hasGeometryMethod>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GPM)))" />
            				</xsl:attribute>
						</arco-location:hasGeometryMethod>
					</xsl:if>
					<xsl:if test="./GPB">
						<arco-location:hasBaseMap>
							<xsl:attribute name="rdf:resource">
            					<xsl:value-of
								select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
            				</xsl:attribute>
						</arco-location:hasBaseMap>
					</xsl:if>
				</rdf:Description>
				<!-- geometry coordinates for GP as an individual -->
				<xsl:for-each select="./GPD/GPDP">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of
							select="concat($NS, 'Coordinates/', $itemURI, '-geometry-point-', $geometry-position, '-coordinates', '-', position())" />
	            		</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/location/Coordinates" />
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
						</l0:name>
						<xsl:if test="./GPDPX">
							<arco-location:long>
								<xsl:value-of select="./GPDPX" />
							</arco-location:long>
						</xsl:if>
						<xsl:if test="./GPDPY">
							<arco-location:lat>
								<xsl:value-of select="./GPDPY" />
							</arco-location:lat>
						</xsl:if>
						<xsl:if test="../../GPC/GPCL | ../../GPC/GPCI | ../../GPC/GPCS">
							<arco-location:hasAltitude>
								<xsl:attribute name="rdf:resource">
	            					<xsl:value-of
									select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
	            				</xsl:attribute>
							</arco-location:hasAltitude>
						</xsl:if>
					</rdf:Description>
				</xsl:for-each>
				<!-- geometry technique for GP as an individual -->
				<xsl:if test="./GPT">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of
							select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GPT)))" />
	            		</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/location/GeometryTechnique" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./GPT)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./GPT)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- geometry method for GP as an individual -->
				<xsl:if test="./GPM">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of
							select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GPM)))" />
	            		</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/location/GeometryMethod" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./GPM)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./GPM)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- geometry base map for GP as an individual -->
				<xsl:if test="./GPB">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	            			<xsl:value-of
							select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
	            		</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/location/BaseMap" />
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Base cartografica del bene culturale: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Base cartografica del bene culturale: ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Base map of cultural property: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Base map of cultural property: ', $itemURI)" />
						</l0:name>
						<xsl:if test="./GPB/GPBB">
							<arco-core:description>
								<xsl:value-of select="./GPB/GPBB" />
							</arco-core:description>
						</xsl:if>
						<xsl:if test="./GPB/GPBT">
							<tiapit:date>
								<xsl:value-of select="./GPB/GPBT" />
							</tiapit:date>
						</xsl:if>
						<xsl:if test="./GPB/GPBO">
							<arco-core:note>
								<xsl:value-of select="./GPB/GPBO" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
				<!-- altitude for GP as an individual -->
				<xsl:if test="./GPC/GPCL | ./GPC/GPCI | ./GPC/GPCS">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
            		</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/location/Altitude" />
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Altitudine del bene culturale: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Altitudine del bene culturale: ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Altitude of cultural property: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Altitude of cultural property: ', $itemURI)" />
						</l0:name>
						<xsl:if test="./GPC/GPCL">
							<arco-location:alt>
								<xsl:value-of select="./GPC/GPCL" />
							</arco-location:alt>
						</xsl:if>
						<xsl:if test="./GPC/GPCS">
							<arco-location:maxAlt>
								<xsl:value-of select="./GPC/GPCS" />
							</arco-location:maxAlt>
						</xsl:if>
						<xsl:if test="./GPC/GPCI">
							<arco-location:minAlt>
								<xsl:value-of select="./GPC/GPCI" />
							</arco-location:minAlt>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- Geometry of cultural property as an individual for GL (Line) -->
			<xsl:if test="schede/*/GL">
				<xsl:for-each select="schede/*/GL">
					<xsl:variable name="geometry-position" select="position()" />
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'Geometry/', $itemURI, '-geometry-line-', position())" />
            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            				<xsl:value-of
								select="'https://w3id.org/italia/onto/CLV/Geometry'" />
            			</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Geometry (line) ', position(), ' of cultural property: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Geometry (line) ', position(), ' of cultural property: ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Georeferenziazione (lineare) ', position(), ' del bene culturale: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Georeferenziazione (lineare) ', position(), ' del bene culturale: ', $itemURI)" />
						</l0:name>
						<clvapit:isGeometryFor>
							<xsl:attribute name="rdf:resource">
				           <xsl:value-of
								select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
				        </xsl:attribute>
						</clvapit:isGeometryFor>
						<clvapit:hasGeometryType>
							<xsl:attribute name="rdf:resource">
                            <xsl:value-of
								select="'https://w3id.org/italia/onto/CLV/Line'" />
                        </xsl:attribute>
						</clvapit:hasGeometryType>
						<xsl:for-each select="./GLD/GLDP">
							<arco-location:hasCoordinates>
								<xsl:attribute name="rdf:resource">
            					<xsl:value-of
									select="concat($NS, 'Coordinates/', $itemURI, '-geometry-line-', $geometry-position, '-coordinates', '-', position())" />
            				</xsl:attribute>
							</arco-location:hasCoordinates>
						</xsl:for-each>
						<xsl:if test="./GLP">
							<arco-location:spacialReferenceSystem>
								<xsl:value-of select="./GLP" />
							</arco-location:spacialReferenceSystem>
						</xsl:if>
						<xsl:if test="./GLT">
							<arco-location:hasGeometryTechnique>
								<xsl:attribute name="rdf:resource">
            					<xsl:value-of
									select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GLT)))" />
            				</xsl:attribute>
							</arco-location:hasGeometryTechnique>
						</xsl:if>
						<xsl:if test="./GLM">
							<arco-location:hasGeometryMethod>
								<xsl:attribute name="rdf:resource">
            					<xsl:value-of
									select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GLM)))" />
            				</xsl:attribute>
							</arco-location:hasGeometryMethod>
						</xsl:if>
						<xsl:if test="./GLB">
							<arco-location:hasBaseMap>
								<xsl:attribute name="rdf:resource">
            					<xsl:value-of
									select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
            				</xsl:attribute>
							</arco-location:hasBaseMap>
						</xsl:if>
					</rdf:Description>
					<!-- geometry coordinates for GL as an individual -->
					<xsl:for-each select="./GLD/GLDP">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            			<xsl:value-of
								select="concat($NS, 'Coordinates/', $itemURI, '-geometry-line-', $geometry-position, '-coordinates', '-', position())" />
	            		</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/location/Coordinates" />
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
							</l0:name>
							<xsl:if test="./GLDPX">
								<arco-location:long>
									<xsl:value-of select="./GLDPX" />
								</arco-location:long>
							</xsl:if>
							<xsl:if test="./GLDPY">
								<arco-location:lat>
									<xsl:value-of select="./GLDPY" />
								</arco-location:lat>
							</xsl:if>
							<xsl:if test="../../GLQ/GLQI | ../../GLQ/GLQS">
								<arco-location:hasAltitude>
									<xsl:attribute name="rdf:resource">
	            					<xsl:value-of
										select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
	            				</xsl:attribute>
								</arco-location:hasAltitude>
							</xsl:if>
						</rdf:Description>
					</xsl:for-each>
					<!-- geometry technique for GL as an individual -->
					<xsl:if test="./GLT">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            			<xsl:value-of
								select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GLT)))" />
	            		</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/location/GeometryTechnique" />
							<rdfs:label>
								<xsl:value-of select="normalize-space(./GLT)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./GLT)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- geometry method for GL as an individual -->
					<xsl:if test="./GLM">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            			<xsl:value-of
								select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GLM)))" />
	            		</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/location/GeometryMethod" />
							<rdfs:label>
								<xsl:value-of select="normalize-space(./GLM)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./GLM)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- geometry base map for GL as an individual -->
					<xsl:if test="./GLB">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            			<xsl:value-of
								select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
	            		</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/location/BaseMap" />
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Base cartografica del bene culturale: ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Base cartografica del bene culturale: ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Base map of cultural property: ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Base map of cultural property: ', $itemURI)" />
							</l0:name>
							<xsl:if test="./GLB/GLBB">
								<arco-core:description>
									<xsl:value-of select="./GLB/GLBB" />
								</arco-core:description>
							</xsl:if>
							<xsl:if test="./GLB/GLBT">
								<tiapit:date>
									<xsl:value-of select="./GLB/GLBT" />
								</tiapit:date>
							</xsl:if>
							<xsl:if test="./GLB/GLBO">
								<arco-core:note>
									<xsl:value-of select="./GPB/GPBO" />
								</arco-core:note>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
					<!-- altitude for GL as an individual -->
					<xsl:if test="./GLQ/GLQI | ./GLQ/GLQS">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            			<xsl:value-of
								select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
	            		</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/location/Altitude" />
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Altitudine del bene culturale: ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Altitudine del bene culturale: ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Altitude of cultural property: ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Altitude of cultural property: ', $itemURI)" />
							</l0:name>
							<xsl:if test="./GLQ/GLQS">
								<arco-location:maxAlt>
									<xsl:value-of select="./GLQ/GLQS" />
								</arco-location:maxAlt>
							</xsl:if>
							<xsl:if test="./GLQ/GLQI">
								<arco-location:minAlt>
									<xsl:value-of select="./GLQ/GLQI" />
								</arco-location:minAlt>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- Geometry of cultural property as an individual for GA (Area) -->
			<xsl:if test="schede/*/GA">
				<xsl:variable name="geometry-position" select="position()" />
				<xsl:for-each select="schede/*/GA">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
            			<xsl:value-of
							select="concat($NS, 'Geometry/', $itemURI, '-geometry-polygon-', position())" />
            		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
            				<xsl:value-of
								select="'https://w3id.org/italia/onto/CLV/Geometry'" />
            			</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Geometry (area) ', position(), ' of cultural property: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Geometry (area) ', position(), ' of cultural property: ', $itemURI)" />
						</l0:name>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Georeferenziazione (areale) ', position(), ' del bene culturale: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Georeferenziazione (areale) ', position(), ' del bene culturale: ', $itemURI)" />
						</l0:name>
						<clvapit:isGeometryFor>
							<xsl:attribute name="rdf:resource">
				           <xsl:value-of
								select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
				        </xsl:attribute>
						</clvapit:isGeometryFor>
						<clvapit:hasGeometryType>
							<xsl:attribute name="rdf:resource">
                            <xsl:value-of
								select="'https://w3id.org/italia/onto/CLV/Polygon'" />
                        </xsl:attribute>
						</clvapit:hasGeometryType>
						<xsl:for-each select="./GAD/GADP">
							<arco-location:hasCoordinates>
								<xsl:attribute name="rdf:resource">
            					<xsl:value-of
									select="concat($NS, 'Coordinates/', $itemURI, '-geometry-polygon-', $geometry-position, '-coordinates', '-', position())" />
            				</xsl:attribute>
							</arco-location:hasCoordinates>
						</xsl:for-each>
						<xsl:if test="./GAP">
							<arco-location:spacialReferenceSystem>
								<xsl:value-of select="./GAP" />
							</arco-location:spacialReferenceSystem>
						</xsl:if>
						<xsl:if test="./GAT">
							<arco-location:hasGeometryTechnique>
								<xsl:attribute name="rdf:resource">
            					<xsl:value-of
									select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GAT)))" />
            				</xsl:attribute>
							</arco-location:hasGeometryTechnique>
						</xsl:if>
						<xsl:if test="./GAM">
							<arco-location:hasGeometryMethod>
								<xsl:attribute name="rdf:resource">
            					<xsl:value-of
									select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GAM)))" />
            				</xsl:attribute>
							</arco-location:hasGeometryMethod>
						</xsl:if>
						<xsl:if test="./GAB">
							<arco-location:hasBaseMap>
								<xsl:attribute name="rdf:resource">
            					<xsl:value-of
									select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
            				</xsl:attribute>
							</arco-location:hasBaseMap>
						</xsl:if>
					</rdf:Description>
					<!-- geometry coordinates for GL as an individual -->
					<xsl:for-each select="./GAD/GADP">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            			<xsl:value-of
								select="concat($NS, 'Coordinates/', $itemURI, '-geometry-polygon-', $geometry-position, '-coordinates', '-', position())" />
	            		</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/location/Coordinates" />
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
							</l0:name>
							<xsl:if test="./GADPX">
								<arco-location:long>
									<xsl:value-of select="./GADPX" />
								</arco-location:long>
							</xsl:if>
							<xsl:if test="./GADPY">
								<arco-location:lat>
									<xsl:value-of select="./GADPY" />
								</arco-location:lat>
							</xsl:if>
							<xsl:if test="../../GAQ/GAQI | ../../GAQ/GAQS">
								<arco-location:hasAltitude>
									<xsl:attribute name="rdf:resource">
	            					<xsl:value-of
										select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
	            				</xsl:attribute>
								</arco-location:hasAltitude>
							</xsl:if>
						</rdf:Description>
					</xsl:for-each>
					<!-- geometry technique for GA as an individual -->
					<xsl:if test="./GAT">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            			<xsl:value-of
								select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GAT)))" />
	            		</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/location/GeometryTechnique" />
							<rdfs:label>
								<xsl:value-of select="normalize-space(./GAT)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./GAT)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- geometry method for GA as an individual -->
					<xsl:if test="./GAM">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            			<xsl:value-of
								select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GAM)))" />
	            		</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/location/GeometryMethod" />
							<rdfs:label>
								<xsl:value-of select="normalize-space(./GAM)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./GAM)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<!-- geometry base map for GA as an individual -->
					<xsl:if test="./GAB">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            			<xsl:value-of
								select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
	            		</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/location/BaseMap" />
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Base cartografica del bene culturale: ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Base cartografica del bene culturale: ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Base map of cultural property: ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Base map of cultural property: ', $itemURI)" />
							</l0:name>
							<xsl:if test="./GAB/GABB">
								<arco-core:description>
									<xsl:value-of select="./GAB/GABB" />
								</arco-core:description>
							</xsl:if>
							<xsl:if test="./GAB/GABT">
								<tiapit:date>
									<xsl:value-of select="./GAB/GABT" />
								</tiapit:date>
							</xsl:if>
							<xsl:if test="./GAB/GABO">
								<arco-core:note>
									<xsl:value-of select="./GAB/GABO" />
								</arco-core:note>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
					<!-- altitude for GA as an individual -->
					<xsl:if test="./GAQ/GAQI | ./GAQ/GAQS">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
	            			<xsl:value-of
								select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
	            		</xsl:attribute>
							<rdf:type rdf:resource="https://w3id.org/arco/location/Altitude" />
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Altitudine del bene culturale: ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Altitudine del bene culturale: ', $itemURI)" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Altitude of cultural property: ', $itemURI)" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Altitude of cultural property: ', $itemURI)" />
							</l0:name>
							<xsl:if test="./GAQ/GAQS">
								<arco-location:maxAlt>
									<xsl:value-of select="./GLQ/GLQS" />
								</arco-location:maxAlt>
							</xsl:if>
							<xsl:if test="./GAQ/GAQI">
								<arco-location:minAlt>
									<xsl:value-of select="./GLQ/GLQI" />
								</arco-location:minAlt>
							</xsl:if>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- Name in time -->
			<xsl:if test="schede/*/OG/OGD or schede/*/OG/OGT/OGTN">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                    <xsl:choose>
                        <xsl:when test="schede/*/OG/OGD/OGDN">
                        	<xsl:value-of
						select="concat('https://w3id.org/arco/resource/DesignationInTime/', arco-fn:urify(normalize-space(schede/*/OG/OGD/OGDN)))" />
                        </xsl:when>
                        <xsl:when test="schede/*/OG/OGT/OGTN">
                        	<xsl:value-of
						select="concat('https://w3id.org/arco/resource/DesignationInTime/', arco-fn:urify(normalize-space(schede/*/OG/OGT/OGTN)))" />
                        </xsl:when>
                    </xsl:choose>
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/denotative-description/DesignationInTime'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:choose>
							<xsl:when test="schede/*/OG/OGD/OGDN">
								<xsl:value-of select="normalize-space(schede/*/OG/OGD/OGDN)" />
							</xsl:when>
							<xsl:when test="schede/*/OG/OGT/OGTN">
								<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTN)" />
							</xsl:when>
						</xsl:choose>
					</rdfs:label>
					<l0:name>
						<xsl:choose>
							<xsl:when test="schede/*/OG/OGD/OGDN">
								<xsl:value-of select="normalize-space(schede/*/OG/OGD/OGDN)" />
							</xsl:when>
							<xsl:when test="schede/*/OG/OGT/OGTN">
								<xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTN)" />
							</xsl:when>
						</xsl:choose>
					</l0:name>
					<xsl:if test="schede/*/OG/OGD/OGDR">
						<tiapit:date>
							<xsl:value-of select="schede/*/OG/OGD/OGDR" />
						</tiapit:date>
					</xsl:if>
					<xsl:if test="schede/*/OG/OGD/OGDS">
						<arco-core:note>
							<xsl:value-of select="schede/*/OG/OGD/OGDS" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="schede/*/OG/OGD/OGDT">
						<arco-dd:hasDesignationType>
							<xsl:attribute name="rdf:resource">
                        		<xsl:value-of
								select="concat('https://w3id.org/arco/resource/DesignationType/', arco-fn:urify(normalize-space(schede/*/OG/OGD/OGDT)))" />
                        	</xsl:attribute>
						</arco-dd:hasDesignationType>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="schede/*/OG/OGD/OGDT">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        	<xsl:value-of
						select="concat('https://w3id.org/arco/resource/DesignationType/', arco-fn:urify(normalize-space(schede/*/OG/OGD/OGDT)))" />
                       </xsl:attribute>
					<rdf:type>
						<xsl:value-of select="'https://w3id.org/arco/denotative-description/DesignationType'" />
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/OG/OGD/OGDT)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(schede/*/OG/OGD/OGDT)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Name in time - Time interval - rules for previous model <xsl:if test="schede/*/OG/OGD/OGDR"> 
				<rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of select="concat('https://w3id.org/arco/resource/TimeInterval/', 
				arco-fn:urify(schede/*/OG/OGD/OGDR))" /> </xsl:attribute> <rdf:type> <xsl:attribute 
				name="rdf:resource"> <xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" 
				/> </xsl:attribute> </rdf:type> <rdfs:label> <xsl:value-of select="normalize-space(schede/*/OG/OGD/OGDR)" 
				/> </rdfs:label> <tiapit:startTime> <xsl:value-of select="schede/*/OG/OGD/OGDR" 
				/> </tiapit:startTime> </rdf:Description> </xsl:if> -->

			<!-- We add the scope of protection as an individual. The scope of protection 
				is associated with a Cultural Property by the property arco-dd:hasMibactScopeOfProtection. 
				ALERT: this part has been removed in version 0.2 as the Mibact Scope of Protection 
				has been defined within the ontologies. -->
			<!-- xsl:if test="schede/*/OG/AMB"> <rdf:Description> <xsl:attribute name="rdf:about"> 
				<xsl:value-of select="concat('https://w3id.org/arco/resource/MibactScopeOfProtection/', 
				arco-fn:urify(normalize-space(schede/*/OG/AMB)))" /> </xsl:attribute> <rdf:type> 
				<xsl:attribute name="rdf:resource"> <xsl:value-of select="'https://w3id.org/arco/cpdescription/MibactScopeOfProtection'" 
				/> </xsl:attribute> </rdf:type> <rdfs:label> <xsl:value-of select="normalize-space(schede/*/OG/AMB)" 
				/> </rdfs:label> </rdf:Description> </xsl:if -->
			<!-- We add the category as an individual. The category is associated 
				with a Cultural Property by the property arco-dd:hasCategory. -->
			<xsl:if test="schede/*/OG/CTG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat('https://w3id.org/arco/resource/CulturalPropertyCategory/', arco-fn:urify(normalize-space(schede/*/OG/CTG)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/core/CulturalPropertyCategory'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(schede/*/OG/CTG)" />
					</rdfs:label>
				</rdf:Description>
			</xsl:if>
			<!-- fruition (VeAC) as an individual -->
			<xsl:if test="schede/*/AU/FRU">
				<xsl:for-each select="schede/*/AU/FRU">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
	                            <xsl:value-of
							select="concat($NS, 'Fruition/', $itemURI, '-', position())" />
	                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
	                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/Fruition'" />
	                            </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Fruizione ', position(), ' del bene: ', $itemURI)" />
						</rdfs:label>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Fruition ', position(), ' of cultural property: ', $itemURI)" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Fruizione ', position(), ' del bene: ', $itemURI)" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Fruition ', position(), ' of cultural property: ', $itemURI)" />
						</l0:name>
						<xsl:if test="./FRUD">
							<tiapit:date>
								<xsl:value-of select="./FRUD" />
							</tiapit:date>
						</xsl:if>
						<xsl:if test="./FRUN">
							<arco-cd:hasUser>
								<xsl:attribute name="rdf:resource">
	                        			<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FRUN)))" />
	                        		</xsl:attribute>
							</arco-cd:hasUser>
						</xsl:if>
						<xsl:if test="./FRUC">
							<arco-cd:hasCircumstance>
								<xsl:attribute name="rdf:resource">
	                        			<xsl:value-of
									select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./FRUC)))" />
	                        		</xsl:attribute>
							</arco-cd:hasCircumstance>
						</xsl:if>
						<xsl:if test="./FRUF">
							<arco-cd:hasSource>
								<xsl:attribute name="rdf:resource">
	                        			<xsl:value-of
									select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./FRUF)))" />
	                        		</xsl:attribute>
							</arco-cd:hasSource>
						</xsl:if>
					</rdf:Description>
					<xsl:if test="./FRUN">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                				<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FRUN)))" />
                			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                            		<xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
                        		</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./FRUN)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./FRUN)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="./FRUC">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                				<xsl:value-of
								select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./FRUC)))" />
                			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                            		<xsl:value-of
									select="'https://w3id.org/arco/context-description/Circumstance'" />
                        		</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./FRUC)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./FRUC)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
					<xsl:if test="./FRUF">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                				<xsl:value-of
								select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./FRUF)))" />
                			</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                            		<xsl:value-of
									select="'https://w3id.org/arco/context-description/Source'" />
                        		</xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./FRUF)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./FRUF)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- Alternative Identifier as an individual (AC/ACC) -->
			<xsl:if test="schede/*/AC/ACC">
				<xsl:for-each select="schede/*/AC/ACC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                        		<xsl:value-of
							select="concat($NS, 'AlternativeIdentifier/', $itemURI, '-', position())" />
                    		</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                            		<xsl:value-of
								select="'https://w3id.org/arco/catalogue/AlternativeIdentifier'" />
                        		</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:choose>
								<xsl:when test="./*">
									<xsl:value-of
										select="concat('Codice alternativo ', normalize-space(./ACCC), ' del bene culturale: ', $itemURI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Codice alternativo ', normalize-space(.), ' del bene culturale: ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:choose>
								<xsl:when test="./*">
									<xsl:value-of
										select="concat('Codice alternativo ', normalize-space(./ACCC), ' del bene culturale: ', $itemURI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Codice alternativo ', normalize-space(.), ' del bene culturale: ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:choose>
								<xsl:when test="./*">
									<xsl:value-of
										select="concat('Alternative identifier ', normalize-space(./ACCC), ' of cultural property: ', $itemURI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Alternative identifier ', normalize-space(.), ' of cultural property: ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:choose>
								<xsl:when test="./*">
									<xsl:value-of
										select="concat('Alternative identifier ', normalize-space(./ACCC), ' of cultural property: ', $itemURI)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Alternative identifier ', normalize-space(.), ' of cultural property: ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
						<xsl:if test="./ACCS">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./ACCS)" />
							</arco-core:note>
						</xsl:if>
						<xsl:if test="./ACCP">
							<arco-catalogue:referenceProject>
								<xsl:value-of select="normalize-space(./ACCP)" />
							</arco-catalogue:referenceProject>
						</xsl:if>
						<xsl:if test="./ACCW">
							<smapit:URL>
								<xsl:value-of select="normalize-space(./ACCW)" />
							</smapit:URL>
						</xsl:if>
						<xsl:if test="./ACCE">
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
                            			<xsl:value-of
									select="concat($NS, 'AgentRole/', $itemURI, '-catalogue-record-responsible')" />
                        			</xsl:attribute>
							</arco-core:hasAgentRole>
						</xsl:if>
					</rdf:Description>
					<!-- agent role for catalogue record responsible for alternative identifier 
						as an individual -->
					<xsl:if test="./ACCE">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                        		<xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-catalogue-record-responsible')" />
		                    		</xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
									select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Ente responsabile della scheda del bene ', $itemURI, ': ', normalize-space(./ACCE))" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Responsible agency for catalogue record of cultural property ', $itemURI, ': ', normalize-space(./ACCE))" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of
									select="concat('Ente responsabile della scheda del bene ', $itemURI, ': ', normalize-space(./ACCE))" />
							</l0:name>
							<l0:name xml:lang="en">
								<xsl:value-of
									select="concat('Responsible agency for catalogue record of cultural property ', $itemURI, ': ', normalize-space(./ACCE))" />
							</l0:name>
							<arco-core:hasRole>
								<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
									select="concat($NS, 'Role/CatalogueRecordResponsible')" />
				                        </xsl:attribute>
							</arco-core:hasRole>
							<arco-core:hasAgent>
								<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ACCE)))" />
				                        </xsl:attribute>
							</arco-core:hasAgent>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
				                        <xsl:value-of
								select="concat($NS, 'Role/CatalogueRecordResponsible')" />
				                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
									select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="'Ente responsabile della scheda catalografica'" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="'Responsible agency for catalogue record'" />
							</rdfs:label>
							<arco-core:isRoleOf>
								<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
									select="concat($NS, 'AgentRole/', $itemURI, '-catalogue-record-responsible')" />
				                        </xsl:attribute>
							</arco-core:isRoleOf>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
				                        <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ACCE)))" />
				                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./ACCE)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./ACCE)" />
							</l0:name>
							<arco-core:isAgentOf>
								<xsl:attribute name="rdf:resource">
				                            <xsl:value-of
									select="concat($NS, 'AgentRole/', $itemURI, '-catalogue-record-responsible')" />
				                        </xsl:attribute>
							</arco-core:isAgentOf>
						</rdf:Description>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
			<!-- We add the cultural scope attribution as an individual. -->
			<xsl:for-each select="schede/*/AU/ATB">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'CulturalScopeAttribution/', $itemURI, '-cultural-scope-attribution-', position())" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/context-description/CulturalScopeAttribution'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Attribuzione di ambito culturale del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Attribuzione di ambito culturale del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Cultural scope attribution of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Cultural scope attribution of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if
						test="./ATBD and not(lower-case(normalize-space(./ATBD))='nr' or lower-case(normalize-space(./ATBD))='n.r.' or lower-case(normalize-space(./ATBD))='nr (recupero pregresso)')">
						<arco-cd:hasCulturalScope>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'CulturalScope/', arco-fn:urify(normalize-space(./ATBD)))" />
                            </xsl:attribute>
						</arco-cd:hasCulturalScope>
					</xsl:if>
					<xsl:if test="./ATBR">
						<arco-cd:hasInterventionRole>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Role/', $itemURI, '-', arco-fn:urify(normalize-space(./ATBR)))" />
                            </xsl:attribute>
						</arco-cd:hasInterventionRole>
					</xsl:if>
					<xsl:if test="./ATBS">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./ATBS)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if
						test="./ATBM and not(lower-case(normalize-space(./ATBM))='nr' or lower-case(normalize-space(./ATBM))='nr (recupero pregresso)' or lower-case(normalize-space(./ATBM))='n.r.')">
						<arco-cd:hasSource>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./ATBM)))" />
                            </xsl:attribute>
						</arco-cd:hasSource>
					</xsl:if>
				</rdf:Description>
				<!-- We add the cultural scope attribution source as an individual. -->
				<xsl:if
					test="./ATBM and not(lower-case(normalize-space(./ATBM))='nr' or lower-case(normalize-space(./ATBM))='nr (recupero pregresso)' or lower-case(normalize-space(./ATBM))='n.r.')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./ATBM)))" />
                        </xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/context-description/Source" />
						<rdfs:label>
							<xsl:value-of select="normalize-space(./ATBM)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./ATBM)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- We add the cultural scope attribution role as an individual. -->
				<xsl:if test="./ATBR">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Role/', $itemURI, '-', arco-fn:urify(normalize-space(./ATBR)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./ATBR)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./ATBR)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- We add the cultural scope as an individual. -->
				<xsl:if
					test="./ATBD and not(lower-case(normalize-space(./ATBD))='nr' or lower-case(normalize-space(./ATBD))='n.r.' or lower-case(normalize-space(./ATBD))='nr (recupero pregresso)')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'CulturalScope/', arco-fn:urify(normalize-space(./ATBD)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/CulturalScope'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./ATBD)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./ATBD)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="schede/*/AU/AUT | schede/F/AU/AUF">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/context-description/PreferredAuthorshipAttribution'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Attribuzione di autore preferita, maggiormente accreditata o convincente del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Attribuzione di autore preferita, maggiormente accreditata o convincente del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Preferred authorship attribution of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Preferred authorship attribution of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="../AUF/AUFK">
						<arco-core:specifications>
							<xsl:value-of select="../AUF/AUFK" />
						</arco-core:specifications>
					</xsl:if>
					<xsl:if test="./AUTN or ../AUF/AUFN or ../AUF/AUFB">
						<arco-cd:hasAttributedAuthor>
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
	                                    <xsl:value-of select="$author" />
	                                </xsl:otherwise>
	                            </xsl:choose>
                            </xsl:attribute>
						</arco-cd:hasAttributedAuthor>
					</xsl:if>
					<xsl:if
						test="./AUTR or ../AUF/AUFR and not(lower-case(normalize-space(./AUTR))='nr' or lower-case(normalize-space(./AUTR))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTR))='n.r.' or lower-case(normalize-space(./AUTR))='nr [non rilevabile]' or lower-case(normalize-space(./AUTR))='n.r. (non rilevabile)' or lower-case(normalize-space(../AUF/AUFR))='nr' or lower-case(normalize-space(../AUF/AUFR))='nr (recupero pregresso)' or lower-case(normalize-space(../AUF/AUFR))='n.r.' or lower-case(normalize-space(../AUF/AUFR))='nr [non rilevabile]' or lower-case(normalize-space(../AUF/AUFR))='n.r. (non rilevabile)')">
						<arco-cd:hasInterventionRole>
							<xsl:attribute name="rdf:resource">
                            <xsl:choose>
                            	<xsl:when test="./AUTR">
                            		<xsl:value-of
								select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./AUTR)))" />
                            	</xsl:when>
                            	<xsl:otherwise>
                            		<xsl:value-of
								select="concat($NS, 'Role/', arco-fn:urify(normalize-space(../AUF/AUFR)))" />
                           		</xsl:otherwise>
                            </xsl:choose>
                           </xsl:attribute>
						</arco-cd:hasInterventionRole>
					</xsl:if>
					<xsl:if test="./AUTY">
						<arco-cd:authorIntervention>
							<xsl:value-of select="normalize-space(./AUTY)" />
						</arco-cd:authorIntervention>
					</xsl:if>
					<xsl:if test="./AUTZ">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./AUTZ)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="./AUTJ">
						<arco-cd:hasAuthorityFileCataloguingAgency>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTJ)))" />
                            </xsl:attribute>
						</arco-cd:hasAuthorityFileCataloguingAgency>
					</xsl:if>
					<xsl:if
						test="./AUTM or ../AUF/AUFM and not(lower-case(normalize-space(./AUTM))='nr' or lower-case(normalize-space(./AUTM))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTM))='n.r.' or lower-case(normalize-space(./AUTM))='n.r. [non rilevabile]' or lower-case(normalize-space(./AUTM))='n.r. (non rilevabile)' or lower-case(normalize-space(../AUF/AUFM))='nr' or lower-case(normalize-space(../AUF/AUFM))='nr (recupero pregresso)' or lower-case(normalize-space(../AUF/AUFM))='n.r.' or lower-case(normalize-space(../AUF/AUFM))='n.r. [non rilevabile]' or lower-case(normalize-space(../AUF/AUFM))='n.r. (non rilevabile)')">
						<arco-cd:hasSource>
							<xsl:attribute name="rdf:resource">
                            	<xsl:choose>
                            		<xsl:when test="./AUTM">
                            			<xsl:value-of
								select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./AUTM)))" />
                            		</xsl:when>
                                	<xsl:otherwise>
                                		<xsl:value-of
								select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../AUF/AUFM)))" />                         	
                                	</xsl:otherwise>
                            	</xsl:choose>
                            </xsl:attribute>
						</arco-cd:hasSource>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./AUTJ">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTJ)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./AUTJ)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./AUTJ)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if
					test="./AUTM or ../AUF/AUFM and not(lower-case(normalize-space(./AUTM))='nr' or lower-case(normalize-space(./AUTM))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTM))='n.r.' or lower-case(normalize-space(./AUTM))='n.r. [non rilevabile]' or lower-case(normalize-space(./AUTM))='n.r. (non rilevabile)' or lower-case(normalize-space(../AUF/AUFM))='nr' or lower-case(normalize-space(../AUF/AUFM))='nr (recupero pregresso)' or lower-case(normalize-space(../AUF/AUFM))='n.r.' or lower-case(normalize-space(../AUF/AUFM))='n.r. [non rilevabile]' or lower-case(normalize-space(../AUF/AUFM))='n.r. (non rilevabile)')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:choose>
                            		<xsl:when test="./AUTM">
                            			<xsl:value-of
							select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./AUTM)))" />
                            		</xsl:when>
                                	<xsl:otherwise>
                                		<xsl:value-of
							select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../AUF/AUFM)))" />                         	
                                	</xsl:otherwise>
                            	</xsl:choose>
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/Source'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:choose>
								<xsl:when test="./AUTM">
									<xsl:value-of select="normalize-space(./AUTM)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(../AUF/AUFM)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name>
							<xsl:choose>
								<xsl:when test="./AUTM">
									<xsl:value-of select="normalize-space(./AUTM)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(../AUF/AUFM)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if
					test="./AUTR or ../AUF/AUFR and not(lower-case(normalize-space(./AUTR))='nr' or lower-case(normalize-space(./AUTR))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTR))='n.r.' or lower-case(normalize-space(./AUTR))='nr [non rilevabile]' or lower-case(normalize-space(./AUTR))='n.r. (non rilevabile)' or lower-case(normalize-space(../AUF/AUFR))='nr' or lower-case(normalize-space(../AUF/AUFR))='nr (recupero pregresso)' or lower-case(normalize-space(../AUF/AUFR))='n.r.' or lower-case(normalize-space(../AUF/AUFR))='nr [non rilevabile]' or lower-case(normalize-space(../AUF/AUFR))='n.r. (non rilevabile)')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:choose>
                            	<xsl:when test="./AUTR">
                            		<xsl:value-of
							select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./AUTR)))" />
                            	</xsl:when>
                            	<xsl:otherwise>
                            		<xsl:value-of
							select="concat($NS, 'Role/', arco-fn:urify(normalize-space(../AUF/AUFR)))" />
                           		</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/RO/Role'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:choose>
								<xsl:when test="./AUTR">
									<xsl:value-of select="normalize-space(./AUTR)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(../AUF/AUFR)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name>
							<xsl:choose>
								<xsl:when test="./AUTR">
									<xsl:value-of select="normalize-space(./AUTR)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(../AUF/AUFR)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./AUTN or ../AUF/AUFN or ../AUF/AUFB">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
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
	                                    <xsl:value-of select="$author" />
	                                </xsl:otherwise>
	                            </xsl:choose>
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when
								test="lower-case(normalize-space(./AUTP))='p'">
                                        <xsl:value-of
								select="'https://w3id.org/italia/onto/CPV/Person'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./AUTP))='e'">
                                        <xsl:value-of
								select="'https://w3id.org/italia/onto/COV/Organization'" />
                                    </xsl:when>
                                    <xsl:when test="../AUF/AUFN">
                                        <xsl:value-of
								select="'https://w3id.org/italia/onto/CPV/Person'" />
                                    </xsl:when>
                                    <xsl:when test="./AUTN">
                                        <xsl:value-of
								select="'https://w3id.org/italia/onto/CPV/Person'" />
                                    </xsl:when>
                                    <xsl:when test="./AUTB">
                                        <xsl:value-of
								select="'https://w3id.org/italia/onto/COV/Organization'" />
                                    </xsl:when>
                                    <xsl:when test="../AUF/AUFB">
                                        <xsl:value-of
								select="'https://w3id.org/italia/onto/COV/Organization'" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:choose>
								<xsl:when test="./AUTN">
									<xsl:choose>
										<xsl:when test="./AUTS">
											<xsl:value-of
												select="concat(normalize-space(./AUTN), ' (', normalize-space(./AUTS), ')')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="normalize-space(./AUTN)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:when test="../AUF/AUFN">
									<xsl:choose>
										<xsl:when test="../AUF/AUFS">
											<xsl:value-of
												select="concat(normalize-space(./AUFN), ' (', normalize-space(./AUFS), ')')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="normalize-space(./AUFN)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:when test="../AUF/AUFB">
									<xsl:choose>
										<xsl:when test="../AUF/AUFS">
											<xsl:value-of
												select="concat(normalize-space(./AUFB), ' (', normalize-space(./AUFS), ')')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="normalize-space(./AUFB)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
							</xsl:choose>
						</rdfs:label>
						<l0:name>
							<xsl:choose>
								<xsl:when test="./AUTN">
									<xsl:choose>
										<xsl:when test="./AUTS">
											<xsl:value-of
												select="concat(normalize-space(./AUTN), ' (', normalize-space(./AUTS), ')')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="normalize-space(./AUTN)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:when test="../AUF/AUFN">
									<xsl:choose>
										<xsl:when test="../AUF/AUFS">
											<xsl:value-of
												select="concat(normalize-space(./AUFN), ' (', normalize-space(./AUFS), ')')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="normalize-space(./AUFN)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:when test="../AUF/AUFB">
									<xsl:choose>
										<xsl:when test="../AUF/AUFS">
											<xsl:value-of
												select="concat(normalize-space(./AUFB), ' (', normalize-space(./AUFS), ')')" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="normalize-space(./AUFB)" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
							</xsl:choose>
						</l0:name>
						<xsl:if test="./AUTA">
							<arco-cd:agentDate>
								<xsl:value-of select="normalize-space(./AUTA)" />
							</arco-cd:agentDate>
						</xsl:if>
						<xsl:if test="../AUF/AUFA">
							<arco-cd:agentDate>
								<xsl:value-of select="normalize-space(../AUF/AUFA)" />
							</arco-cd:agentDate>
						</xsl:if>
						<xsl:if test="./AUTH">
							<arco-cd:agentLocalIdentifier>
								<xsl:value-of select="normalize-space(./AUTH)" />
							</arco-cd:agentLocalIdentifier>
						</xsl:if>
						<xsl:if test="../AUF/AUFH">
							<arco-cd:agentLocalIdentifier>
								<xsl:value-of select="normalize-space(../AUF/AUFH)" />
							</arco-cd:agentLocalIdentifier>
						</xsl:if>
						<xsl:if test="./AUTK">
							<arco-cd:authorICCDIdentifier>
								<xsl:value-of select="normalize-space(./AUTK)" />
							</arco-cd:authorICCDIdentifier>
						</xsl:if>
						<xsl:if test="./NCUN">
							<arco-cd:authorICCDIdentifier>
								<xsl:value-of select="normalize-space(./NCUN)" />
							</arco-cd:authorICCDIdentifier>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- responsibility for cultural property (F and FF) -->
			<xsl:for-each select="schede/*/PD/PDF">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Responsibility/', $itemURI, '-', position())" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/context-description/Responsibility'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Responsabilità ', position(), ' relativamente al bene fotografico: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Responsabilità ', position(), ' relativamente al bene fotografico: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Responsibility ', position(), ' for photographic heritage: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Responsibility ', position(), ' for photographic heritage: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./PDFS">
						<arco-core:note>
							<xsl:value-of select="./PDFS" />
						</arco-core:note>
					</xsl:if>
						<arco-cd:hasAgentWithResponsibility>
							<xsl:attribute name="rdf:resource">
		                            <xsl:choose>
		                                <xsl:when test="./PDFN and ./PDFA">
		                                    <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./PDFN)), '-', arco-fn:urify(normalize-space(./PDFA)))" />
		                                </xsl:when>
		                                <xsl:when
								test="./PDFN">
		                                    <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./PDFN)))" />
		                                </xsl:when>
		                                <xsl:when
								test="./PDFB and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0') and ./PDFA">
		                                    <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./PDFB)), '-', arco-fn:urify(normalize-space(./PDFA)))" />
		                                </xsl:when>
		                                <xsl:when test="./PDFB and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
		                                    <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./PDFB)))" />
		                                </xsl:when>
		                            </xsl:choose>
                            </xsl:attribute>
						</arco-cd:hasAgentWithResponsibility>
					<xsl:if
						test="./PDFR and not(lower-case(normalize-space(./PDFR))='nr' or lower-case(normalize-space(./PDFR))='nr (recupero pregresso)' or lower-case(normalize-space(./PDFR))='n.r.' or lower-case(normalize-space(./PDFR))='n.r. [non rilevabile]')">
						<arco-cd:hasResponsibilityType>
							<xsl:attribute name="rdf:resource">
                            	<xsl:value-of
								select="concat($NS, 'ResponsibilityType/', arco-fn:urify(normalize-space(./PDFR)))" />
                           </xsl:attribute>
						</arco-cd:hasResponsibilityType>
					</xsl:if>
					<xsl:if test="./PDFD">
						<tiapit:date>
							<xsl:value-of select="normalize-space(./PDFD)" />
						</tiapit:date>
					</xsl:if>
					<xsl:if test="./PDFJ">
						<arco-cd:hasAuthorityFileCataloguingAgency>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./PDFJ)))" />
                            </xsl:attribute>
						</arco-cd:hasAuthorityFileCataloguingAgency>
					</xsl:if>
					<xsl:if test="./PDFL">
						<arco-core:hasLocation>
							<xsl:attribute name="rdf:resource">
			                     <xsl:value-of
												select="concat($NS, 'GeographicalFeature/', arco-fn:urify(normalize-space(./PDFL)))" />
			                </xsl:attribute>
						</arco-core:hasLocation>
					</xsl:if>
					<xsl:if
						test="./PDFM and not(lower-case(normalize-space(./PDFM))='nr' or lower-case(normalize-space(./PDFM))='nr (recupero pregresso)' or lower-case(normalize-space(./PDFM))='n.r.' or lower-case(normalize-space(./PDFM))='n.r. [non rilevabile]' or lower-case(normalize-space(./PDFM))='n.r. (non rilevabile)')">
						<arco-cd:hasSource>
							<xsl:attribute name="rdf:resource">
                            		<xsl:value-of
								select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./PDFM)))" />
                            </xsl:attribute>
						</arco-cd:hasSource>
					</xsl:if>
					<xsl:if
						test="./PDFC and not(lower-case(normalize-space(./PDFC))='nr' or lower-case(normalize-space(./PDFC))='nr (recupero pregresso)' or lower-case(normalize-space(./PDFC))='n.r.' or lower-case(normalize-space(./PDFC))='n.r. [non rilevabile]' or lower-case(normalize-space(./PDFM))='n.r. (non rilevabile)')">
						<arco-cd:hasSource>
							<xsl:attribute name="rdf:resource">
                            		<xsl:value-of
								select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./PDFC)))" />
                            </xsl:attribute>
						</arco-cd:hasSource>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./PDFJ">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./PDFJ)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./PDFJ)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./PDFJ)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if
					test="./PDFM and not(lower-case(normalize-space(./PDFM))='nr' or lower-case(normalize-space(./PDFM))='nr (recupero pregresso)' or lower-case(normalize-space(./PDFM))='n.r.' or lower-case(normalize-space(./PDFM))='n.r. [non rilevabile]')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                             <xsl:value-of
							select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./PDFM)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/Source'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./PDFM)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./PDFM)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
					<xsl:if test="./PDFL">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of
								select="concat($NS, 'GeographicalFeature/', arco-fn:urify(normalize-space(./PDFL)))" />
                            </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="'http://dati.beniculturali.it/cis/GeographicalFeature'" />
                                </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./PDFL)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./PDFL)" />
							</l0:name>
						</rdf:Description>
					</xsl:if>
				<xsl:if
					test="./PDFC and not(lower-case(normalize-space(./PDFC))='nr' or lower-case(normalize-space(./PDFC))='nr (recupero pregresso)' or lower-case(normalize-space(./PDFC))='n.r.' or lower-case(normalize-space(./PDFC))='n.r. [non rilevabile]')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                             <xsl:value-of
							select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./PDFC)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/Circumstance'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./PDFC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./PDFC)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if
					test="./PDFR and not(lower-case(normalize-space(./PDFR))='nr' or lower-case(normalize-space(./PDFR))='nr (recupero pregresso)' or lower-case(normalize-space(./PDFR))='n.r.' or lower-case(normalize-space(./PDFR))='n.r. [non rilevabile]')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            		<xsl:value-of
							select="concat($NS, 'ResponsibilityType/', arco-fn:urify(normalize-space(./PDFR)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/ResponsibilityType'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./PDFR)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./PDFR)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- agent with responsibility -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		                            <xsl:choose>
		                                <xsl:when test="./PDFN and ./PDFA">
		                                    <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./PDFN)), '-', arco-fn:urify(normalize-space(./PDFA)))" />
		                                </xsl:when>
		                                <xsl:when
								test="./PDFN">
		                                    <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./PDFN)))" />
		                                </xsl:when>
		                                <xsl:when
								test="./PDFB and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0') and ./PDFA">
		                                    <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./PDFB)), '-', arco-fn:urify(normalize-space(./PDFA)))" />
		                                </xsl:when>
		                                <xsl:when test="./PDFB and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
		                                    <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./PDFB)))" />
		                                </xsl:when>
		                            </xsl:choose>
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when
								test="lower-case(normalize-space(./PDFP))='p'">
                                        <xsl:value-of
								select="'https://w3id.org/italia/onto/CPV/Person'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./PDFP))='e'">
                                        <xsl:value-of
								select="'https://w3id.org/italia/onto/COV/Organization'" />
                                    </xsl:when>
                                    <xsl:when test="./PDFN and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
                                        <xsl:value-of
								select="'https://w3id.org/italia/onto/CPV/Person'" />
                                    </xsl:when>
                                    <xsl:when test="./PDFB and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
                                        <xsl:value-of
								select="'https://w3id.org/italia/onto/COV/Organization'" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:choose>
								<xsl:when test="./PDFN">
									<xsl:value-of select="normalize-space(./PDFN)" />
								</xsl:when>
								<xsl:when test="./PDFB and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
									<xsl:value-of select="normalize-space(./PDFB)" />
								</xsl:when>
							</xsl:choose>
						</rdfs:label>
						<l0:name>
							<xsl:choose>
								<xsl:when test="./PDFN">
									<xsl:value-of select="normalize-space(./PDFN)" />
								</xsl:when>
								<xsl:when test="./PDFB and not($sheetVersion='4.00' or $sheetVersion='4.00_ICCD0')">
									<xsl:value-of select="normalize-space(./PDFB)" />
								</xsl:when>
							</xsl:choose>
						</l0:name>
						<xsl:if test="./PDFA">
							<arco-cd:agentDate>
								<xsl:value-of select="normalize-space(./PDFA)" />
							</arco-cd:agentDate>
						</xsl:if>
						<xsl:if test="./PDFH">
							<arco-cd:agentLocalIdentifier>
								<xsl:value-of select="normalize-space(./PDFH)" />
							</arco-cd:agentLocalIdentifier>
						</xsl:if>
						<xsl:if test="./PDFB and $sheetVersion='4.00_ICCD0'">
							<arco-cd:historicalBiographicalInformation>
								<xsl:value-of select="normalize-space(./PDFB)" />
							</arco-cd:historicalBiographicalInformation>
						</xsl:if>
					</rdf:Description>
			</xsl:for-each>
			<!-- inventory as an individual -->
			<xsl:for-each select="schede/*/UB/INV">
				<xsl:if test="./*">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
		            		<xsl:value-of
							select="concat($NS, 'Inventory/', $itemURI, '-', position())" />
		            	</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                            	<xsl:value-of
								select="'https://w3id.org/arco/context-description/Inventory'" />
                        	</xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:choose>
								<xsl:when test="./INVA">
									<xsl:value-of select="normalize-space(./INVA)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Inventory ', normalize-space(./INVN), 'of cultural property: ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:choose>
								<xsl:when test="./INVA">
									<xsl:value-of select="normalize-space(./INVA)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Inventario ', normalize-space(./INVN), 'del bene culturale: ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:choose>
								<xsl:when test="./INVA">
									<xsl:value-of select="normalize-space(./INVA)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Inventory ', normalize-space(./INVN), ' of cultural property: ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
						<l0:name xml:lang="it">
							<xsl:choose>
								<xsl:when test="./INVA">
									<xsl:value-of select="normalize-space(./INVA)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Inventario ', normalize-space(./INVN), ' del bene culturale: ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
						<xsl:if test="./INVC">
							<arco-cd:inventoryLocation>
								<xsl:value-of select="./INVC" />
							</arco-cd:inventoryLocation>
						</xsl:if>
						<xsl:if test="./INVD">
							<tiapit:date>
								<xsl:value-of select="./INVD" />
							</tiapit:date>
						</xsl:if>
						<xsl:if test="./INVS">
							<arco-core:note>
								<xsl:value-of select="./INVS" />
							</arco-core:note>
						</xsl:if>
						<arco-cd:inventoryIdentifier>
							<xsl:value-of select="./INVN" />
						</arco-cd:inventoryIdentifier>
						<!-- responsible of inventory identifier -->
						<xsl:if test="./INVG">
							<arco-core:hasAgentRole>
								<xsl:attribute name="rdf:resource">
                            		<xsl:value-of
									select="concat($NS, 'AgentRole/', $itemURI, '-inventory-identifier-responsible')" />
                        		</xsl:attribute>
							</arco-core:hasAgentRole>
							<arco-cd:hasInventoryIdentifierResponsible>
								<xsl:attribute name="rdf:resource">
                            		<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./INVG)))" />
                        		</xsl:attribute>
							</arco-cd:hasInventoryIdentifierResponsible>
						</xsl:if>
					</rdf:Description>
					<!-- agent role for responsible of inventory identifier -->
					<xsl:if test="./INVG">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                        <xsl:value-of
								select="concat($NS, 'AgentRole/', $itemURI, '-inventory-identifier-responsible')" />
		                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
									select="'https://w3id.org/arco/core/AgentRole'" />
		                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of
									select="concat('Responsabile del numero di inventario del bene ', $itemURI, ': ', normalize-space(./INVG))" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of
									select="concat('Responsible for inventory identifier of cultural property ', $itemURI, ': ', normalize-space(./INVG))" />
							</rdfs:label>
							<arco-core:hasRole>
								<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
									select="concat($NS, 'Role/InventoryIdentifierResponsible')" />
		                        </xsl:attribute>
							</arco-core:hasRole>
							<arco-core:hasAgent>
								<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./INVG)))" />
		                        </xsl:attribute>
							</arco-core:hasAgent>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                        <xsl:value-of
								select="concat($NS, 'Role/InventoryIdentifierResponsible')" />
		                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
									select="'https://w3id.org/italia/onto/RO/Role'" />
		                        </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="'Responsabile del numero di inventario'" />
							</rdfs:label>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="'Inventory Identifier Responsible'" />
							</rdfs:label>
							<arco-core:isRoleOf>
								<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
									select="concat($NS, 'AgentRole/', $itemURI, '-inventory-identifier-responsible')" />
		                        </xsl:attribute>
							</arco-core:isRoleOf>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
		                        <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./INVG)))" />
		                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
		                        </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./INVG)" />
							</rdfs:label>
							<l0:name>
								<xsl:value-of select="normalize-space(./INVG)" />
							</l0:name>
							<arco-core:isAgentOf>
								<xsl:attribute name="rdf:resource">
		                            <xsl:value-of
									select="concat($NS, 'AgentRole/', $itemURI, '-inventory-identifier-responsible')" />
		                        </xsl:attribute>
							</arco-core:isAgentOf>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<!-- commission as an individual -->
			<xsl:for-each select="schede/*/AU/CMM">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'Commission/', $itemURI, '-', position())" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/context-description/Commission'" />
                        </xsl:attribute>
					</rdf:type>
					<xsl:if test="./CMMN">
						<arco-cd:hasCommittent>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CMMN)))" />
                            </xsl:attribute>
						</arco-cd:hasCommittent>
					</xsl:if>
					<xsl:if test="./CMMC">
						<arco-cd:hasCircumstance>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./CMMC)))" />
                            </xsl:attribute>
						</arco-cd:hasCircumstance>
					</xsl:if>
					<xsl:if
						test="./CMMF and not(lower-case(normalize-space(./CMMF))='nr' or lower-case(normalize-space(./CMMF))='nr (recupero pregresso)' or lower-case(normalize-space(./CMMF))='n.r.')">
						<arco-cd:hasSource>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./CMMF)))" />
                            </xsl:attribute>
						</arco-cd:hasSource>
					</xsl:if>
					<!-- Valentina timeinterval -->
					<xsl:if test="./CMMD">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./CMMD)))" />
                            </xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<xsl:if test="./CMMY">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./CMMY)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
				<!-- Valentina timeinterval -->
				<xsl:if test="./CMMD">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./CMMD)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./CMMD)" />
						</rdfs:label>
						<tiapit:time>
							<xsl:value-of select="normalize-space(./CMMD)" />
						</tiapit:time>
					</rdf:Description>
				</xsl:if>
				<xsl:if
					test="./CMMF and not(lower-case(normalize-space(./CMMF))='nr' or lower-case(normalize-space(./CMMF))='nr (recupero pregresso)' or lower-case(normalize-space(./CMMF))='n.r.')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./CMMF)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/Source'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./CMMF)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./CMMF)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./CMMC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./CMMC)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/Circumstance'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./CMMC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./CMMC)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="./CMMN">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CMMN)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./CMMN)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./CMMN)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="schede/*/AU/AAT | schede/F/AU/AAF">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'AlternativeAuthorshipAttribution/', $itemURI, '-', position())" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/context-description/AlternativeAuthorshipAttribution'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Attribuzione superata, alternativa o tradizionale di autore del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Attribuzione superata, alternativa o tradizionale di autore del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Alternative authorship attribution of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Alternative authorship attribution of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-cd:hasAttributedAuthor>
						<xsl:attribute name="rdf:resource">
                        	<xsl:variable name="author">
	                            <xsl:choose>
	                                <xsl:when test="./AATN">
		                                <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AATN)))" />
		                            </xsl:when>
		                            <!-- alternative authorship attribution in F 3.00 -->
		                            <xsl:when test="../AAF/AAFN">
		                                <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AAFN)))" />
		                            </xsl:when>
		                            <!-- alternative authorship attribution in F 3.00 -->
		                            <xsl:when test="../AAF/AAFB">
		                                <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AAFB)))" />
		                            </xsl:when>
		                            <xsl:otherwise>
		                                <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
		                            </xsl:otherwise>
	                            </xsl:choose>
	                        </xsl:variable>
	                        <xsl:choose>
	                        	<xsl:when test="./AATA">
	                            	<xsl:value-of
							select="concat($author, '-', arco-fn:urify(normalize-space(./AATA)))" />
	                            </xsl:when>
	                            <xsl:otherwise>
	                            	<xsl:value-of select="$author" />
	                            </xsl:otherwise>
	                       </xsl:choose>
                        </xsl:attribute>
					</arco-cd:hasAttributedAuthor>
					<xsl:if test="./AATY">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./AATY)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if
						test="./AATM or ../AAF/AAFM and not(lower-case(normalize-space(./AATM))='nr' or lower-case(normalize-space(./AATM))='nr (recupero pregresso)' or lower-case(normalize-space(./AATM))='n.r.' or lower-case(normalize-space(./AATM))='n.r. (non rilevabile)' or lower-case(normalize-space(./AATM))='n.r. [non rilevabile]' or lower-case(normalize-space(../AAF/AAFM))='nr' or lower-case(normalize-space(../AAF/AAFM))='nr (recupero pregresso)' or lower-case(normalize-space(../AAF/AAFM))='n.r.' or lower-case(normalize-space(../AAF/AAFM))='n.r. (non rilevabile)' or lower-case(normalize-space(../AAF/AAFM))='n.r. [non rilevabile]')">
						<arco-cd:hasSource>
							<xsl:attribute name="rdf:resource">
                            <xsl:choose>
                            	<xsl:when test="./AATM">
                            		<xsl:value-of
								select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./AATM)))" />
                            	</xsl:when>
                            	<xsl:otherwise>
                            		<xsl:value-of
								select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../AAF/AAFM)))" />
                            	</xsl:otherwise>
                            </xsl:choose>
                            </xsl:attribute>
						</arco-cd:hasSource>
					</xsl:if>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                    	<xsl:variable name="author">
                            <xsl:choose>
                                <xsl:when test="./AATN">
	                                <xsl:value-of
						select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AATN)))" />
	                            </xsl:when>
	                            <xsl:when test="../AAF/AAFN">
	                                <xsl:value-of
						select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AAFN)))" />
	                            </xsl:when>
	                            <xsl:when test="../AAF/AAFB">
		                                <xsl:value-of
						select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AAFB)))" />
		                            </xsl:when>
	                            <xsl:otherwise>
	                                <xsl:value-of
						select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
	                            </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:choose>
                        	<xsl:when test="./AATA">
                            	<xsl:value-of
						select="concat($author, '-', arco-fn:urify(normalize-space(./AATA)))" />
                            </xsl:when>
                            <xsl:otherwise>
                            	<xsl:value-of select="$author" />
                            </xsl:otherwise>
                       </xsl:choose>
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:choose>
							<xsl:when test="./AATN">
								<xsl:value-of select="normalize-space(./AATN)" />
							</xsl:when>
							<xsl:when test="../AAF/AAFN">
								<xsl:value-of select="normalize-space(../AAF/AAFN)" />
							</xsl:when>
							<xsl:when test="../AAF/AAFB">
								<xsl:value-of select="normalize-space(../AAF/AAFB)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(.)" />
							</xsl:otherwise>
						</xsl:choose>
					</rdfs:label>
					<l0:name>
						<xsl:choose>
							<xsl:when test="./AATN">
								<xsl:value-of select="normalize-space(./AATN)" />
							</xsl:when>
							<xsl:when test="../AAF/AAFN">
								<xsl:value-of select="normalize-space(../AAF/AAFN)" />
							</xsl:when>
							<xsl:when test="../AAF/AAFB">
								<xsl:value-of select="normalize-space(../AAF/AAFB)" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="normalize-space(.)" />
							</xsl:otherwise>
						</xsl:choose>
					</l0:name>
					<xsl:if test="./AATA">
						<arco-cd:agentDate>
							<xsl:value-of select="normalize-space(./AATA)" />
						</arco-cd:agentDate>
					</xsl:if>
				</rdf:Description>
				<xsl:if
					test="./AATM or ../AAF/AAFM and not(lower-case(normalize-space(./AATM))='nr' or lower-case(normalize-space(./AATM))='nr (recupero pregresso)' or lower-case(normalize-space(./AATM))='n.r.' or lower-case(normalize-space(./AATM))='n.r. (non rilevabile)' or lower-case(normalize-space(./AATM))='n.r. [non rilevabile]' or lower-case(normalize-space(../AAF/AAFM))='nr' or lower-case(normalize-space(../AAF/AAFM))='nr (recupero pregresso)' or lower-case(normalize-space(../AAF/AAFM))='n.r.' or lower-case(normalize-space(../AAF/AAFM))='n.r. (non rilevabile)' or lower-case(normalize-space(../AAF/AAFM))='n.r. [non rilevabile]')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                       	 <xsl:choose>
                        	<xsl:when test="./AATM">
                            	<xsl:value-of
							select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./AATM)))" />
                            </xsl:when>
                            <xsl:otherwise>
                            	<xsl:value-of
							select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../AAF/AAFM)))" />                      
                            </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/Source'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:choose>
								<xsl:when test="./AATM">
									<xsl:value-of select="normalize-space(./AATM)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(../AAF/AAFM)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name>
							<xsl:choose>
								<xsl:when test="./AATM">
									<xsl:value-of select="normalize-space(./AATM)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(../AAF/AAFM)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<!-- xsl:if test="schede/*/AU/ATB/ATBD"> <rdf:Description> <xsl:attribute 
				name="rdf:about"> <xsl:value-of select="concat($NS, 'CulturalScope/', arco-fn:urify(normalize-space(schede/*/AU/ATB/ATBD)))" 
				/> </xsl:attribute> <rdf:type> <xsl:attribute name="rdf:resource"> <xsl:value-of 
				select="'https://w3id.org/arco/culturaldefinition/CulturalScope'" /> </xsl:attribute> 
				</rdf:type> <rdfs:label> <xsl:value-of select="normalize-space(schede/*/AU/ATB/ATBD)" 
				/> </rdfs:label> </rdf:Description> </xsl:if> <xsl:if test="schede/*/AU/ATB/ATBR"> 
				<rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of select="concat($NS, 
				'Role/', arco-fn:urify(normalize-space(schede/*/AU/ATB/ATBR)))" /> </xsl:attribute> 
				<rdf:type> <xsl:attribute name="rdf:resource"> <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" 
				/> </xsl:attribute> </rdf:type> <rdfs:label> <xsl:value-of select="normalize-space(schede/*/AU/ATB/ATBR)" 
				/> </rdfs:label> </rdf:Description> </xsl:if> <xsl:if test="schede/*/AU/ATB/ATBM"> 
				<rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of select="concat($NS, 
				'Source/', arco-fn:urify(normalize-space(schede/*/AU/ATB/ATBM)))" /> </xsl:attribute> 
				<rdf:type> <xsl:attribute name="rdf:resource"> <xsl:value-of select="'https://w3id.org/arco/culturaldefinition/Source'" 
				/> </xsl:attribute> </rdf:type> <rdfs:label> <xsl:value-of select="normalize-space(schede/*/AU/ATB/ATBM)" 
				/> </rdfs:label> </rdf:Description> </xsl:if -->
			<!-- member of collection -->
			<xsl:for-each select="schede/*/UB/COL">
				<xsl:if test="./*">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'CollectionMembership/', $itemURI, '-collection-membership-', position())" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/CollectionMembership'" />
                            </xsl:attribute>
						</rdf:type>
						<arco-cd:hasCulturalProperty>
							<xsl:attribute name="rdf:resource">
                        		<xsl:value-of
								select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                        	</xsl:attribute>
						</arco-cd:hasCulturalProperty>
						<arco-cd:hasCollection>
							<xsl:attribute name="rdf:resource">
                        		<xsl:value-of
								select="concat($NS, 'CollectionOfCulturalEntities/', arco-fn:urify(normalize-space(./COLD)))" />
                        	</xsl:attribute>
						</arco-cd:hasCollection>
						<xsl:if test="./COLM">
							<arco-cd:leavingReason>
								<xsl:value-of select="./COLM" />
							</arco-cd:leavingReason>
						</xsl:if>
						<xsl:if test="./COLI">
							<arco-cd:collectionUnitIdentifier>
								<xsl:value-of select="./COLI" />
							</arco-cd:collectionUnitIdentifier>
						</xsl:if>
						<xsl:if test="./COLV">
							<arco-cd:culturalPropertyValue>
								<xsl:value-of select="./COLV" />
							</arco-cd:culturalPropertyValue>
						</xsl:if>
						<xsl:if test="./COLU or ./COLA">
							<tiapit:atTime>
								<xsl:attribute name="rdf:resource">
                        		<xsl:choose>
                        			<xsl:when test="./COLU and ./COLA">
                        				<xsl:value-of
									select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLA)), '-', arco-fn:urify(normalize-space(./COLU)))" />
                        			</xsl:when>
                        			<xsl:when test="./COLU">
                        				<xsl:value-of
									select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLU)))" />
                        			</xsl:when>
                        			<xsl:when test="./COLA">
                        				<xsl:value-of
									select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLA)))" />
                        			</xsl:when>
                        			</xsl:choose>
                        		</xsl:attribute>
							</tiapit:atTime>
						</xsl:if>
					</rdf:Description>
					<!-- time interval of member of collection -->
					<xsl:if test="./COLA or ./COLU">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                        <xsl:choose>
                        	<xsl:when test="./COLU and ./COLA">
                        		<xsl:value-of
								select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLA)), '-', arco-fn:urify(normalize-space(./COLU)))" />
                        	</xsl:when>
                        	<xsl:when test="./COLU">
                        		<xsl:value-of
								select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLU)))" />
                        	</xsl:when>
                        	<xsl:when test="./COLA">
                        		<xsl:value-of
								select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLA)))" />
                        	</xsl:when>
                        	</xsl:choose>
                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                            <xsl:value-of
									select="'https://w3id.org/italia/onto/TI/TimeInteval'" />
                        </xsl:attribute>
							</rdf:type>
							<tiapit:startTime>
								<xsl:value-of select="normalize-space(./COLA)" />
							</tiapit:startTime>
							<tiapit:endTime>
								<xsl:value-of select="normalize-space(./COLU)" />
							</tiapit:endTime>
						</rdf:Description>
					</xsl:if>
					<!-- collection of cultural entities -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                		<xsl:value-of
							select="concat($NS, 'CollectionOfCulturalEntities/', arco-fn:urify(normalize-space(./COLD)))" />
                	</xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                            <xsl:value-of
								select="'http://dati.beniculturali.it/cis/CollectionOfCulturalEntities'" />
                        </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="it">
							<xsl:choose>
								<xsl:when test="./COLD">
									<xsl:value-of select="./COLD" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Collezione contenente il bene: ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:choose>
								<xsl:when test="./COLD">
									<xsl:value-of select="./COLD" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Collezione contenente il bene: ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:choose>
								<xsl:when test="./COLD">
									<xsl:value-of select="./COLD" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Collection with cultural property: ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:choose>
								<xsl:when test="./COLD">
									<xsl:value-of select="./COLD" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="concat('Collection with cultural property: ', $itemURI)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
						<arco-cd:isCollectionIn>
							<xsl:attribute name="rdf:resource">
                    		<xsl:value-of
								select="concat($NS, 'CollectionMembership/', $itemURI, '-collection-membership-', position())" />
                    	</xsl:attribute>
						</arco-cd:isCollectionIn>
						<xsl:if test="./COLS">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./COLS)" />
							</arco-core:note>
						</xsl:if>
						<xsl:if test="./COLC or ./COLN">
							<arco-cd:hasCollector>
								<xsl:attribute name="rdf:resource">
                    			<xsl:choose>
                    				<xsl:when test="./COLC">
                    					<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./COLC)))" />
                    				</xsl:when>
                    				<xsl:otherwise>
                    					<xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./COLN)))" />
                    				</xsl:otherwise>
                    			</xsl:choose>
                    		</xsl:attribute>
							</arco-cd:hasCollector>
						</xsl:if>
					</rdf:Description>
					<!-- collector of collection of cultural entities -->
					<xsl:if test="./COLC or ./COLN">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                		<xsl:choose>
                    		<xsl:when test="./COLC">
                    			<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./COLC)))" />
                    		</xsl:when>
                    		<xsl:otherwise>
                    			<xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./COLN)))" />
                    		</xsl:otherwise>
                    	</xsl:choose>
                    </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                <xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
                            </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:choose>
									<xsl:when test="./COLC">
										<xsl:value-of select="normalize-space(./COLC)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./COLN)" />
									</xsl:otherwise>
								</xsl:choose>
							</rdfs:label>
							<l0:name>
								<xsl:choose>
									<xsl:when test="./COLC">
										<xsl:value-of select="normalize-space(./COLC)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="normalize-space(./COLN)" />
									</xsl:otherwise>
								</xsl:choose>
							</l0:name>
							<arco-cd:isCollectorOf>
								<xsl:value-of
									select="concat($NS, 'CollectionOfCulturalEntities/', arco-fn:urify(normalize-space(./COLD)))" />
							</arco-cd:isCollectorOf>
						</rdf:Description>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<!-- conservation status -->
			<xsl:for-each select="schede/*/CO/STC">
				<xsl:if test="./*">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/denotative-description/ConservationStatus'" />
                            </xsl:attribute>
						</rdf:type>
						<xsl:if
							test="./STCC and not(lower-case(normalize-space(./STCC))='nr' or lower-case(normalize-space(./STCC))='n.r.' or lower-case(normalize-space(./STCC))='nr (recupero pregresso)')">
							<arco-dd:hasConservationStatusType>
								<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when
									test="lower-case(normalize-space(./STCC))='buono' or lower-case(normalize-space(./STCC))='buonoe' or lower-case(normalize-space(./STCC))='buona'">
                                        <xsl:value-of
									select="'https://w3id.org/arco/denotative-description/Good'" />
                                    </xsl:when>
                                    <xsl:when
									test="lower-case(normalize-space(./STCC))='mediocre'">
                                        <xsl:value-of
									select="'https://w3id.org/arco/denotative-description/Mediocre'" />
                                    </xsl:when>
                                    <xsl:when
									test="lower-case(normalize-space(./STCC))='discreto' or lower-case(normalize-space(./STCC))='discreta'">
                                        <xsl:value-of
									select="'https://w3id.org/arco/denotative-description/Decent'" />
                                    </xsl:when>
                                    <xsl:when
									test="lower-case(normalize-space(./STCC))='cattivo' or lower-case(normalize-space(./STCC))='cattiva'">
                                        <xsl:value-of
									select="'https://w3id.org/arco/denotative-description/Bad'" />
                                    </xsl:when>
                                    <xsl:when
									test="lower-case(normalize-space(./STCC))='dato non disponibile'">
                                        <xsl:value-of
									select="'https://w3id.org/arco/denotative-description/Unavailable'" />
                                    </xsl:when>
                                    <xsl:when test="./STCC">
                                        <xsl:value-of
									select="concat($NS, 'ConservationStatusType/', arco-fn:urify(normalize-space(./STCC)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
							</arco-dd:hasConservationStatusType>
						</xsl:if>
						<xsl:if test="./STCS">
							<arco-core:specifications>
								<xsl:value-of select="normalize-space(./STCS)" />
							</arco-core:specifications>
						</xsl:if>
						<xsl:if test="./STCN">
							<arco-core:note>
								<xsl:value-of select="normalize-space(./STCN)" />
							</arco-core:note>
						</xsl:if>
					</rdf:Description>
					<xsl:if
						test="./STCC and not(lower-case(normalize-space(./STCC))='nr' or lower-case(normalize-space(./STCC))='n.r.' or lower-case(normalize-space(./STCC))='nr (recupero pregresso)')">
						<xsl:choose>
							<xsl:when
								test="lower-case(normalize-space(./STCC))='buono' or lower-case(normalize-space(./STCC))='buonoe' or lower-case(normalize-space(./STCC))='buona'" />
							<xsl:when test="lower-case(normalize-space(./STCC))='mediocre'" />
							<xsl:when
								test="lower-case(normalize-space(./STCC))='discreto' or lower-case(normalize-space(./STCC))='discreta'" />
							<xsl:when
								test="lower-case(normalize-space(./STCC))='cattivo' or lower-case(normalize-space(./STCC))='cattiva'" />
							<xsl:when
								test="lower-case(normalize-space(./STCC))='dato non disponibile'" />
							<xsl:when test="./STCC">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                    <xsl:value-of
										select="concat($NS, 'ConservationStatusType/', arco-fn:urify(normalize-space(./STCC)))" />
                                </xsl:attribute>
									<rdf:type
										rdf:resource="https://w3id.org/arco/denotative-description/ConservationStatusType" />
									<rdfs:label>
										<xsl:value-of select="normalize-space(./STCC)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./STCC)" />
									</l0:name>
								</rdf:Description>
							</xsl:when>
						</xsl:choose>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<!-- We create the Time Indexed Qualified Location associated with the 
				Cultural Property -->
			<xsl:if test="schede/*/LC">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-current')" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/location/TimeIndexedQualifiedLocation'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Localizzazione fisica attuale del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Localizzazione fisica attuale del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Current physical location of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Current physical location of cultural property: ', $itemURI)" />
					</l0:name>
					<arco-location:hasLocationType>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/location/CurrentPhysicalLocation'" />
                        </xsl:attribute>
					</arco-location:hasLocationType>
					<xsl:if test="schede/*/LC/LDC/LDCS">
						<arco-core:specifications>
							<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCS)" />
						</arco-core:specifications>
					</xsl:if>
					<xsl:if
						test="schede/*/LC/PVC/PVCV and not(lower-case(normalize-space(schede/*/LC/PVC/PVCV))='nr' or lower-case(normalize-space(schede/*/LC/PVC/PVCV))='n.r.' or lower-case(normalize-space(schede/*/LC/PVC/PVCV))='nr (recupero pregresso)' or lower-case(normalize-space(schede/*/LC/PVC/PVCV))='.' or lower-case(normalize-space(schede/*/LC/PVC/PVCV))='-')">
						<arco-location:locationDetails>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCV)" />
						</arco-location:locationDetails>
					</xsl:if>
					<xsl:if test="schede/*/LC/LCN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(schede/*/LC/LCN)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="schede/*/UB/UBO">
						<arco-core:note>
							<xsl:value-of
								select="concat('Ubicazione originaria: ', normalize-space(schede/*/UB/UBO))" />
						</arco-core:note>
					</xsl:if>
					<xsl:if test="schede/*/LC/LDC/LDCD">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCD)))" />
                            </xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
				</rdf:Description>
			</xsl:if>
			<!-- Time Interval for Current Location -->
			<xsl:if test="schede/*/LC/LDC/LDCD">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCD)))" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/TI/TimeInteval'" />
                        </xsl:attribute>
					</rdf:type>
					<tiapit:time>
						<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCD)" />
					</tiapit:time>
				</rdf:Description>
			</xsl:if>
			<!-- alternative locations + shot location for F catalogue record -->
			<xsl:for-each select="schede/*/LA | schede/F/LR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of
						select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-alternative-', position())" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/arco/location/TimeIndexedQualifiedLocation'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Localizzazione alternativa ', position(), ' del bene: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Localizzazione alternativa ', position(), ' del bene: ', $itemURI)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Alternative location ', position(), ' of cultural property: ', $itemURI)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Alternative location ', position(), ' of cultural property: ', $itemURI)" />
					</l0:name>
					<xsl:if test="./PRC/PRCS">
						<arco-core:specifications>
							<xsl:value-of select="normalize-space(./PRC/PRCS)" />
						</arco-core:specifications>
					</xsl:if>
					<xsl:if test="./LAN">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./LAN)" />
						</arco-core:note>
					</xsl:if>
					<xsl:if
						test="./TLC or ./TCL or ../../F/LR and not(./TLC='.' or ./TCL='.' or ./TLC='-' or ./TCL='-' or ./TLC='/' or ./TCL='/')">
						<arco-location:hasLocationType>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when
								test="lower-case(normalize-space(./TLC))='luogo di provenienza/collocazione precedente' or lower-case(normalize-space(./TCL))='luogo di provenienza' or lower-case(normalize-space(./TLC))='provenienza' or lower-case(normalize-space(./TCL))='provenienza'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/location/LastLocation'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./TLC))='luogo di produzione/realizzazione' or lower-case(normalize-space(./TCL))='luogo di esecuzione/fabbricazione'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/location/ProductionRealizationLocation'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./TLC))='luogo di reperimento' or lower-case(normalize-space(./TCL))='luogo di reperimento' or lower-case(normalize-space(./TLC))='reperimento' or lower-case(normalize-space(./TCL))='reperimento'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/location/FindingLocation'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./TLC))='luogo di deposito' or lower-case(normalize-space(./TCL))='luogo di deposito' or lower-case(normalize-space(./TLC))='deposito temporaneo' or lower-case(normalize-space(./TCL))='deposito temporaneo' or lower-case(normalize-space(./TLC))='deposito' or lower-case(normalize-space(./TCL))='deposito'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/location/StorageLocation'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./TLC))='luogo di esposizione' or lower-case(normalize-space(./TCL))='luogo di esposizione' or lower-case(normalize-space(./TLC))='espositiva' or lower-case(normalize-space(./TCL))='espositiva' or lower-case(normalize-space(./TLC))='espositivo' or lower-case(normalize-space(./TCL))='espositivo' or lower-case(normalize-space(./TLC))='esposizione' or lower-case(normalize-space(./TCL))='esposizione'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/location/ExhibitionLocation'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./TLC))='luogo di rilevamento' or lower-case(normalize-space(./TCL))='luogo di rilevamento' or lower-case(normalize-space(./TCL))='di rilevamento' or lower-case(normalize-space(./TLC))='di rilevamento' or lower-case(normalize-space(./TCL))='localizzazione di rilevamento' or lower-case(normalize-space(./TLC))='localizzazione di rilevamento'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/location/ObservationLocation'" />
                                    </xsl:when>
                                    <xsl:when
								test="lower-case(normalize-space(./TLC))='area rappresentata' or lower-case(normalize-space(./TCL))='area rappresentata'">
                                        <xsl:value-of
								select="'https://w3id.org/arco/location/SubjectLocation'" />
                                    </xsl:when>
                                    <xsl:when test="./TLC">
                                        <xsl:variable
								name="tlc" select="normalize-space(./TLC)" />
                                        <xsl:value-of
								select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./TLC)))" />
                                    </xsl:when>
                                    <xsl:when test="./TCL">
                                        <xsl:variable
								name="tcl" select="normalize-space(./TCL)" />
                                        <xsl:value-of
								select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./TCL)))" />
                                    </xsl:when>
                                    <xsl:when test="../../F/LR">
                                    	<xsl:value-of
								select="'https://w3id.org/arco/location/ShotLocation'" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
						</arco-location:hasLocationType>
					</xsl:if>
					<xsl:if test="./PRD or ../../F/LR/LRD">
						<tiapit:atTime>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeInterval/', $itemURI, '-time-interval-', position())" />
                            </xsl:attribute>
						</tiapit:atTime>
					</xsl:if>
					<!-- hasCircumstance for Shot Location (F) -->
					<xsl:if test="../../F/LR/LRO">
						<arco-cd:hasCircumstance>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(../../F/LR/LRO)))" />
                            </xsl:attribute>
						</arco-cd:hasCircumstance>
					</xsl:if>
				</rdf:Description>
				<xsl:if test="./TLC or ./TCL">
					<xsl:choose>
						<xsl:when
							test="lower-case(normalize-space(./TLC))='luogo di provenienza/collocazione precedente' or lower-case(normalize-space(./TCL))='luogo di provenienza' or lower-case(normalize-space(./TLC))='provenienza' or lower-case(normalize-space(./TCL))='provenienza'" />
						<xsl:when
							test="lower-case(normalize-space(./TLC))='luogo di produzione/realizzazione' or lower-case(normalize-space(./TCL))='luogo di esecuzione/fabbricazione'" />
						<xsl:when
							test="lower-case(normalize-space(./TLC))='luogo di reperimento' or lower-case(normalize-space(./TCL))='luogo di reperimento' or lower-case(normalize-space(./TLC))='reperimento' or lower-case(normalize-space(./TCL))='reperimento'" />
						<xsl:when
							test="lower-case(normalize-space(./TLC))='luogo di deposito' or lower-case(normalize-space(./TCL))='luogo di deposito' or lower-case(normalize-space(./TLC))='deposito temporaneo' or lower-case(normalize-space(./TCL))='deposito temporaneo' or lower-case(normalize-space(./TLC))='deposito' or lower-case(normalize-space(./TCL))='deposito'" />
						<xsl:when
							test="lower-case(normalize-space(./TLC))='luogo di esposizione' or lower-case(normalize-space(./TCL))='luogo di esposizione' or lower-case(normalize-space(./TLC))='espositiva' or lower-case(normalize-space(./TCL))='espositiva' or lower-case(normalize-space(./TLC))='espositivo' or lower-case(normalize-space(./TCL))='espositivo' or lower-case(normalize-space(./TLC))='esposizione' or lower-case(normalize-space(./TCL))='esposizione'" />
						<xsl:when
							test="lower-case(normalize-space(./TLC))='luogo di rilevamento' or lower-case(normalize-space(./TCL))='luogo di rilevamento' or lower-case(normalize-space(./TCL))='di rilevamento' or lower-case(normalize-space(./TLC))='di rilevamento' or lower-case(normalize-space(./TCL))='localizzazione di rilevamento' or lower-case(normalize-space(./TLC))='localizzazione di rilevamento'" />
						<xsl:when
							test="lower-case(normalize-space(./TLC))='area rappresentata' or lower-case(normalize-space(./TCL))='area rappresentata'" />
						<xsl:when test="./TLC and not(./TLC='.' or ./TLC='-' or ./TLC='/')">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./TLC)))" />
                                </xsl:attribute>
								<rdf:type rdf:resource="https://w3id.org/arco/location/LocationType" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(./TLC)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./TLC)" />
								</l0:name>
							</rdf:Description>
						</xsl:when>
						<xsl:when test="./TCL and not(./TCL='.' or ./TCL='-' or ./TCL='/')">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./TCL)))" />
                                </xsl:attribute>
								<rdf:type rdf:resource="https://w3id.org/arco/location/LocationType" />
								<rdfs:label>
									<xsl:value-of select="normalize-space(./TCL)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(./TCL)" />
								</l0:name>
							</rdf:Description>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<!-- Circumstance as individual for Shot Location (F) -->
				<xsl:if test="../../F/LR/LRO">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(../../F/LR/LRO)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/context-description/Circumstance'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(../../F/LR/LRO)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(../../F/LR/LRO)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Monumental Area as individual in the scope of the Site of LA -->
				<xsl:if
					test="./PRC/PRCC and not(lower-case(normalize-space(./PRC/PRCC))='nr' or lower-case(normalize-space(./PRC/PRCC))='n.r.' or lower-case(normalize-space(./PRC/PRCC))='nr (recupero pregresso)')">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'MonumentalArea/', arco-fn:urify(normalize-space(./PRC/PRCC)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'http://dati.beniculturali.it/cis/MonumentalArea'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./PRC/PRCC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(./PRC/PRCC)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Time Interval for Alternative Location and shot location (F) -->
				<xsl:if test="./PRD or ../../F/LR/LRD">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'TimeInterval/', $itemURI, '-time-interval-', position())" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/TI/TimeInteval'" />
                            </xsl:attribute>
						</rdf:type>
						<xsl:if test="PRD/PRDI">
							<tiapit:startTime>
								<xsl:value-of select="normalize-space(./PRD/PRDI)" />
							</tiapit:startTime>
						</xsl:if>
						<xsl:if test="PRD/PRDU">
							<tiapit:endTime>
								<xsl:value-of select="normalize-space(./PRD/PRDU)" />
							</tiapit:endTime>
						</xsl:if>
						<xsl:if test="../LR/LRD">
							<tiapit:time>
								<xsl:value-of select="normalize-space(../LR/LRD)" />
							</tiapit:time>
						</xsl:if>
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="schede/*/LC/PVC/*">
				<xsl:variable name="address">
					<xsl:value-of
						select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(schede/*/LC/PVC), normalize-space(schede/*/LC/PVL), normalize-space(schede/*/LC/LDC/LDCU)))))" />
				</xsl:variable>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
                        <xsl:value-of select="$address" />
                    </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="'https://w3id.org/italia/onto/CLV/Address'" />
                        </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:for-each select="schede/*/LC/PVC/*">
							<xsl:choose>
								<xsl:when test="position() = 1">
									<xsl:value-of select="./text()" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(', ', ./text())" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</rdfs:label>
					<xsl:if test="schede/*/LC/PVL">
						<arco-location:hasToponymInTime>
							<xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="schede/*/LC/PVL/PVLT">
                                        <xsl:value-of
								select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(schede/*/LC/PVL/PVLT)))" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of
								select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(schede/*/LC/PVL)))" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
						</arco-location:hasToponymInTime>
					</xsl:if>
					<xsl:if
						test="schede/*/LC/PVC/PVCI and not(schede/*/LC/PVC/PVCI='.' or schede/*/LC/PVC/PVCI='-' or schede/*/LC/PVC/PVCI='/')">
						<clvapit:fullAddress>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCI)" />
						</clvapit:fullAddress>
					</xsl:if>
					<xsl:if
						test="schede/*/LC/LDC/LDCU and not(schede/*/LC/LDC/LDCU='.' or schede/*/LC/LDC/LDCU='-' or schede/*/LC/LDC/LDCU='/')">
						<clvapit:fullAddress>
							<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCU)" />
						</clvapit:fullAddress>
					</xsl:if>
					<!-- Stato -->
					<xsl:if test="schede/*/LC/PVC/PVCS">
						<clvapit:hasCountry>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Country/', arco-fn:urify(schede/*/LC/PVC/PVCS))" />
                            </xsl:attribute>
						</clvapit:hasCountry>
					</xsl:if>
					<!-- Regione -->
					<xsl:if test="schede/*/LC/PVC/PVCR">
						<clvapit:hasRegion>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Region/', arco-fn:urify(schede/*/LC/PVC/PVCR))" />
                            </xsl:attribute>
						</clvapit:hasRegion>
					</xsl:if>
					<!-- Provincia -->
					<xsl:if test="schede/*/LC/PVC/PVCP">
						<clvapit:hasProvince>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Province/', arco-fn:urify(schede/*/LC/PVC/PVCP))" />
                            </xsl:attribute>
						</clvapit:hasProvince>
					</xsl:if>
					<!-- Comune -->
					<xsl:if test="schede/*/LC/PVC/PVCC">
						<clvapit:hasCity>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'City/', arco-fn:urify(schede/*/LC/PVC/PVCC))" />
                            </xsl:attribute>
						</clvapit:hasCity>
					</xsl:if>
					<!-- Località -->
					<xsl:if test="schede/*/LC/PVC/PVCL">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'AddressArea/', arco-fn:urify(schede/*/LC/PVC/PVCL))" />
                            </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
					<xsl:if test="schede/*/LC/PVC/PVCE">
						<clvapit:hasAddressArea>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'AddressArea/', arco-fn:urify(schede/*/LC/PVC/PVCE))" />
                            </xsl:attribute>
						</clvapit:hasAddressArea>
					</xsl:if>
				</rdf:Description>
				<!-- Toponym in Time as individual -->
				<xsl:if test="schede/*/LC/PVL">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:choose>
                                <xsl:when test="schede/*/LC/PVL/PVLT">
                                    <xsl:value-of
							select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(schede/*/LC/PVL/PVLT)))" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of
							select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(schede/*/LC/PVL)))" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/arco/location/ToponymInTime'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:choose>
								<xsl:when test="schede/*/LC/PVL/PVLT">
									<xsl:value-of select="normalize-space(schede/*/LC/PVL/PVLT)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(schede/*/LC/PVL)" />
								</xsl:otherwise>
							</xsl:choose>
						</rdfs:label>
						<l0:name>
							<xsl:choose>
								<xsl:when test="schede/*/LC/PVL/PVLT">
									<xsl:value-of select="normalize-space(schede/*/LC/PVL/PVLT)" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="normalize-space(schede/*/LC/PVL)" />
								</xsl:otherwise>
							</xsl:choose>
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Stato -->
				<xsl:if test="schede/*/LC/PVC/PVCS">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Country/', arco-fn:urify(schede/*/LC/PVC/PVCS))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/CLV/Country'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCS)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCS)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="schede/*/LC/PVC/PVCR">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Region/', arco-fn:urify(schede/*/LC/PVC/PVCR))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/CLV/Region'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCR)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCR)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="schede/*/LC/PVC/PVCP">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Province/', arco-fn:urify(schede/*/LC/PVC/PVCP))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/CLV/Province'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCP)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCP)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="schede/*/LC/PVC/PVCC">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'City/', arco-fn:urify(schede/*/LC/PVC/PVCC))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/CLV/City'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCC)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCC)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<!-- Address Area -->
				<xsl:if test="schede/*/LC/PVC/PVCL">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'AddressArea/', arco-fn:urify(schede/*/LC/PVC/PVCL))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCL)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCL)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:if test="schede/*/LC/PVC/PVCE">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'AddressArea/', arco-fn:urify(schede/*/LC/PVC/PVCE))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCE)" />
						</rdfs:label>
						<l0:name>
							<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCE)" />
						</l0:name>
					</rdf:Description>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="schede/*/LC/LDC/*">
						<xsl:variable name="site"
							select="concat($NS, 'Site/', arco-fn:urify(arco-fn:md5(concat(normalize-space(schede/*/LC/LDC), normalize-space(schede/*/LC/PVC)))))" />
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of select="$site" />
                            </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="'http://dati.beniculturali.it/cis/Site'" />
                                </xsl:attribute>
							</rdf:type>
							<xsl:choose>
								<xsl:when test="schede/*/LC/LDC/LDCN">
									<rdfs:label>
										<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCN)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCN)" />
									</l0:name>
								</xsl:when>
								<xsl:otherwise>
									<rdfs:label>Contenitore fisico</rdfs:label>
									<l0:name>Contenitore fisico</l0:name>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="schede/*/LC/PVC">
								<cis:siteAddress>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="$address" />
                                    </xsl:attribute>
								</cis:siteAddress>
							</xsl:if>
							<xsl:if test="schede/*/LC/LDC/LDCK">
								<arco-location:siteIdentifier>
									<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCK)" />
								</arco-location:siteIdentifier>
							</xsl:if>
							<xsl:if test="schede/*/LC/LDC/LDCM">
								<cis:isSiteOf>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                    </xsl:attribute>
								</cis:isSiteOf>
							</xsl:if>
							<xsl:if
								test="schede/*/LC/LDC/LDCC and not(lower-case(normalize-space(schede/*/LC/LDC/LDCC))='nr' or lower-case(normalize-space(schede/*/LC/LDC/LDCC))='n.r.' or lower-case(normalize-space(schede/*/LC/LDC/LDCC))='nr (recupero pregresso)')">
								<cis:isPartOf>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="concat($NS, 'MonumentalArea/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCC)))" />
                                    </xsl:attribute>
								</cis:isPartOf>
							</xsl:if>
							<!-- Site Type -->
							<xsl:if
								test="schede/*/LC/LDC/LDCT and not(normalize-space(schede/*/LC/LDC/LDCT)='.')">
								<arco-location:hasSiteType>
									<xsl:attribute name="rdf:resource">
                                        <xsl:choose>
                                        <!-- Valentina: tolto $itemURI da URI -->
                                            <xsl:when
										test="schede/*/LC/LDC/LDCQ">
                                                <xsl:value-of
										select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCT)), '-', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCQ)))" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
										select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCT)))" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
								</arco-location:hasSiteType>
							</xsl:if>
						</rdf:Description>
						<!-- Site Type as an individual -->
						<xsl:if
							test="schede/*/LC/LDC/LDCT and not(normalize-space(schede/*/LC/LDC/LDCT)='.')">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:choose>
                                        <xsl:when
									test="schede/*/LC/LDC/LDCQ">
                                            <xsl:value-of
									select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCT)), '-', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCQ)))" />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of
									select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCT)))" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="'https://w3id.org/arco/location/SiteType'" />
                                    </xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="it">
									<xsl:choose>
										<xsl:when test="schede/*/LC/LDC/LDCQ">
											<xsl:value-of
												select="concat('Tipo di contenitore fisico:', ' ', normalize-space(schede/*/LC/LDC/LDCT), ' ', normalize-space(schede/*/LC/LDC/LDCQ))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of
												select="concat('Tipo di contenitore fisico:', ' ', normalize-space(schede/*/LC/LDC/LDCT))" />
										</xsl:otherwise>
									</xsl:choose>
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:choose>
										<xsl:when test="schede/*/LC/LDC/LDCQ">
											<xsl:value-of
												select="concat('Tipo di contenitore fisico:', ' ', normalize-space(schede/*/LC/LDC/LDCT), ' ', normalize-space(schede/*/LC/LDC/LDCQ))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of
												select="concat('Tipo di contenitore fisico:', ' ', normalize-space(schede/*/LC/LDC/LDCT))" />
										</xsl:otherwise>
									</xsl:choose>
								</l0:name>
								<rdfs:label xml:lang="en">
									<xsl:choose>
										<xsl:when test="schede/*/LC/LDC/LDCQ">
											<xsl:value-of
												select="concat('Site type:', ' ', normalize-space(schede/*/LC/LDC/LDCT), ' ', normalize-space(schede/*/LC/LDC/LDCQ))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of
												select="concat('Site type:', ' ', normalize-space(schede/*/LC/LDC/LDCT))" />
										</xsl:otherwise>
									</xsl:choose>
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:choose>
										<xsl:when test="schede/*/LC/LDC/LDCQ">
											<xsl:value-of
												select="concat('Site type:', ' ', normalize-space(schede/*/LC/LDC/LDCT), ' ', normalize-space(schede/*/LC/LDC/LDCQ))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of
												select="concat('Site type:', ' ', normalize-space(schede/*/LC/LDC/LDCT))" />
										</xsl:otherwise>
									</xsl:choose>
								</l0:name>
								<arco-location:hasSiteDefinition>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="concat('https://w3id.org/arco/resource/SiteDefinition/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCT)))" />
                                    </xsl:attribute>
								</arco-location:hasSiteDefinition>
								<xsl:if test="schede/*/LC/LDC/LDCQ">
									<arco-location:hasSiteSpecification>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat('https://w3id.org/arco/resource/SiteSpecification/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCQ)))" />
                                        </xsl:attribute>
									</arco-location:hasSiteSpecification>
								</xsl:if>
							</rdf:Description>
						</xsl:if>
						<!-- Site Definition as an individual -->
						<xsl:if test="schede/*/LC/LDC/LDCT">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat('https://w3id.org/arco/resource/SiteDefinition/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCT)))" />
                                </xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="'https://w3id.org/arco/denotative-description/SiteDefinition'" />
                                    </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCT)" />
								</rdfs:label>
							</rdf:Description>
						</xsl:if>
						<!-- Site Specification as an individual -->
						<xsl:if test="schede/*/LC/LDC/LDCQ">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat('https://w3id.org/arco/resource/SiteSpecification/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCQ)))" />
                                </xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="'https://w3id.org/arco/denotative-description/SiteSpecification'" />
                                    </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCQ)" />
								</rdfs:label>
							</rdf:Description>
						</xsl:if>
						<!-- Monumental Area as individual -->
						<xsl:if
							test="schede/*/LC/LDC/LDCC and not(lower-case(normalize-space(schede/*/LC/LDC/LDCC))='nr' or lower-case(normalize-space(schede/*/LC/LDC/LDCC))='n.r.' or lower-case(normalize-space(schede/*/LC/LDC/LDCC))='nr (recupero pregresso)')">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'MonumentalArea/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCC)))" />
                                </xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="'http://dati.beniculturali.it/cis/MonumentalArea'" />
                                    </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCC)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCC)" />
								</l0:name>
							</rdf:Description>
						</xsl:if>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-current')" />
                            </xsl:attribute>
							<arco-location:atSite>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="$site" />
                                </xsl:attribute>
							</arco-location:atSite>
						</rdf:Description>
						<!-- rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of 
							select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), 
							'/', $itemURI)" /> </xsl:attribute> <arco-location:isInSite> <xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$site" /> </xsl:attribute> </arco-location:isInSite> </rdf:Description -->
						<!-- Cultural Institute or Site -->
						<xsl:if test="schede/*/LC/LDC/LDCM">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                </xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
                                    </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCM)" />
								</rdfs:label>
								<l0:name>
									<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCM)" />
								</l0:name>
								<cis:hasNameInTime>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="concat($NS, 'NameInTime/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                    </xsl:attribute>
								</cis:hasNameInTime>
								<cis:hasSite>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="$site" />
                                    </xsl:attribute>
								</cis:hasSite>
							</rdf:Description>
							<!-- Name in time -->
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'NameInTime/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                </xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="'http://dati.beniculturali.it/cis/NameInTime'" />
                                    </xsl:attribute>
								</rdf:type>
								<rdfs:label xml:lang="it">
									<xsl:value-of
										select="concat('Denominazione nel tempo: ', normalize-space(schede/*/LC/LDC/LDCM))" />
								</rdfs:label>
								<l0:name xml:lang="it">
									<xsl:value-of
										select="concat('Denominazione nel tempo: ', normalize-space(schede/*/LC/LDC/LDCM))" />
								</l0:name>
								<rdfs:label xml:lang="en">
									<xsl:value-of
										select="concat('Name in time: ', normalize-space(schede/*/LC/LDC/LDCM))" />
								</rdfs:label>
								<l0:name xml:lang="en">
									<xsl:value-of
										select="concat('Name in time: ', normalize-space(schede/*/LC/LDC/LDCM))" />
								</l0:name>
								<cis:institutionalName>
									<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCM)" />
								</cis:institutionalName>
							</rdf:Description>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="location"
							select="concat($NS, 'Feature/', arco-fn:urify(arco-fn:md5(normalize-space(schede/*/LC/PVC))))" />
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-current')" />
                            </xsl:attribute>
							<arco-location:atLocation>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="$location" />
                                </xsl:attribute>
							</arco-location:atLocation>
						</rdf:Description>
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of select="$location" />
                            </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="'https://w3id.org/italia/onto/CLV/Feature'" />
                                </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(schede/*/LC/PVC)" />
							</rdfs:label>
							<xsl:if test="schede/*/LC/PVC/*">
								<clvapit:hasAddress>
									<xsl:attribute name="rdf:resource">
                                    	<xsl:value-of
										select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(schede/*/LC/PVC), normalize-space(schede/*/LC/PVL), normalize-space(schede/*/LC/LDC/LDCU)))))" />
                                    </xsl:attribute>
								</clvapit:hasAddress>
							</xsl:if>
						</rdf:Description>
						<xsl:if test="schede/*/LC/PVC/*">
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                	<xsl:value-of
									select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(schede/*/LC/PVC), normalize-space(schede/*/LC/PVL), normalize-space(schede/*/LC/LDC/LDCU)))))" />
                				</xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="'https://w3id.org/italia/onto/CLV/Address'" />
                                    </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:for-each select="schede/*/LC/PVC/*">
										<xsl:choose>
											<xsl:when test="position() = 1">
												<xsl:value-of select="./text()" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="concat(', ', ./text())" />
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
								</rdfs:label>
								<!-- Aggiunto da Valentina - Address details <xsl:if test="schede/*/LC/PVC/PVCV"> 
									<arco-location:addressDetails> <xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCV)"" 
									/> </arco-location:addressDetails> -->
								<!-- Aggiunto da Valentina - Full Address - per issue github #8 <xsl:if 
									test="schede/*/LC/PVC/PVCI"> <clvapit:fullAddress> <xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCI)" 
									/> </clvapit:fullAddress> </xsl:if> <xsl:if test="schede/*/LC/LDC/LDCU"> 
									<clvapit:fullAddress> <xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCU)" 
									/> </clvapit:fullAddress> </xsl:if> -->
								<!-- Stato -->
								<xsl:if test="schede/*/LC/PVC/PVCS">
									<clvapit:hasCountry>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat($NS, 'Country/', arco-fn:urify(schede/*/LC/PVC/PVCS))" />
                                        </xsl:attribute>
									</clvapit:hasCountry>
								</xsl:if>
								<!-- Regione -->
								<xsl:if test="schede/*/LC/PVC/PVCR">
									<clvapit:hasRegion>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat($NS, 'Region/', arco-fn:urify(schede/*/LC/PVC/PVCR))" />
                                        </xsl:attribute>
									</clvapit:hasRegion>
								</xsl:if>
								<!-- Provincia -->
								<xsl:if test="schede/*/LC/PVC/PVCP">
									<clvapit:hasProvince>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat($NS, 'Province/', arco-fn:urify(schede/*/LC/PVC/PVCP))" />
                                        </xsl:attribute>
									</clvapit:hasProvince>
								</xsl:if>
								<!-- Comune -->
								<xsl:if test="schede/*/LC/PVC/PVCC">
									<clvapit:hasCity>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat($NS, 'City/', arco-fn:urify(schede/*/LC/PVC/PVCC))" />
                                        </xsl:attribute>
									</clvapit:hasCity>
								</xsl:if>
								<!-- Località -->
								<xsl:if test="schede/*/LC/PVC/PVCL">
									<clvapit:hasAddressArea>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat($NS, 'AddressArea/', arco-fn:urify(schede/*/LC/PVC/PVCL))" />
                                        </xsl:attribute>
									</clvapit:hasAddressArea>
								</xsl:if>
								<xsl:if
									test="schede/*/LC/PVC/PVCI and not(schede/*/LC/PVC/PVCI='.' or schede/*/LC/PVC/PVCI='-' or schede/*/LC/PVC/PVCI='/')">
									<clvapit:fullAddress>
										<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCI)" />
									</clvapit:fullAddress>
								</xsl:if>
								<xsl:if
									test="schede/*/LC/LDC/LDCU and not(schede/*/LC/LDC/LDCU='.' or schede/*/LC/LDC/LDCU='-' or schede/*/LC/LDC/LDCU='/')">
									<clvapit:fullAddress>
										<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCU)" />
									</clvapit:fullAddress>
								</xsl:if>
							</rdf:Description>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="schede/*/LA | schede/F/LR">
					<xsl:choose>
						<xsl:when test="./PRC/*">
							<xsl:variable name="site"
								select="concat($NS, 'Site/', arco-fn:urify(arco-fn:md5(concat(normalize-space(./PRC), normalize-space(./PRV)))))" />
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-alternative-', position())" />
                                </xsl:attribute>
								<arco-location:atSite>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="$site" />
                                    </xsl:attribute>
								</arco-location:atSite>
							</rdf:Description>
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of select="$site" />
                                </xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="'http://dati.beniculturali.it/cis/Site'" />
                                    </xsl:attribute>
								</rdf:type>
								<xsl:choose>
									<!-- Denominazione contenitore fisico in 4.00 -->
									<xsl:when test="./PRC/PRCN">
										<rdfs:label>
											<xsl:value-of select="normalize-space(./PRC/PRCN)" />
										</rdfs:label>
										<l0:name>
											<xsl:value-of select="normalize-space(./PRC/PRCN)" />
										</l0:name>
									</xsl:when>
									<!-- Denominazione contenitore fisico in normative precedenti a 
										4.00 -->
									<xsl:when test="./PRC/PRCD">
										<rdfs:label>
											<xsl:value-of select="normalize-space(./PRC/PRCD)" />
										</rdfs:label>
										<l0:name>
											<xsl:value-of select="normalize-space(./PRC/PRCD)" />
										</l0:name>
									</xsl:when>
									<xsl:otherwise>
										<rdfs:label>Contenitore fisico</rdfs:label>
										<l0:name>Contenitore fisico</l0:name>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="./PRV/*">
									<cis:siteAddress>
										<xsl:attribute name="rdf:resource">
                                        	<xsl:value-of
											select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(./PRV), normalize-space(./PRL), normalize-space(./PRC/PRCU)))))" />
                                        </xsl:attribute>
									</cis:siteAddress>
								</xsl:if>
								<xsl:if test="./PRC/PRCK">
									<arco-location:siteIdentifier>
										<xsl:value-of select="normalize-space(./PRC/PRCK)" />
									</arco-location:siteIdentifier>
								</xsl:if>
								<xsl:if test="./PRC/PRCM">
									<cis:isSiteOf>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:urify(normalize-space(./PRC/PRCM)))" />
                                        </xsl:attribute>
									</cis:isSiteOf>
								</xsl:if>
								<xsl:if
									test="./PRC/PRCC and not(lower-case(normalize-space(./PRC/PRCC))='nr' or lower-case(normalize-space(./PRC/PRCC))='n.r.' or lower-case(normalize-space(./PRC/PRCC))='nr (recupero pregresso)')">
									<cis:isPartOf>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat($NS, 'MonumentalArea/', arco-fn:urify(normalize-space(./PRC/PRCC)))" />
                                        </xsl:attribute>
									</cis:isPartOf>
								</xsl:if>
								<xsl:if test="./PRT/PRTK">
									<arco-location:hasContinent>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat($NS, 'Continent/', arco-fn:urify(normalize-space(./PRT/PRTK)))" />
                                        </xsl:attribute>
									</arco-location:hasContinent>
								</xsl:if>
								<!-- Site Type -->
								<xsl:if test="./PRC/PRCT and not(normalize-space(./PRC/PRCT)='.')">
									<arco-location:hasSiteType>
										<xsl:attribute name="rdf:resource">
                                            <xsl:choose>
                                                <xsl:when
											test="./PRC/PRCQ">
                                                    <xsl:value-of
											select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(./PRC/PRCT)), '-', arco-fn:urify(normalize-space(./PRC/PRCQ)))" />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of
											select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(./PRC/PRCT)))" />
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
									</arco-location:hasSiteType>
								</xsl:if>
							</rdf:Description>
							<!-- PRCM cultural institute or site as an individual -->
							<xsl:if test="./PRC/PRCM">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:urify(normalize-space(./PRC/PRCM)))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(./PRC/PRCM)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./PRC/PRCM)" />
									</l0:name>
									<cis:hasNameInTime>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat($NS, 'NameInTime/', arco-fn:urify(normalize-space(./PRC/PRCM)))" />
                                        </xsl:attribute>
									</cis:hasNameInTime>
									<cis:hasSite>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="$site" />
                                        </xsl:attribute>
									</cis:hasSite>
								</rdf:Description>
								<!-- Name in time of CIS -->
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'NameInTime/', arco-fn:urify(normalize-space(./PRC/PRCM)))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'http://dati.beniculturali.it/cis/NameInTime'" />
                                        </xsl:attribute>
									</rdf:type>
									<cis:institutionalName>
										<xsl:value-of select="normalize-space(./PRC/PRCM)" />
									</cis:institutionalName>
								</rdf:Description>
							</xsl:if>
							<!-- Site Type as an individual -->
							<xsl:if test="./PRC/PRCT and not(normalize-space(./PRC/PRCT)='.')">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                    <!-- tolto $itemURI dalle URI -->
                                        <xsl:choose>
                                            <xsl:when test="./PRC/PRCQ">
                                                <xsl:value-of
										select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(./PRC/PRCT)), '-', arco-fn:urify(normalize-space(./PRC/PRCQ)))" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
										select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(./PRC/PRCT)))" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/arco/location/SiteType'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label xml:lang="it">
										<xsl:choose>
											<xsl:when test="./PRC/PRCQ">
												<xsl:value-of
													select="concat('Tipo di contenitore fisico: ', normalize-space(./PRC/PRCT), ' ', normalize-space(./PRC/PRCQ))" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat('Tipo di contenitore fisico: ', normalize-space(./PRC/PRCT))" />
											</xsl:otherwise>
										</xsl:choose>
									</rdfs:label>
									<l0:name xml:lang="it">
										<xsl:choose>
											<xsl:when test="./PRC/PRCQ">
												<xsl:value-of
													select="concat('Tipo di contenitore fisico: ', normalize-space(./PRC/PRCT), ' ', normalize-space(./PRC/PRCQ))" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat('Tipo di contenitore fisico: ', normalize-space(./PRC/PRCT))" />
											</xsl:otherwise>
										</xsl:choose>
									</l0:name>
									<rdfs:label xml:lang="en">
										<xsl:choose>
											<xsl:when test="./PRC/PRCQ">
												<xsl:value-of
													select="concat('Site type: ', normalize-space(./PRC/PRCT), ' ', normalize-space(./PRC/PRCQ))" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat('Site type: ', normalize-space(./PRC/PRCT))" />
											</xsl:otherwise>
										</xsl:choose>
									</rdfs:label>
									<l0:name xml:lang="en">
										<xsl:choose>
											<xsl:when test="./PRC/PRCQ">
												<xsl:value-of
													select="concat('Site type: ', normalize-space(./PRC/PRCT), ' ', normalize-space(./PRC/PRCQ))" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of
													select="concat('Site type: ', normalize-space(./PRC/PRCT))" />
											</xsl:otherwise>
										</xsl:choose>
									</l0:name>
									<arco-location:hasSiteDefinition>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat('https://w3id.org/arco/resource/SiteDefinition/', arco-fn:urify(normalize-space(./PRC/PRCT)))" />
                                        </xsl:attribute>
									</arco-location:hasSiteDefinition>
									<xsl:if test="./PRC/PRCQ">
										<arco-location:hasSiteSpecification>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat('https://w3id.org/arco/resource/SiteSpecification/', arco-fn:urify(normalize-space(./PRC/PRCQ)))" />
                                            </xsl:attribute>
										</arco-location:hasSiteSpecification>
									</xsl:if>
								</rdf:Description>
							</xsl:if>
							<!-- Site Definition as an individual -->
							<xsl:if test="./PRC/PRCT">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat('https://w3id.org/arco/resource/SiteDefinition/', arco-fn:urify(normalize-space(./PRC/PRCT)))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/arco/denotative-description/SiteDefinition'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(./PRC/PRCT)" />
									</rdfs:label>
								</rdf:Description>
							</xsl:if>
							<!-- Site Specification as an individual -->
							<xsl:if test="./PRC/PRCQ">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat('https://w3id.org/arco/resource/SiteSpecification/', arco-fn:urify(normalize-space(./PRC/PRCQ)))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/arco/denotative-description/SiteSpecification'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(./PRC/PRCQ)" />
									</rdfs:label>
								</rdf:Description>
							</xsl:if>
							<!-- Continent as individual -->
							<xsl:if test="./PRT/PRTK">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'Continent/', arco-fn:urify(normalize-space(./PRT/PRTK)))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/arco/location/Continent'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(./PRT/PRTK)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./PRT/PRTK)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<xsl:if test="./PRV/*">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                    	<xsl:value-of
										select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(./PRV), normalize-space(./PRL), normalize-space(./PRC/PRCU)))))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/Address'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:for-each select="./PRV/*">
											<xsl:choose>
												<xsl:when test="position() = 1">
													<xsl:value-of select="./text()" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat(', ', ./text())" />
												</xsl:otherwise>
											</xsl:choose>
											<!-- xsl:value-of select="normalize-space(schede/*/OG/OGD)" / -->
										</xsl:for-each>
										<xsl:for-each select="./PRL/*">
											<xsl:value-of select="concat(', ', ./text())" />
										</xsl:for-each>
									</rdfs:label>
									<!-- ToponymInTime associated with schede/*/LA -->
									<xsl:if test="./PRL">
										<arco-location:hasToponymInTime>
											<xsl:attribute name="rdf:resource">
                                                <xsl:choose>
                                                    <xsl:when
												test="./PRL/PRLT">
                                                        <xsl:value-of
												select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./PRL/PRLT)))" />
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of
												select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./PRL)))" />
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:attribute>
										</arco-location:hasToponymInTime>
									</xsl:if>
									<xsl:if
										test="./PRC/PRCU and not(./PRC/PRCU='.' or ./PRC/PRCU='-' or ./PRC/PRCU='/')">
										<clvapit:fullAddress>
											<xsl:value-of select="normalize-space(./PRC/PRCU)" />
										</clvapit:fullAddress>
									</xsl:if>
									<!-- Stato -->
									<xsl:if test="./PRV/PRVS">
										<clvapit:hasCountry>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'Country/', arco-fn:urify(./PRV/PRVS))" />
                                            </xsl:attribute>
										</clvapit:hasCountry>
									</xsl:if>
									<!-- Regione -->
									<xsl:if test="./PRV/PRVR">
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVR))" />
                                            </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:if>
									<!-- Provincia -->
									<xsl:if test="./PRV/PRVP">
										<clvapit:hasProvince>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'Province/', arco-fn:urify(./PRV/PRVP))" />
                                            </xsl:attribute>
										</clvapit:hasProvince>
									</xsl:if>
									<!-- Comune -->
									<xsl:if test="./PRV/PRVC">
										<clvapit:hasCity>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'City/', arco-fn:urify(./PRV/PRVC))" />
                                            </xsl:attribute>
										</clvapit:hasCity>
									</xsl:if>
									<!-- Località -->
									<xsl:if test="./PRV/PRVL">
										<clvapit:hasAddressArea>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVL))" />
                                            </xsl:attribute>
										</clvapit:hasAddressArea>
									</xsl:if>
									<xsl:if test="./PRT/PRTL">
										<clvapit:hasAddressArea>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'AddressArea/', arco-fn:urify(./PRT/PRTL))" />
                                            </xsl:attribute>
										</clvapit:hasAddressArea>
									</xsl:if>
									<xsl:if test="./PRV/PRVE">
										<clvapit:hasAddressArea>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVE))" />
                                            </xsl:attribute>
										</clvapit:hasAddressArea>
									</xsl:if>
								</rdf:Description>
								<!-- Country -->
								<xsl:if test="./PRV/PRVS">
									<rdf:Description>
										<xsl:attribute name="rdf:about">
                                            <xsl:value-of
											select="concat($NS, 'Country/', arco-fn:urify(./PRV/PRVS))" />
                                        </xsl:attribute>
										<rdf:type>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="'https://w3id.org/italia/onto/CLV/Country'" />
                                            </xsl:attribute>
										</rdf:type>
										<rdfs:label>
											<xsl:value-of select="normalize-space(./PRV/PRVS)" />
										</rdfs:label>
										<l0:name>
											<xsl:value-of select="normalize-space(./PRV/PRVS)" />
										</l0:name>
									</rdf:Description>
								</xsl:if>
								<!-- Regione -->
								<xsl:if test="./PRV/PRVR">
									<rdf:Description>
										<xsl:attribute name="rdf:about">
                                            <xsl:value-of
											select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVR))" />
                                        </xsl:attribute>
										<rdf:type>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="'https://w3id.org/italia/onto/CLV/Region'" />
                                            </xsl:attribute>
										</rdf:type>
										<rdfs:label>
											<xsl:value-of select="normalize-space(./PRV/PRVR)" />
										</rdfs:label>
										<l0:name>
											<xsl:value-of select="normalize-space(./PRV/PRVR)" />
										</l0:name>
									</rdf:Description>
								</xsl:if>
								<!-- Provincia -->
								<xsl:if test="./PRV/PRVP">
									<rdf:Description>
										<xsl:attribute name="rdf:about">
                                            <xsl:value-of
											select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVP))" />
                                        </xsl:attribute>
										<rdf:type>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="'https://w3id.org/italia/onto/CLV/Province'" />
                                            </xsl:attribute>
										</rdf:type>
										<rdfs:label>
											<xsl:value-of select="normalize-space(./PRV/PRVP)" />
										</rdfs:label>
										<l0:name>
											<xsl:value-of select="normalize-space(./PRV/PRVP)" />
										</l0:name>
									</rdf:Description>
								</xsl:if>
								<!-- Comune -->
								<xsl:if test="./PRV/PRVC">
									<rdf:Description>
										<xsl:attribute name="rdf:about">
                                            <xsl:value-of
											select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVC))" />
                                        </xsl:attribute>
										<rdf:type>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="'https://w3id.org/italia/onto/CLV/City'" />
                                            </xsl:attribute>
										</rdf:type>
										<rdfs:label>
											<xsl:value-of select="normalize-space(./PRV/PRVC)" />
										</rdfs:label>
										<l0:name>
											<xsl:value-of select="normalize-space(./PRV/PRVC)" />
										</l0:name>
									</rdf:Description>
								</xsl:if>
								<!-- Località -->
								<xsl:if test="./PRV/PRVL">
									<rdf:Description>
										<xsl:attribute name="rdf:about">
                                            <xsl:value-of
											select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVL))" />
                                        </xsl:attribute>
										<rdf:type>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                                            </xsl:attribute>
										</rdf:type>
										<rdfs:label>
											<xsl:value-of select="normalize-space(./PRV/PRVL)" />
										</rdfs:label>
										<l0:name>
											<xsl:value-of select="normalize-space(./PRV/PRVL)" />
										</l0:name>
									</rdf:Description>
								</xsl:if>
								<xsl:if test="./PRT/PRTL">
									<rdf:Description>
										<xsl:attribute name="rdf:about">
                                            <xsl:value-of
											select="concat($NS, 'AddressArea/', arco-fn:urify(./PRT/PRTL))" />
                                        </xsl:attribute>
										<rdf:type>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                                            </xsl:attribute>
										</rdf:type>
										<rdfs:label>
											<xsl:value-of select="normalize-space(./PRT/PRTL)" />
										</rdfs:label>
										<l0:name>
											<xsl:value-of select="normalize-space(./PRT/PRTL)" />
										</l0:name>
									</rdf:Description>
								</xsl:if>
								<xsl:if test="./PRV/PRVE">
									<rdf:Description>
										<xsl:attribute name="rdf:about">
                                            <xsl:value-of
											select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVE))" />
                                        </xsl:attribute>
										<rdf:type>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                                            </xsl:attribute>
										</rdf:type>
										<rdfs:label>
											<xsl:value-of select="normalize-space(./PRV/PRVE)" />
										</rdfs:label>
										<l0:name>
											<xsl:value-of select="normalize-space(./PRV/PRVE)" />
										</l0:name>
									</rdf:Description>
								</xsl:if>
							</xsl:if>
							<!-- Toponym in Time as individual -->
							<xsl:if test="./PRL">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:choose>
                                            <xsl:when test="./PRL/PRLT">
                                                <xsl:value-of
										select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./PRL/PRLT)))" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
										select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./PRL)))" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/arco/location/ToponymInTime'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:choose>
											<xsl:when test="./PRL/PRLT">
												<xsl:value-of select="normalize-space(./PRL/PRLT)" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="normalize-space(./PRL)" />
											</xsl:otherwise>
										</xsl:choose>
									</rdfs:label>
									<l0:name>
										<xsl:choose>
											<xsl:when test="./PRL/PRLT">
												<xsl:value-of select="normalize-space(./PRL/PRLT)" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="normalize-space(./PRL)" />
											</xsl:otherwise>
										</xsl:choose>
									</l0:name>
									<!-- TODO: PRL/PRLR never exists in XML data we have. -->
									<xsl:if test="./PRL/PRLR">
										<tiapit:atTime />
									</xsl:if>
								</rdf:Description>
							</xsl:if>
							<!-- Valentina - unfixed bug: it doesn't generate the resource ToponymInTime 
								for LRL or LRCF (tested on ICCD8532322.xml -->
							<xsl:if test="../../F/LR/LRL">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                       <xsl:value-of
										select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(../../F/LR/LRL)))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/arco/location/ToponymInTime'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(../../F/LR/LRL)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(../../F/LR/LRL)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<xsl:if test="../../F/LR/LRC/LRCF">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                       <xsl:value-of
										select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(../../F/LR/LRC/LRCF)))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/arco/location/ToponymInTime'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCF)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCF)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<!-- rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of 
								select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-current')" 
								/> </xsl:attribute> <arco-location:atSite> <xsl:attribute name="rdf:resource"> 
								<xsl:value-of select="$site" /> </xsl:attribute> </arco-location:atSite> </rdf:Description -->
							<!-- rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of 
								select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), 
								'/', $itemURI)" /> </xsl:attribute> <arco-location:isInSite> <xsl:attribute name="rdf:resource"> 
								<xsl:value-of select="$site" /> </xsl:attribute> </arco-location:isInSite> </rdf:Description -->
							<!-- Cultural Institute or Site -->
							<xsl:if test="schede/*/LC/LDC/LDCM">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCM)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCM)" />
									</l0:name>
									<cis:hasNameInTime>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat($NS, 'NameInTime/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                        </xsl:attribute>
									</cis:hasNameInTime>
									<cis:hasSite>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="$site" />
                                        </xsl:attribute>
									</cis:hasSite>
								</rdf:Description>
								<!-- Name in time -->
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'NameInTime/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'http://dati.beniculturali.it/cis/NameInTime'" />
                                        </xsl:attribute>
									</rdf:type>
									<cis:institutionalName>
										<xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCM)" />
									</cis:institutionalName>
								</rdf:Description>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:variable name="location">
								<xsl:if test="./PRV">
									<xsl:value-of
										select="concat($NS, 'Feature/', arco-fn:urify(arco-fn:md5(normalize-space(./PRV))))" />
								</xsl:if>
								<xsl:if test="../../F/LR">
									<xsl:value-of
										select="concat($NS, 'Feature/', arco-fn:urify(arco-fn:md5(normalize-space(../../F/LR/LRC))))" />
								</xsl:if>
							</xsl:variable>
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of
									select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-alternative-', position())" />
                                </xsl:attribute>
								<arco-location:atLocation>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="$location" />
                                    </xsl:attribute>
								</arco-location:atLocation>
							</rdf:Description>
							<rdf:Description>
								<xsl:attribute name="rdf:about">
                                    <xsl:value-of select="$location" />
                                </xsl:attribute>
								<rdf:type>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="'https://w3id.org/italia/onto/CLV/Feature'" />
                                    </xsl:attribute>
								</rdf:type>
								<rdfs:label>
									<xsl:if test="./PRV">
										<xsl:value-of select="normalize-space(./PRV)" />
									</xsl:if>
									<xsl:if test="../../F/LR">
										<xsl:value-of select="normalize-space(../../F/LR/LRC)" />
									</xsl:if>
								</rdfs:label>
								<xsl:if test="./PRV/*">
									<clvapit:hasAddress>
										<xsl:attribute name="rdf:resource">
                                        	<xsl:value-of
											select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(./PRV), normalize-space(./PRC/PRL), normalize-space(./PRC/PRCU)))))" />
                                        </xsl:attribute>
									</clvapit:hasAddress>
								</xsl:if>
								<xsl:if test="../../F/LR/*">
									<clvapit:hasAddress>
										<xsl:attribute name="rdf:resource">
                                        	<xsl:value-of
											select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(../../F/LR/LRC), normalize-space(../../F/LR/LRL)))))" />
                                        </xsl:attribute>
									</clvapit:hasAddress>
								</xsl:if>
								<xsl:if test="./PRT/PRTK">
									<arco-location:hasContinent>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="concat($NS, 'Continent/', arco-fn:urify(arco-fn:md5(normalize-space(./PRT/PRTK))))" />
                                        </xsl:attribute>
									</arco-location:hasContinent>
								</xsl:if>
								<xsl:if test="./PRL">
									<arco-location:hasToponymInTime>
										<xsl:attribute name="rdf:resource">
                                                <xsl:choose>
                                                    <xsl:when
											test="./PRL/PRLT">
                                                        <xsl:value-of
											select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./PRL/PRLT)))" />
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of
											select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./PRL)))" />
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:attribute>
									</arco-location:hasToponymInTime>
								</xsl:if>
								<xsl:if test="../../F/LR/LRL">
									<arco-location:hasToponymInTime>
										<xsl:attribute name="rdf:resource">
                                            	<xsl:value-of
											select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(../../F/LR/LRL)))" />
                                            </xsl:attribute>
									</arco-location:hasToponymInTime>
								</xsl:if>
								<xsl:if test="../../F/LR/LRC/LRCF">
									<arco-location:hasToponymInTime>
										<xsl:attribute name="rdf:resource">
                                            	<xsl:value-of
											select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(../../F/LR/LRC/LRCF)))" />
                                            </xsl:attribute>
									</arco-location:hasToponymInTime>
								</xsl:if>
							</rdf:Description>
							<!-- Continent as individual -->
							<xsl:if test="./PRT/PRTK">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                    <xsl:value-of
										select="concat($NS, 'Continent/', arco-fn:urify(arco-fn:md5(normalize-space(./PRT/PRTK))))" />
                                </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
											select="'https://w3id.org/arco/location/Continent'" />
                                    </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(./PRT/PRTK)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./PRT/PRTK)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<xsl:if test="./PRV/* | ../../F/LR/LRC/*">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                    	<xsl:choose>
                                    		<xsl:when
										test="./PRC/PRCU and not(./PRC/PRCU='.' or ./PRC/PRCU='-' or ./PRC/PRCU='/')">
                                    			<xsl:value-of
										select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(./PRV), normalize-space(./PRC/PRCU)))))" />
                                    		</xsl:when>
                                    		<xsl:when test="../../F/LR/LRC/*">
                                    			<xsl:value-of
										select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(../../F/LR/LRC), normalize-space(../../F/LR/LRL)))))" />
                                    		</xsl:when>
                                    		<xsl:otherwise>
                                    			<xsl:value-of
										select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(normalize-space(./PRV))))" />
                                    		</xsl:otherwise>
                                    	</xsl:choose>
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/Address'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:for-each select="./PRV/*">
											<xsl:choose>
												<xsl:when test="position() = 1">
													<xsl:value-of select="./text()" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat(', ', ./text())" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
										<xsl:for-each select="../../F/LR/LRC/*">
											<xsl:choose>
												<xsl:when test="position() = 1">
													<xsl:value-of select="./text()" />
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="concat(', ', ./text())" />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
									</rdfs:label>
									<!-- Aggiunto da Valentina - Address details <xsl:if test="schede/*/LC/PVC/PVCV"> 
										<arco-location:addressDetails> <xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCV)"" 
										/> </arco-location:addressDetails> -->
									<!-- Aggiunto da Valentina - Full Address - per issue github #8 
										<xsl:if test="schede/*/LC/PVC/PVCI"> <clvapit:fullAddress> <xsl:value-of 
										select="normalize-space(schede/*/LC/PVC/PVCI)" /> </clvapit:fullAddress> 
										</xsl:if> <xsl:if test="schede/*/LC/LDC/LDCU"> <clvapit:fullAddress> <xsl:value-of 
										select="normalize-space(schede/*/LC/LDC/LDCU)" /> </clvapit:fullAddress> 
										</xsl:if> -->
									<!-- Stato -->
									<xsl:if test="./PRV/PRVS">
										<clvapit:hasCountry>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'Country/', arco-fn:urify(./PRV/PRVS))" />
                                            </xsl:attribute>
										</clvapit:hasCountry>
									</xsl:if>
									<xsl:if test="../../F/LR/LRC/LRCS">
										<clvapit:hasCountry>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'Country/', arco-fn:urify(../../F/LR/LRC/LRCS))" />
                                            </xsl:attribute>
										</clvapit:hasCountry>
									</xsl:if>
									<!-- Regione -->
									<xsl:if test="./PRV/PRVR">
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVR))" />
                                            </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:if>
									<xsl:if test="../../F/LR/LRC/LRCR">
										<clvapit:hasRegion>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'Region/', arco-fn:urify(../../F/LR/LRC/LRCR))" />
                                            </xsl:attribute>
										</clvapit:hasRegion>
									</xsl:if>
									<!-- Provincia -->
									<xsl:if test="./PRV/PRVP">
										<clvapit:hasProvince>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'Province/', arco-fn:urify(./PRV/PRVP))" />
                                            </xsl:attribute>
										</clvapit:hasProvince>
									</xsl:if>
									<xsl:if test="../../F/LR/LRC/LRCP">
										<clvapit:hasProvince>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'Province/', arco-fn:urify(../../F/LR/LRC/LRCP))" />
                                            </xsl:attribute>
										</clvapit:hasProvince>
									</xsl:if>
									<!-- Comune -->
									<xsl:if test="./PRV/PRVC">
										<clvapit:hasCity>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'City/', arco-fn:urify(./PRV/PRVC))" />
                                            </xsl:attribute>
										</clvapit:hasCity>
									</xsl:if>
									<xsl:if test="../../F/LR/LRC/LRCC">
										<clvapit:hasCity>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'City/', arco-fn:urify(../../F/LR/LRC/LRCC))" />
                                            </xsl:attribute>
										</clvapit:hasCity>
									</xsl:if>
									<!-- Località -->
									<xsl:if test="./PRV/PRVL">
										<clvapit:hasAddressArea>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVL))" />
                                            </xsl:attribute>
										</clvapit:hasAddressArea>
									</xsl:if>
									<xsl:if test="./PRT/PRTL">
										<clvapit:hasAddressArea>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'AddressArea/', arco-fn:urify(./PRT/PRTL))" />
                                            </xsl:attribute>
										</clvapit:hasAddressArea>
									</xsl:if>
									<xsl:if test="./PRV/PRVE">
										<clvapit:hasAddressArea>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVE))" />
                                            </xsl:attribute>
										</clvapit:hasAddressArea>
									</xsl:if>
									<xsl:if test="../../F/LR/LRC/LRCL">
										<clvapit:hasAddressArea>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'AddressArea/', arco-fn:urify(../../F/LR/LRC/LRCL))" />
                                            </xsl:attribute>
										</clvapit:hasAddressArea>
									</xsl:if>
									<xsl:if test="../../F/LR/LRA">
										<clvapit:hasAddressArea>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'AddressArea/', arco-fn:urify(../../F/LR/LRA))" />
                                            </xsl:attribute>
										</clvapit:hasAddressArea>
									</xsl:if>
									<xsl:if test="../../F/LR/LRC/LRCE">
										<clvapit:hasAddressArea>
											<xsl:attribute name="rdf:resource">
                                                <xsl:value-of
												select="concat($NS, 'AddressArea/', arco-fn:urify(../../F/LR/LRC/LRCE))" />
                                            </xsl:attribute>
										</clvapit:hasAddressArea>
									</xsl:if>
									<xsl:if
										test="./PRC/PRCU and not(./PRC/PRCU='.' or ./PRC/PRCU='-' or ./PRC/PRCU='/')">
										<clvapit:fullAddress>
											<xsl:value-of select="normalize-space(./PRC/PRCU)" />
										</clvapit:fullAddress>
									</xsl:if>
								</rdf:Description>
							</xsl:if>
							<!-- Country LA -->
							<xsl:if test="./PRV/PRVS">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'Country/', arco-fn:urify(./PRV/PRVS))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/Country'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(./PRV/PRVS)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./PRV/PRVS)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<!-- Country LR -->
							<xsl:if test="../../F/LR/LRC/LRCS">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'Country/', arco-fn:urify(../../F/LR/LRC/LRCS))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/Country'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCS)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCS)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<!-- Region LA -->
							<xsl:if test="./PRV/PRVR">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVR))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/Region'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(./PRV/PRVR)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./PRV/PRVR)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<!-- Region LR -->
							<xsl:if test="../../F/LR/LRC/LRCR">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'Region/', arco-fn:urify(../../F/LR/LRC/LRCR))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/Region'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCR)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCR)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<!-- Province LA -->
							<xsl:if test="./PRV/PRVP">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'Province/', arco-fn:urify(./PRV/PRVP))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/Province'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(./PRV/PRVP)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./PRV/PRVP)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<!-- Province LR -->
							<xsl:if test="../../F/LR/LRC/LRCP">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'Province/', arco-fn:urify(../../F/LR/LRC/LRCP))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/Province'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCP)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCP)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<!-- City LA -->
							<xsl:if test="./PRV/PRVC">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVC))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/City'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(./PRV/PRVC)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./PRV/PRVC)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<!-- City LR -->
							<xsl:if test="../../F/LR/LRC/LRCC">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'Region/', arco-fn:urify(../../F/LR/LRC/LRCC))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/City'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCC)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCC)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<!-- Località (Address Area) LA -->
							<xsl:if test="./PRV/PRVL">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVL))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(./PRV/PRVL)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./PRV/PRVL)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<xsl:if test="./PRT/PRTL">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'AddressArea/', arco-fn:urify(./PRT/PRTL))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(./PRT/PRTL)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./PRT/PRTL)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<xsl:if test="./PRV/PRVE">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVE))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(./PRV/PRVE)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(./PRV/PRVE)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<!-- Località (Address Area) LR -->
							<xsl:if test="../../F/LR/LRC/LRCL">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'AddressArea/', arco-fn:urify(../../F/LR/LRC/LRCL))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCL)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCL)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<xsl:if test="../../F/LR/LRC/LRCE">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'AddressArea/', arco-fn:urify(../../F/LR/LRC/LRCE))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCE)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(../../F/LR/LRC/LRCE)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
							<xsl:if test="../../F/LR/LRA">
								<rdf:Description>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'AddressArea/', arco-fn:urify(../../F/LR/LRA))" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
                                        </xsl:attribute>
									</rdf:type>
									<rdfs:label>
										<xsl:value-of select="normalize-space(../../F/LR/LRA)" />
									</rdfs:label>
									<l0:name>
										<xsl:value-of select="normalize-space(../../F/LR/LRA)" />
									</l0:name>
								</rdf:Description>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- xsl:otherwise> <rdf:Description> <xsl:attribute name="rdf:about"> 
					<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), 
					'/', $itemURI)" /> </xsl:attribute> <cis:siteAddress> <xsl:attribute name="rdf:resource"> 
					<xsl:value-of select="$address" /> </xsl:attribute> </cis:siteAddress> </rdf:Description> 
					</xsl:otherwise -->
			</xsl:if>
			<!-- We create the cultural event or the exhibition - norm version 4.00 -->
			<xsl:for-each select="schede/*/MS/MST">
				<rdf:Description>
					<xsl:choose>
						<xsl:when test="./MSTI">
							<xsl:choose>
								<xsl:when test="./MSTI='mostra'">
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'Exhibition/', $itemURI, '-', position())" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'https://w3id.org/arco/cultural-event/Exhibition'" />
                                        </xsl:attribute>
									</rdf:type>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="rdf:about">
                                        <xsl:value-of
										select="concat($NS, 'CulturalEvent/', $itemURI, '-', position())" />
                                    </xsl:attribute>
									<rdf:type>
										<xsl:attribute name="rdf:resource">
                                            <xsl:value-of
											select="'http://dati.beniculturali.it/cis/CulturalEvent'" />
                                        </xsl:attribute>
									</rdf:type>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of
								select="concat($NS, 'CulturalEvent/', $itemURI, '-', position())" />
                            </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="'http://dati.beniculturali.it/cis/CulturalEvent'" />
                                </xsl:attribute>
							</rdf:type>
						</xsl:otherwise>
					</xsl:choose>
					<cis:involves>
						<xsl:attribute name="rdf:resource">
                            <xsl:value-of
							select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                        </xsl:attribute>
					</cis:involves>
					<!-- Event name -->
					<xsl:if test="./MSTT">
						<l0:name>
							<xsl:value-of select="normalize-space(./MSTT)" />
						</l0:name>
						<rdfs:label>
							<xsl:value-of select="normalize-space(./MSTT)" />
						</rdfs:label>
					</xsl:if>
					<!-- Event organizer -->
					<xsl:for-each select="./MSTE">
						<cis:isRelatedToRiT>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
                            </xsl:attribute>
						</cis:isRelatedToRiT>
						<arco-ce:hasEventOrganiser>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                            </xsl:attribute>
						</arco-ce:hasEventOrganiser>
					</xsl:for-each>
					<!-- Event location and time -->
					<xsl:for-each select="./MSTL">
						<arco-ce:eventTimeLocation>
							<xsl:value-of select="normalize-space(.)" />
						</arco-ce:eventTimeLocation>
					</xsl:for-each>
					<!-- Event notes -->
					<xsl:if test="./MSTS">
						<arco-core:note>
							<xsl:value-of select="normalize-space(./MSTS)" />
						</arco-core:note>
					</xsl:if>
				</rdf:Description>
				<!-- Event organizer - Time Indexed Role -->
				<xsl:for-each select="./MSTE">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                            </xsl:attribute>
						</rdf:type>
						<roapit:withRole>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Role/Organiser')" />
                            </xsl:attribute>
						</roapit:withRole>
						<roapit:isRoleInTimeOf>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                            </xsl:attribute>
						</roapit:isRoleInTimeOf>
					</rdf:Description>
					<!-- Event organizer - Role -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Role/Organiser')" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/RO/Role'" />
                            </xsl:attribute>
						</rdf:type>
						<rdfs:label xml:lang="en">
							<xsl:value-of select="'Organiser'" />
						</rdfs:label>
						<rdfs:label xml:lang="it">
							<xsl:value-of select="'Ente/Soggetto organizzatore'" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of select="'Ente/Soggetto organizzatore'" />
						</l0:name>
						<l0:name xml:lang="en">
							<xsl:value-of select="'Organiser'" />
						</l0:name>
					</rdf:Description>
					<!-- Event organizer - Agent -->
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'https://w3id.org/italia/onto/l0/Agent'" />
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
			<!-- We create the cultural event or the exhibition - norm version 3.00 -->
			<xsl:for-each select="schede/*/DO/MST">
				<xsl:if test="./*">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
                            <xsl:value-of
							select="concat($NS, 'CulturalEvent/', $itemURI, '-', position())" />
                        </xsl:attribute>
						<rdf:type>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="'http://dati.beniculturali.it/cis/CulturalEvent'" />
                            </xsl:attribute>
						</rdf:type>
						<cis:involves>
							<xsl:attribute name="rdf:resource">
                                <xsl:value-of
								select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                            </xsl:attribute>
						</cis:involves>
						<!-- Event name -->
						<xsl:if test="./MSTT">
							<l0:name>
								<xsl:value-of select="normalize-space(./MSTT)" />
							</l0:name>
							<rdfs:label>
								<xsl:value-of select="normalize-space(./MSTT)" />
							</rdfs:label>
						</xsl:if>
						<!-- Event organizer -->
						<xsl:if test="./MSTO">
							<xsl:for-each select="./MSTO">
								<cis:isRelatedToRiT>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
                                    </xsl:attribute>
								</cis:isRelatedToRiT>
								<arco-ce:hasEventOrganiser>
									<xsl:attribute name="rdf:resource">
                                        <xsl:value-of
										select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                                    </xsl:attribute>
								</arco-ce:hasEventOrganiser>
							</xsl:for-each>
						</xsl:if>
						<!-- Event time -->
						<xsl:for-each select="./MSTD">
							<tiapit:time>
								<xsl:value-of select="normalize-space(.)" />
							</tiapit:time>
						</xsl:for-each>
						<!-- Event location -->
						<xsl:for-each select="./MSTL">
							<xsl:choose>
								<xsl:when test="$sheetVersion='3.01_ICCD0' or $sheetVersion='3.01'">
									<arco-ce:eventTimeLocation>
										<xsl:value-of select="normalize-space(.)" />
									</arco-ce:eventTimeLocation>
								</xsl:when>
								<xsl:otherwise>
									<arco-core:hasLocation>
										<xsl:attribute name="rdf:resource">
		                                   <xsl:value-of
											select="concat($NS, 'GeographicalFeature/', arco-fn:urify(normalize-space(.)))" />
		                               </xsl:attribute>
									</arco-core:hasLocation>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<!-- Event site -->
						<xsl:for-each select="./MSTS">
							<cis:isHostedBy>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="concat($NS, 'Site/', arco-fn:urify(arco-fn:md5(normalize-space(.))))" />
                                </xsl:attribute>
							</cis:isHostedBy>
						</xsl:for-each>
					</rdf:Description>
					<!-- Event site -->
					<xsl:for-each select="./MSTS">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of
								select="concat($NS, 'Site/', arco-fn:urify(arco-fn:md5(normalize-space(.))))" />
                            </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="'http://dati.beniculturali.it/cis/Site'" />
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
					<!-- Event organizer - Time Indexed Role -->
					<xsl:for-each select="./MSTO">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of
								select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
                            </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                                </xsl:attribute>
							</rdf:type>
							<roapit:withRole>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="concat($NS, 'Role/Organiser')" />
                                </xsl:attribute>
							</roapit:withRole>
							<roapit:isRoleInTimeOf>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                                </xsl:attribute>
							</roapit:isRoleInTimeOf>
						</rdf:Description>
						<!-- Event organizer - Role -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of
								select="concat($NS, 'Role/Organiser')" />
                            </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="'https://w3id.org/italia/RO/Role'" />
                                </xsl:attribute>
							</rdf:type>
							<rdfs:label xml:lang="it">
								<xsl:value-of select="'Ente/Soggetto organizzatore'" />
							</rdfs:label>
							<l0:name xml:lang="it">
								<xsl:value-of select="'Ente/Soggetto organizzatore'" />
							</l0:name>
							<rdfs:label xml:lang="en">
								<xsl:value-of select="'Organiser'" />
							</rdfs:label>
							<l0:name xml:lang="en">
								<xsl:value-of select="'Organiser'" />
							</l0:name>
						</rdf:Description>
						<!-- Event organizer - Agent -->
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of
								select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                            </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="'https://w3id.org/italia/onto/l0/Agent'" />
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
					<!-- Event location -->
					<xsl:for-each select="./MSTL">
						<rdf:Description>
							<xsl:attribute name="rdf:about">
                                <xsl:value-of
								select="concat($NS, 'GeographicalFeature/', arco-fn:urify(normalize-space(.)))" />
                            </xsl:attribute>
							<rdf:type>
								<xsl:attribute name="rdf:resource">
                                    <xsl:value-of
									select="'http://dati.beniculturali.it/cis/GeographicalFeature'" />
                                </xsl:attribute>
							</rdf:type>
							<rdfs:label>
								<xsl:value-of select="normalize-space(.)" />
							</rdfs:label>
						</rdf:Description>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>

			<!-- The individual typed as RelatedWorkSituation is created here (cf. 
				rule #RWS in component.xslt). -->
			<xsl:for-each select="schede/*/RV/RSE">
				<xsl:if test="./*">
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:value-of
							select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-related-cultural-property-', position())" />
						</xsl:attribute>
						<rdf:type rdf:resource="https://w3id.org/arco/context-description/RelatedWorkSituation" />
						<rdfs:label xml:lang="it">
							<xsl:value-of
								select="concat('Relazione ', position(), ' tra il bene culturale ', $itemURI, ' e altro bene culturale')" />
						</rdfs:label>
						<l0:name xml:lang="it">
							<xsl:value-of
								select="concat('Relazione ', position(), ' tra il bene culturale ', $itemURI, ' e altro bene culturale')" />
						</l0:name>
						<rdfs:label xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and other cultural property')" />
						</rdfs:label>
						<l0:name xml:lang="en">
							<xsl:value-of
								select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and other cultural property')" />
						</l0:name>

						<xsl:choose>
							<xsl:when test="lower-case(normalize-space(./RSER))='è in relazione con' 
							or lower-case(normalize-space(./RSER))='scheda altra fotografia'
							or lower-case(normalize-space(./RSER))='scheda opera raffigurata'
							or lower-case(normalize-space(./RSER))='nr (recupero pregresso)'">
								<arco-cd:hasRelatedWork>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of
										select="arco-fn:related-property(normalize-space(./RSEC), 'foaf')" />
									</xsl:attribute>
								</arco-cd:hasRelatedWork>
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./RSER))='è contenuto in' 
							or lower-case(normalize-space(./RSER))='luogo di collocazione/localizzazione'
							or lower-case(normalize-space(./RSER))='scheda contenitore'">
								<arco-cd:isLocatedIn>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="arco-fn:related-property(normalize-space(./RSEC), 'foaf')" />
								</xsl:attribute>
							</arco-cd:isLocatedIn>
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./RSER))='era contenuto in' 
							or lower-case(normalize-space(./RSER))='luogo di provenienza'">
								<arco-cd:wasLocatedIn>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="arco-fn:related-property(normalize-space(./RSEC), 'foaf')" />
								</xsl:attribute>
							</arco-cd:wasLocatedIn>
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./RSER))='esecuzione/evento di riferimento' 
							or lower-case(normalize-space(./RSER))='è coinvolto in'">
								<arco-cd:isInvolvedIn>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="arco-fn:related-property(normalize-space(./RSEC), 'foaf')" />
								</xsl:attribute>
							</arco-cd:isInvolvedIn>
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./RSER))='sede di realizzazione' 
							or lower-case(normalize-space(./RSER))='è stato realizzato in'">
								<arco-cd:wasCreatedAt>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="arco-fn:related-property(normalize-space(./RSEC), 'foaf')" />
								</xsl:attribute>
							</arco-cd:wasCreatedAt>
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./RSER))='bene composto' 
							or lower-case(normalize-space(./RSER))='è compreso in'">
								<arco-cd:isReusedBy>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="arco-fn:related-property(normalize-space(./RSEC), 'foaf')" />
								</xsl:attribute>
							</arco-cd:isReusedBy>
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./RSER))='fonte di rappresentazione' 
							or lower-case(normalize-space(./RSER))='è rappresentato in'">
								<arco-cd:isSubjectOf>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="arco-fn:related-property(normalize-space(./RSEC), 'foaf')" />
								</xsl:attribute>
							</arco-cd:isSubjectOf>
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./RSER))='relazione urbanistico ambientale' 
							or lower-case(normalize-space(./RSER))='è in relazione urbanistico - ambientale con'">
								<arco-cd:hasUrbanPlanningEnvironmentalRelationWith>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="arco-fn:related-property(normalize-space(./RSEC), 'foaf')" />
								</xsl:attribute>
							</arco-cd:hasUrbanPlanningEnvironmentalRelationWith>
							</xsl:when>
							<xsl:when test="lower-case(normalize-space(./RSER))='sede di rinvenimento' 
							or lower-case(normalize-space(./RSER))='è stato rinvenuto in'">
								<arco-cd:wasRediscoveredAt>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of
									select="arco-fn:related-property(normalize-space(./RSEC), 'foaf')" />
								</xsl:attribute>
							</arco-cd:wasRediscoveredAt>
							</xsl:when>
							<xsl:otherwise>
								<arco-cd:hasRelatedWork>
									<xsl:attribute name="rdf:resource">
										<xsl:value-of
										select="arco-fn:related-property(normalize-space(./RSEC), 'foaf')" />
									</xsl:attribute>
								</arco-cd:hasRelatedWork>
							</xsl:otherwise>
						</xsl:choose>
						
						
					</rdf:Description>
				</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="schede/*/RV/ROZ">

				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of
						select="concat($NS, 'RelatedWorkSituation/', $itemURI, '-related-cultural-property-', position())" />
					</xsl:attribute>
					<rdf:type rdf:resource="https://w3id.org/arco/context-description/RelatedWorkSituation" />
					<rdfs:label xml:lang="it">
						<xsl:value-of
							select="concat('Relazione ', position(), ' tra il bene culturale ', $itemURI, ' e altro bene culturale')" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of
							select="concat('Relazione ', position(), ' tra il bene culturale ', $itemURI, ' e altro bene culturale')" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of
							select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and other cultural property')" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of
							select="concat('Relation ', position(), ' between the cultural property ', $itemURI, ' and other cultural property')" />
					</l0:name>

					<xsl:for-each select="arco-fn:related-property(normalize-space(.), '')">
						<arco-cd:hasRelatedWork>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="." />
							</xsl:attribute>
						</arco-cd:hasRelatedWork>
					</xsl:for-each>


				</rdf:Description>
			</xsl:for-each>
		</rdf:RDF>
	</xsl:template>
</xsl:stylesheet>