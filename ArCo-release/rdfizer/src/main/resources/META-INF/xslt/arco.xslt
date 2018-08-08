<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:arco="https://w3id.org/arco/core/" xmlns:arco-fn="http://w3id.org/arco/saxon-extension" xmlns:cataloguerecord="https://w3id.org/arco/catalogue/" xmlns:cis="http://dati.beniculturali.it/cis/" xmlns:clvapit="https://w3id.org/italia/onto/CLV/" xmlns:cpdescription="https://w3id.org/arco/objective/" xmlns:culturaldefinition="https://w3id.org/arco/subjective/" xmlns:culturalevent="https://w3id.org/arco/culturalevent/" xmlns:dcterms="http://purl.org/dc/terms/creator" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:frbr="http://purl.org/vocab/frbr/core#" xmlns:identifier="https://w3id.org/arco/identifier/" xmlns:l0="https://w3id.org/italia/onto/l0/" xmlns:locgeoamm="https://w3id.org/arco/location/" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:php="http://php.net/xsl" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:roapit="https://w3id.org/italia/onto/RO/" xmlns:tiapit="https://w3id.org/italia/onto/TI/" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="1.0" exclude-result-prefixes="xsl php">
    <xsl:output method="xml" encoding="utf-8" indent="yes" />
    <xsl:param name="item" />
    <xsl:template match="/">
        <xsl:variable name="NS" select="'https://w3id.org/arco/resource/'" />
        <!-- xsl:variable name="itemURI" select="arco-fn:urify($item)"></xsl:variable -->
        <!-- This cannot be valid as schede/*/CD/NCT/NCTR and schede/*/CD/NCT/NCTN 
			are not unique xsl:variable name="itemURI" select="concat(schede/*/CD/NCT/NCTR, 
			schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS)"></xsl:variable -->
        <xsl:variable name="itemURI">
            <xsl:choose>
                <xsl:when test="schede/*/RV/RVE/RVEL">
                    <xsl:value-of select="concat(schede/*/CD/NCT/NCTR, schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS, '-', arco-fn:urify(normalize-space(schede/*/RV/RVE/RVEL)))" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(schede/*/CD/NCT/NCTR, schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS)" />
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
                    <xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
                </xsl:attribute>
                <rdf:type>
                    <xsl:attribute name="rdf:resource">
                        <xsl:value-of select="concat('https://w3id.org/arco/catalogue/', 'CatalogueRecord', $sheetType)" />
                    </xsl:attribute>
                </rdf:type>
                <rdfs:label>
                    <xsl:value-of select="concat('Catalogue Record n: ', $itemURI)" />
                </rdfs:label>
                <cataloguerecord:describes>
                    <xsl:attribute name="rdf:resource">
                        <xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                    </xsl:attribute>
                </cataloguerecord:describes>
                <!-- hasCataloguingLevel (schede/*/CD/LIR) -->
                <xsl:for-each select="schede/*/CD/LIR">
                    <cataloguerecord:hasCataloguingLevel>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat('https://w3id.org/arco/catalogue/', upper-case(arco-fn:urify(.)))" />
                        </xsl:attribute>
                    </cataloguerecord:hasCataloguingLevel>
                </xsl:for-each>
                <!-- identifier:sheetIdentifier - concat of NCTR + NCTN + NCTS + - +RVEL. 
					NCTR+NCTN+NCTS comes from schede/*/CD/NCT RVEL comes from schede/*/RV/RVE/RVEL 
					(optional) -->
                <xsl:if test="schede/*/CD/NCT">
                    <cataloguerecord:catalogueRecordIdentifier>
                        <xsl:choose>
                            <xsl:when test="schede/*/RV/RVE/RVEL">
                                <xsl:value-of select="concat(schede/*/CD/NCT/NCTR, schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS, '-', schede/*/RV/RVE/RVEL)" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat(schede/*/CD/NCT/NCTR, schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS)" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </cataloguerecord:catalogueRecordIdentifier>
                </xsl:if>
                <!-- proprietà per avere sempre un collegamento col nome del file xml "ICCD..." -->
                <cataloguerecord:systemRecordCode>
                    <xsl:value-of select="$item" />
                </cataloguerecord:systemRecordCode>
                <xsl:for-each select="schede/*/RV/RSP">
                    <cataloguerecord:deletedICCDIdentifier>
                        <xsl:value-of select="." />
                    </cataloguerecord:deletedICCDIdentifier>
                </xsl:for-each>
                <xsl:for-each select="schede/*/RVE/RVES">
                    <cataloguerecord:deletedICCDIdentifier>
                        <xsl:value-of select="." />
                    </cataloguerecord:deletedICCDIdentifier>
                </xsl:for-each>
                <xsl:if test="schede/*/CM/CMP">
                    <cataloguerecord:hasCatalogueRecordVersion>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-compilation')" />
                        </xsl:attribute>
                    </cataloguerecord:hasCatalogueRecordVersion>
                </xsl:if>
                <xsl:if test="schede/*/CM/RVM">
                    <cataloguerecord:hasCatalogueRecordVersion>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-rvm')" />
                        </xsl:attribute>
                    </cataloguerecord:hasCatalogueRecordVersion>
                </xsl:if>
                <xsl:for-each select="schede/*/CM/AGG">
                    <cataloguerecord:hasCatalogueRecordVersion>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-agg-', position())" />
                        </xsl:attribute>
                    </cataloguerecord:hasCatalogueRecordVersion>
                </xsl:for-each>
                <xsl:if test="schede/*/AN/OSS">
                    <arco:note>
                        <xsl:value-of select="normalize-space(schede/*/AN/OSS)" />
                    </arco:note>
                </xsl:if>
                <xsl:if test="schede/*/AN/RDP">
                    <cataloguerecord:recoveredData>
                        <xsl:value-of select="normalize-space(schede/*/AN/RDP)" />
                    </cataloguerecord:recoveredData>
                </xsl:if>
            </rdf:Description>
            <!-- This block introduces the triples about the sheet versions. I.e. 
				sub-elements of schede/*/CM -->
            <xsl:if test="schede/*/CM/CMP">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-compilation')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/catalogue/CatalogueRecordVersion/'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="concat(schede/*/CM/CMP/@hint, ' - ', normalize-space(schede/*/CM/CMP))" />
                    </rdfs:label>
                    <cataloguerecord:isCatalogueRecordVersionOf>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
                        </xsl:attribute>
                    </cataloguerecord:isCatalogueRecordVersionOf>
                    <xsl:if test="schede/*/CM/CMP/CMPN">
                        <cataloguerecord:hasCatalogueRecordRiT>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-compilation-', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPN)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasCatalogueRecordRiT>
                        <cataloguerecord:hasResponsibleResearchAndCompilation>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPN)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasResponsibleResearchAndCompilation>
                    </xsl:if>
                    <xsl:if test="schede/*/CM/CMP/CMPD">
                        <cataloguerecord:editedAtTime>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPD)))" />
                            </xsl:attribute>
                        </cataloguerecord:editedAtTime>
                    </xsl:if>
                    <!-- Referente verifica scientifica -->
                    <xsl:if test="schede/*/CM/RSR">
                        <cataloguerecord:hasCatalogueRecordRiT>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(schede/*/CM/RSR/@hint)), '-', arco-fn:urify(normalize-space(schede/*/CM/RSR)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasCatalogueRecordRiT>
                        <cataloguerecord:hasScientificDirector>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RSR)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasScientificDirector>
                    </xsl:if>
                    <!-- Funzionario responsabile -->
                    <xsl:if test="schede/*/CM/FUR">
                        <cataloguerecord:hasCatalogueRecordRiT>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(schede/*/CM/FUR/@hint)), '-', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasCatalogueRecordRiT>
                        <cataloguerecord:hasOfficialInCharge>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasOfficialInCharge>
                    </xsl:if>
                </rdf:Description>
            </xsl:if>
            <!-- This block introduces the triples about the sheet versions for RVM. 
				I.e. sub-elements of schede/*/RVM -->
            <xsl:if test="schede/*/CM/RVM">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-rvm')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/catalogue/CatalogueRecordVersion'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="concat(schede/*/CM/RVM/@hint, ' - ', normalize-space(schede/*/CM/RVM))" />
                    </rdfs:label>
                    <cataloguerecord:isCatalogueRecordVersionOf>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
                        </xsl:attribute>
                    </cataloguerecord:isCatalogueRecordVersionOf>
                    <xsl:if test="schede/*/CM/RVM/RVMN">
                        <cataloguerecord:hasCatalogueRecordRiT>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-rvm-', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMN)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasCatalogueRecordRiT>
                        <cataloguerecord:hasDigitalTranscriptionOperator>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMN)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasDigitalTranscriptionOperator>
                    </xsl:if>
                    <xsl:if test="schede/*/CM/RVM/RVME">
                        <cataloguerecord:hasCatalogueRecordRiT>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-rvm-', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVME)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasCatalogueRecordRiT>
                        <cataloguerecord:hasDigitalTranscriptionResponsibleAgent>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVME)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasDigitalTranscriptionResponsibleAgent>
                    </xsl:if>
                    <xsl:if test="schede/*/CM/RVM/RVMD">
                        <cataloguerecord:editedAtTime>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMD)))" />
                            </xsl:attribute>
                        </cataloguerecord:editedAtTime>
                    </xsl:if>
                    <!-- Referente verifica scientifica -->
                    <xsl:if test="schede/*/CM/RSR">
                        <cataloguerecord:hasCatalogueRecordRiT>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(schede/*/CM/RSR/@hint)), '-', arco-fn:urify(normalize-space(schede/*/CM/RSR)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasCatalogueRecordRiT>
                    </xsl:if>
                    <!-- Funzionario responsabile -->
                    <xsl:if test="schede/*/CM/FUR">
                        <cataloguerecord:hasCatalogueRecordRiT>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(schede/*/CM/FUR/@hint)), '-', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasCatalogueRecordRiT>
                        <cataloguerecord:hasOfficialInCharge>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasOfficialInCharge>
                    </xsl:if>
                </rdf:Description>
            </xsl:if>
            <!-- This block introduces the triples about the sheet versions for AGG. 
				I.e. sub-elements of schede/*/AGG -->
            <xsl:for-each select="schede/*/CM/AGG">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'CatalogueRecordVersion/', $itemURI, '-agg-', position())" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/catalogue/CatalogueRecordVersion'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="concat(./@hint, ' - ', normalize-space(.))" />
                    </rdfs:label>
                    <cataloguerecord:isCatalogueRecordVersionOf>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
                        </xsl:attribute>
                    </cataloguerecord:isCatalogueRecordVersionOf>
                    <xsl:if test="./AGGN">
                        <cataloguerecord:hasCatalogueRecordRiT>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:urify(normalize-space(./AGGN)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasCatalogueRecordRiT>
                        <cataloguerecord:hasUpdateResponsibleResearchAndCompilation>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGN)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasUpdateResponsibleResearchAndCompilation>
                    </xsl:if>
                    <xsl:if test="./AGGR">
                        <cataloguerecord:hasCatalogueRecordRiT>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:urify(normalize-space(./AGGR)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasCatalogueRecordRiT>
                        <cataloguerecord:hasUpdateScientificRevisor>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGR)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasUpdateScientificRevisor>
                    </xsl:if>
                    <xsl:if test="./AGGE">
                        <cataloguerecord:hasCatalogueRecordRiT>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:urify(normalize-space(./AGGE)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasCatalogueRecordRiT>
                        <cataloguerecord:hasUpdateResponsibleAgent>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGE)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasUpdateResponsibleAgent>
                    </xsl:if>
                    <xsl:if test="./AGGD">
                        <cataloguerecord:editedAtTime>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./AGGD)))" />
                            </xsl:attribute>
                        </cataloguerecord:editedAtTime>
                    </xsl:if>
                    <!-- Funzionario responsabile -->
                    <xsl:if test="./AGGF">
                        <cataloguerecord:hasCatalogueRecordRiT>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(./AGGF/@hint)), '-', arco-fn:urify(normalize-space(./AGGF)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasCatalogueRecordRiT>
                        <cataloguerecord:hasUpdateOfficialInCharge>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGF)))" />
                            </xsl:attribute>
                        </cataloguerecord:hasUpdateOfficialInCharge>
                    </xsl:if>
                </rdf:Description>
                <!-- Time interval -->
                <xsl:if test="./AGGD">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./AGGD)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
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
                            <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:urify(normalize-space(./AGGN)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
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
                                <xsl:value-of select="concat($NS, 'Role/UpdateResponsibleCompilation')" />
                            </xsl:attribute>
                        </roapit:withRole>
                        <roapit:isRoleInTimeOf>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGN)))" />
                            </xsl:attribute>
                        </roapit:isRoleInTimeOf>
                    </rdf:Description>
                    <!-- Role -->
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Role/UpdateResponsibleCompilation')" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label xml:lang="en">
                            <xsl:value-of select="'Update responsible research and compilation'" />
                        </rdfs:label>
                        <rdfs:label xml:lang="it">
                            <xsl:value-of select="'Responsabile di ricerca e redazione di aggiornamento'" />
                        </rdfs:label>
                    </rdf:Description>
                    <!-- Agent -->
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGN)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:value-of select="normalize-space(./AGGN)" />
                        </rdfs:label>
                    </rdf:Description>
                </xsl:if>
                <!-- Participant role - AGGE-->
                <xsl:if test="./AGGE">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:urify(normalize-space(./AGGE)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
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
                                <xsl:value-of select="concat($NS, 'Role/UpdateResponsible')" />
                            </xsl:attribute>
                        </roapit:withRole>
                        <roapit:isRoleInTimeOf>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGE)))" />
                            </xsl:attribute>
                        </roapit:isRoleInTimeOf>
                    </rdf:Description>
                    <!-- Role -->
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Role/UpdateResponsible')" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
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
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGE)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
                            <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-agg-', position(), '-', arco-fn:urify(normalize-space(./AGGR)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
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
                                <xsl:value-of select="concat($NS, 'Role/UpdateScientificRevisor')" />
                            </xsl:attribute>
                        </roapit:withRole>
                        <roapit:isRoleInTimeOf>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGR)))" />
                            </xsl:attribute>
                        </roapit:isRoleInTimeOf>
                    </rdf:Description>
                    <!-- Role -->
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Role/UpdateScientificRevisor')" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
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
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGR)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
                        <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(schede/*/CM/RSR/@hint)), '-', arco-fn:urify(normalize-space(schede/*/CM/RSR)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="concat(schede/*/CM/RSR/@hint, ': ', normalize-space(schede/*/CM/RSR))" />
                    </rdfs:label>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="concat('Scientific director', ': ', normalize-space(schede/*/CM/RSR))" />
                    </rdfs:label>
                    <roapit:withRole>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Role/ScientificDirector')" />
                        </xsl:attribute>
                    </roapit:withRole>
                    <roapit:isRoleInTimeOf>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RSR)))" />
                        </xsl:attribute>
                    </roapit:isRoleInTimeOf>
                </rdf:Description>
                <!-- Agent: Referente verifica scientifica -->
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RSR)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(schede/*/CM/RSR)" />
                    </rdfs:label>
                </rdf:Description>
                <!-- Role: Referente verifica scientifica -->
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Role/ScientificDirector')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
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
            <xsl:if test="schede/*/CM/FUR">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(schede/*/CM/FUR/@hint)), '-', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="concat(schede/*/CM/FUR/@hint, ': ', normalize-space(schede/*/CM/FUR))" />
                    </rdfs:label>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="concat('Official in charge', ': ', normalize-space(schede/*/CM/FUR))" />
                    </rdfs:label>
                    <roapit:withRole>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Role/OfficialInCharge')" />
                        </xsl:attribute>
                    </roapit:withRole>
                    <roapit:isRoleInTimeOf>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                        </xsl:attribute>
                    </roapit:isRoleInTimeOf>
                </rdf:Description>
                <!-- Agent: Funzionario responsabile -->
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/FUR)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(schede/*/CM/FUR)" />
                    </rdfs:label>
                </rdf:Description>
                <!-- Role: Funzionario responsabile -->
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Role/OfficialInCharge')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
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
            <xsl:for-each select="schede/*/CM/AGG">
            	<xsl:if test="./AGGF">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(./AGGF/@hint)), '-', arco-fn:urify(normalize-space(./AGGF)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="concat(./AGGF/@hint, ' di aggiornamento: ', normalize-space(./AGGF))" />
                    </rdfs:label>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="concat('Update official in charge', ': ', normalize-space(./AGGF))" />
                    </rdfs:label>
                    <roapit:withRole>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Role/OfficialInCharge')" />
                        </xsl:attribute>
                    </roapit:withRole>
                    <roapit:isRoleInTimeOf>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGF)))" />
                        </xsl:attribute>
                    </roapit:isRoleInTimeOf>
                </rdf:Description>
                <!-- Agent: Funzionario responsabile AGGF -->
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AGGF)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
                        <xsl:value-of select="concat($NS, 'Role/OfficialInCharge')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
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
            <!-- Version time interval - CMD -->
            <xsl:if test="schede/*/CM/CMP/CMPD">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPD)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
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
                        <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMD)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
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
                        <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-compilation-', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPN)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="concat('Compilation by ', normalize-space(schede/*/CM/CMP/CMPN))" />
                    </rdfs:label>
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="concat('Compilazione da ', normalize-space(schede/*/CM/CMP/CMPN))" />
                    </rdfs:label>
                    <roapit:withRole>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Role/ResponsibleCompilation')" />
                        </xsl:attribute>
                    </roapit:withRole>
                    <roapit:isRoleInTimeOf>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPN)))" />
                        </xsl:attribute>
                    </roapit:isRoleInTimeOf>
                </rdf:Description>
            </xsl:if>
            <!-- responsible research and compilation Agent -->
            <xsl:if test="schede/*/CM/CMP/CMPN">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/CMP/CMPN)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(schede/*/CM/CMP/CMPN)" />
                    </rdfs:label>
                </rdf:Description>
                <!-- responsible research and compilation role -->
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Role/ResponsibleCompilation')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
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
                        <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-rvm-', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVME)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="concat(schede/*/CM/RVM/@hint, ' da ', normalize-space(schede/*/CM/RVM/RVME))" />
                    </rdfs:label>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="concat('Digital transcription', ' by ', normalize-space(schede/*/CM/RVM/RVME))" />
                    </rdfs:label>
                    <roapit:withRole>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Role/DigitalTranscriptionResponsibleAgent')" />
                        </xsl:attribute>
                    </roapit:withRole>
                    <roapit:isRoleInTimeOf>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVME)))" />
                        </xsl:attribute>
                    </roapit:isRoleInTimeOf>
                </rdf:Description>
                <!-- digital transcription responsible agent -->
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVME)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(schede/*/CM/RVM/RVME)" />
                    </rdfs:label>
                </rdf:Description>
                <!-- digital transcription responsible agent role -->
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Role/DigitalTranscriptionResponsibleAgent')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="'Digital transcription responsible agent'" />
                    </rdfs:label>
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="'Responsabile della trascrizione per informatizzazione'" />
                    </rdfs:label>
                </rdf:Description>
            </xsl:if>
            <!-- Participant role - RVMN -->
            <xsl:if test="schede/*/CM/RVM/RVMN">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-rvm-', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMN)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="concat(schede/*/CM/RVM/@hint, ' da ', normalize-space(schede/*/CM/RVM/RVMN))" />
                    </rdfs:label>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="concat('Digital transcription', ' by ', normalize-space(schede/*/CM/RVM/RVMN))" />
                    </rdfs:label>
                    <roapit:withRole>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Role/DigitalTranscriptionOperator')" />
                        </xsl:attribute>
                    </roapit:withRole>
                    <roapit:isRoleInTimeOf>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMN)))" />
                        </xsl:attribute>
                    </roapit:isRoleInTimeOf>
                </rdf:Description>
                <!-- digital transcription agent -->
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CM/RVM/RVMN)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(schede/*/CM/RVM/RVMN)" />
                    </rdfs:label>
                </rdf:Description>
                <!-- digital transciption operator role -->
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Role/DigitalTranscriptionOperator')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="'Digital transcription operator'" />
                    </rdfs:label>
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="'Operatore della trascrizione per informatizzazione'" />
                    </rdfs:label>
                </rdf:Description>
            </xsl:if>
            
            
            
            <!-- We then introduce the cultural entity described by the sheet. -->
            <rdf:Description>
                <xsl:attribute name="rdf:about">
                    <xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                </xsl:attribute>
                <rdf:type>
                    <xsl:attribute name="rdf:resource">
                        <xsl:value-of select="arco-fn:getPropertyType($sheetType)" />
                    </xsl:attribute>
                </rdf:type>
                <xsl:if test="schede/*/LC">
                    <locgeoamm:hasTimeIndexedQualifiedLocation>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-current')" />
                        </xsl:attribute>
                    </locgeoamm:hasTimeIndexedQualifiedLocation>
                </xsl:if>
                <xsl:for-each select="schede/*/LA | schede/F/LR">
                    <locgeoamm:hasTimeIndexedQualifiedLocation>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-alternative-', position())" />
                        </xsl:attribute>
                    </locgeoamm:hasTimeIndexedQualifiedLocation>
                </xsl:for-each>
                <xsl:if test="schede/*/LC/PVC/*">
                    <locgeoamm:hasCulturalPropertyAddress>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(schede/*/LC/PVC), normalize-space(schede/*/LC/PVL), normalize-space(schede/*/LC/LDC/LDCU)))))" />
                        </xsl:attribute>
                    </locgeoamm:hasCulturalPropertyAddress>
                </xsl:if>
                <xsl:for-each select="schede/*/AU/ATB">
                    <culturaldefinition:hasAuthorshipAttribution>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CulturalScopeAttribution/', $itemURI, '-attribuzione-ambito-culturale-', position())" />
                        </xsl:attribute>
                    </culturaldefinition:hasAuthorshipAttribution>
                </xsl:for-each>
                <xsl:for-each select="schede/*/AU/AAT">
                    <culturaldefinition:hasAuthorshipAttribution>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'AlternativeAuthorshipAttribution/', $itemURI, '-', position())" />
                        </xsl:attribute>
                    </culturaldefinition:hasAuthorshipAttribution>
                </xsl:for-each>
                <xsl:for-each select="schede/*/AU/AUT">
                    <culturaldefinition:hasAuthorshipAttribution>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
                        </xsl:attribute>
                    </culturaldefinition:hasAuthorshipAttribution>
                </xsl:for-each>
                <xsl:for-each select="schede/*/AU/CMM">
                    <cpdescription:hasCommission>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Commission/', $itemURI, '-', position())" />
                        </xsl:attribute>
                    </cpdescription:hasCommission>
                </xsl:for-each>
                <xsl:for-each select="schede/*/AU/EDT">
                    <xsl:if test="./EDTN">
                        <culturaldefinition:hasEdition>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="./EDTE and ./EDTL">
                                        <xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDTE)), '-', arco-fn:urify(normalize-space(./EDTL)))" />
                                    </xsl:when>
                                    <xsl:when test="./EDTE">
                                        <xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDTE)))" />
                                    </xsl:when>
                                    <xsl:when test="./EDTL">
                                        <xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDTL)))" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', position())" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                        </culturaldefinition:hasEdition>
                    </xsl:if>
                </xsl:for-each>
                <xsl:for-each select="schede/*/CO/STC">
                    <cpdescription:hasConservationStatus>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'ConservationStatus/', $itemURI, '-stato-conservazione-', position())" />
                        </xsl:attribute>
                    </cpdescription:hasConservationStatus>
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
                <xsl:if test="schede/*/CD/ECP">
                    <arco:hasAgentRole>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
                        </xsl:attribute>
                    </arco:hasAgentRole>
                    <arco:hasHeritageProtectionAgency>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CD/ECP)))" />
                        </xsl:attribute>
                    </arco:hasHeritageProtectionAgency>
                </xsl:if>
                <xsl:if test="schede/*/CD/ESC">
                    <arco:hasAgentRole>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-cataloguing-agency')" />
                        </xsl:attribute>
                    </arco:hasAgentRole>
                    <arco:hasCataloguingAgency>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CD/ESC)))" />
                        </xsl:attribute>
                    </arco:hasCataloguingAgency>
                </xsl:if>
                <xsl:for-each select="schede/*/LC/PVZ">
                    <locgeoamm:hasTypeOfContext>
                        <xsl:attribute name="rdf:resource">
                            <xsl:choose>
                                <xsl:when test="lower-case(normalize-space(.)) = 'contesto urbano'">
                                    <xsl:value-of select="'https://w3id.org/arco/location/Urban'" />
                                </xsl:when>
                                <xsl:when test="lower-case(normalize-space(.)) = 'contesto suburbano'">
                                    <xsl:value-of select="'https://w3id.org/arco/location/Suburban'" />
                                </xsl:when>
                                <xsl:when test="lower-case(normalize-space(.)) = 'contesto territoriale'">
                                    <xsl:value-of select="'https://w3id.org/arco/location/Territorial'" />
                                </xsl:when>
                                <xsl:when test="lower-case(normalize-space(.)) = 'contesto subacqueo'">
                                    <xsl:value-of select="'https://w3id.org/arco/location/Underwater'" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat('https://w3id.org/arco/location/', arco-fn:urify(normalize-space(.)))" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </locgeoamm:hasTypeOfContext>
                </xsl:for-each>
                <xsl:for-each select="schede/*/LA/PRZ">
                    <locgeoamm:hasTypeOfContext>
                        <xsl:attribute name="rdf:resource">
                            <xsl:choose>
                                <xsl:when test="lower-case(normalize-space(.)) = 'contesto urbano'">
                                    <xsl:value-of select="'https://w3id.org/arco/location/Urban'" />
                                </xsl:when>
                                <xsl:when test="lower-case(normalize-space(.)) = 'contesto suburbano'">
                                    <xsl:value-of select="'https://w3id.org/arco/location/Suburban'" />
                                </xsl:when>
                                <xsl:when test="lower-case(normalize-space(.)) = 'contesto territoriale'">
                                    <xsl:value-of select="'https://w3id.org/arco/location/Territorial'" />
                                </xsl:when>
                                <xsl:when test="lower-case(normalize-space(.)) = 'contesto subacqueo'">
                                    <xsl:value-of select="'https://w3id.org/arco/location/Underwater'" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat('https://w3id.org/arco/location/', arco-fn:urify(normalize-space(.)))" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </locgeoamm:hasTypeOfContext>
                </xsl:for-each>
                <rdf:type>
                    <xsl:attribute name="rdf:resource">
                        <xsl:value-of select="arco-fn:getSpecificPropertyType($sheetType)" />
                    </xsl:attribute>
                </rdf:type>
                <rdfs:label>
                    <xsl:choose>
                        <xsl:when test="schede/*/OG/OGT/OGTT">
                            <xsl:value-of select="concat(schede/*/OG/OGT/OGTD, ' ', schede/*/OG/OGT/OGTT)" />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="schede/*/OG/OGT/OGTD" />
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="schede/*/SGT/SGTI">
                        <xsl:value-of select="concat(' ', schede/*/SGT/SGTI)" />
                    </xsl:if>
                    <xsl:if test="schede/*/DA/AID/AIDI">
                        <xsl:value-of select="concat(' ', schede/*/DA/AID/AIDI)" />
                    </xsl:if>
                </rdfs:label>
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
                    <xsl:if test="schede/*/SGT/SGTI">
                        <xsl:value-of select="concat(' ', schede/*/SGT/SGTI)" />
                    </xsl:if>
                </rdfs:comment>
                <cataloguerecord:isDescribedBy>
                    <xsl:attribute name="rdf:resource">
                        <xsl:value-of select="concat($NS, 'CatalogueRecord', $sheetType, '/', $itemURI)" />
                    </xsl:attribute>
                </cataloguerecord:isDescribedBy>
                <xsl:for-each select="schede/*/DT">
                    <culturaldefinition:hasDating>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
                        </xsl:attribute>
                    </culturaldefinition:hasDating>
                </xsl:for-each>
                <!-- scope of protection (AMB) -->
                <xsl:if test="schede/*/OG/AMB">
                    <xsl:for-each select="schede/*/OG/AMB">
                        <arco:hasMibactScopeOfProtection>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test=".='archeologico'">
                                        <xsl:value-of select="'https://w3id.org/arco/core/Archaeological'" />
                                    </xsl:when>
                                    <xsl:when test=".='architettonico e paesaggistico'">
                                        <xsl:value-of select="'https://w3id.org/arco/core/ArchitecturalLandscape'" />
                                    </xsl:when>
                                    <xsl:when test=".='etnoantropologico'">
                                        <xsl:value-of select="'https://w3id.org/arco/core/EthnoAnthropological'" />
                                    </xsl:when>
                                    <xsl:when test=".='storico artistico'">
                                        <xsl:value-of select="'https://w3id.org/arco/core/HistoricalArtistic'" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="concat('https://w3id.org/arco/core/', arco-fn:urify(normalize-space(.)))" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                        </arco:hasMibactScopeOfProtection>
                        <!-- cpdescription:hasMibactScopeOfProtection> <xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="concat('https://w3id.org/arco/resource/MibactScopeOfProtection/', 
							arco-fn:urify(normalize-space(.)))" /> </xsl:attribute> </cpdescription:hasMibactScopeOfProtection -->
                    </xsl:for-each>
                </xsl:if>
                <!-- category (CTG) -->
                <xsl:for-each select="schede/*/OG/CTG">
                    <arco:hasCategory>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat('https://w3id.org/arco/resource/CulturalPropertyCategory/', arco-fn:urify(normalize-space(.)))" />
                        </xsl:attribute>
                    </arco:hasCategory>
                </xsl:for-each>
                <xsl:for-each select="schede/*/OG/OGT">
                    <cpdescription:hasCulturalPropertyType>
                        <xsl:attribute name="rdf:resource">
                            <xsl:choose>
                                <xsl:when test="./OGTT">
                                    <xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:urify(normalize-space(./OGTD)), '-', arco-fn:urify(normalize-space(./OGTT)))" />
                                </xsl:when>
                                <xsl:when test="./OGTD">
                                    <xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:urify(normalize-space(./OGTD)))" />
                                </xsl:when>
                            </xsl:choose>
                        </xsl:attribute>
                    </cpdescription:hasCulturalPropertyType>
                </xsl:for-each>
                <xsl:for-each select="schede/*/*/SGT/SGTI">
                    <culturaldefinition:subject>
                        <xsl:value-of select="normalize-space(.)" />
                    </culturaldefinition:subject>
                    <culturaldefinition:hasSubject>
                    	<xsl:attribute name="rdf:resource">
                    		<xsl:value-of select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(.)))" />
                    	</xsl:attribute>
                    </culturaldefinition:hasSubject>
                </xsl:for-each>
                <xsl:for-each select="schede/*/DA/AID/AIDI">
                    <culturaldefinition:subject>
                        <xsl:value-of select="normalize-space(.)" />
                    </culturaldefinition:subject>
                    <culturaldefinition:hasSubject>
                    	<xsl:attribute name="rdf:resource">
                    		<xsl:value-of select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(.)))" />
                    	</xsl:attribute>
                    </culturaldefinition:hasSubject>
                </xsl:for-each>
                <xsl:for-each select="schede/*/DA/DES/DESI">
                    <culturaldefinition:iconclassCode>
                        <xsl:value-of select="normalize-space(.)" />
                    </culturaldefinition:iconclassCode>
                </xsl:for-each>
                <xsl:for-each select="schede/*/DA/AID/AIDC">
                    <culturaldefinition:iconclassCode>
                        <xsl:value-of select="normalize-space(.)" />
                    </culturaldefinition:iconclassCode>
                </xsl:for-each>
                <xsl:for-each select="schede/*/OG/SGT/SGTT">
                    <culturaldefinition:title>
                        <xsl:value-of select="normalize-space(.)" />
                    </culturaldefinition:title>
                </xsl:for-each>
                <xsl:for-each select="schede/*/DA/AID/AIDT">
                    <culturaldefinition:title>
                        <xsl:value-of select="normalize-space(.)" />
                    </culturaldefinition:title>
                </xsl:for-each>
                <xsl:for-each select="schede/*/DA/AID/AIDN">
                    <culturaldefinition:alternativeTitle>
                        <xsl:value-of select="normalize-space(.)" />
                    </culturaldefinition:alternativeTitle>
                </xsl:for-each>
                <!-- proper title -->
                <xsl:for-each select="schede/*/OG/SGT/SGTP">
                    <culturaldefinition:properTitle>
                        <xsl:value-of select="normalize-space(.)" />
                    </culturaldefinition:properTitle>
                </xsl:for-each>
                <xsl:if test="not(lower-case(normalize-space(schede/*/SG/SGL/SGLT))='nr' or lower-case(normalize-space(schede/*/SG/SGL/SGLT))='n.r.' or lower-case(normalize-space(schede/*/SG/SGL/SGLT))='nr (recupero pregresso)')">
                <xsl:for-each select="schede/*/SG/SGL/SGLT">
                    <culturaldefinition:properTitle>
                        <xsl:value-of select="normalize-space(.)" />
                    </culturaldefinition:properTitle>
                </xsl:for-each>
               </xsl:if>
                <!-- parallel title -->
                <xsl:for-each select="schede/*/OG/SGT/SGTR">
                    <culturaldefinition:parallelTitle>
                        <xsl:value-of select="normalize-space(.)" />
                    </culturaldefinition:parallelTitle>
                </xsl:for-each>
                <xsl:if test="not(lower-case(normalize-space(schede/*/SG/SGL/SGLL))='nr' or lower-case(normalize-space(schede/*/SG/SGL/SGLL))='n.r.' or lower-case(normalize-space(schede/*/SG/SGL/SGLL))='nr (recupero pregresso)')">
                <xsl:for-each select="schede/*/SG/SGL/SGLL">
                    <culturaldefinition:parallelTitle>
                        <xsl:value-of select="normalize-space(.)" />
                    </culturaldefinition:parallelTitle>
                </xsl:for-each>
                </xsl:if>
                <!-- attributed title -->
                <xsl:if test="not(schede/*/SG/SGL/SGLA='NR' or schede/*/SG/SGL/SGLA='NR (recupero pregresso)')">
                <xsl:for-each select="schede/*/SG/SGL/SGLA">
                    <culturaldefinition:attributedTitle>
                        <xsl:value-of select="normalize-space(.)" />
                    </culturaldefinition:attributedTitle>
                </xsl:for-each>
               </xsl:if>
                <!-- name in time (OG/OGD) -->
                <xsl:for-each select="schede/*/OG/OGD">
                    <cpdescription:hasDesignationInTime>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat('https://w3id.org/arco/resource/NameInTime/', arco-fn:urify(arco-fn:md5(normalize-space(.))))" />
                        </xsl:attribute>
                    </cpdescription:hasDesignationInTime>
                </xsl:for-each>
                <!-- identifier:uniqueIdentifier - concat of NCTR + NCTN + NCTS available 
					in schede/*/CD/NCT) -->
                <xsl:if test="schede/*/CD/NCT">
                    <arco:uniqueIdentifier>
                        <xsl:value-of select="concat(schede/*/CD/NCT/NCTR, schede/*/CD/NCT/NCTN, schede/*/CD/NCT/NCTS)" />
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
            </rdf:Description>
            <!-- Subject as an individual (sgti) -->
            <xsl:for-each select="schede/*/*/SGT/SGTI">
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(.)))" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
                          <xsl:value-of select="'https://w3id.org/arco/subjective/Subject'" />
                        </xsl:attribute>
            		</rdf:type>
            		<rdfs:label>
                        <xsl:value-of select="normalize-space(.)" />
                    </rdfs:label>
                    <l0:name>
                        <xsl:value-of select="normalize-space(.)" />
                    </l0:name>
                    <culturaldefinition:isSubjectOf>
                    	<xsl:attribute name="rdf:resource">
                    		<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                    	</xsl:attribute>
                    </culturaldefinition:isSubjectOf>
            	</rdf:Description>
            </xsl:for-each>
            <!-- Subject as an individual (aidi) -->
            <xsl:for-each select="schede/*/DA/AID/AIDI">
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(.)))" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
                          <xsl:value-of select="'https://w3id.org/arco/subjective/Subject'" />
                        </xsl:attribute>
            		</rdf:type>
            		<rdfs:label>
                        <xsl:value-of select="normalize-space(.)" />
                    </rdfs:label>
                    <l0:name>
                        <xsl:value-of select="normalize-space(.)" />
                    </l0:name>
                    <culturaldefinition:isSubjectOf>
                    	<xsl:attribute name="rdf:resource">
                    		<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                    	</xsl:attribute>
                    </culturaldefinition:isSubjectOf>
            	</rdf:Description>
            </xsl:for-each>
            <xsl:for-each select="schede/*/OG/OGD">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat('https://w3id.org/arco/resource/NameInTime/', arco-fn:urify(arco-fn:md5(normalize-space(.))))" />
                    </xsl:attribute>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(.)" />
                    </rdfs:label>
                    <l0:name>
                        <xsl:value-of select="normalize-space(.)" />
                    </l0:name>
                </rdf:Description>
            </xsl:for-each>
            <xsl:for-each select="schede/*/AU/EDT">
                <xsl:if test="./EDTN">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:choose>
                                <xsl:when test="./EDTE and ./EDTL">
                                    <xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDTE)), '-', arco-fn:urify(normalize-space(./EDTL)))" />
                                </xsl:when>
                                <xsl:when test="./EDTE">
                                    <xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDTE)))" />
                                </xsl:when>
                                <xsl:when test="./EDTL">
                                    <xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', arco-fn:urify(normalize-space(./EDTL)))" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat($NS, 'Edition/', $itemURI, '-', position())" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/subjective/Edition'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:choose>
                                <xsl:when test="./EDTE and ./EDTL">
                                    <xsl:value-of select="concat('Edizione ', normalize-space(./EDTE), '-', normalize-space(./EDTL), ' del bene ', $itemURI)" />
                                </xsl:when>
                                <xsl:when test="./EDTE">
                                    <xsl:value-of select="concat('Edizione ', normalize-space(./EDTE), ' del bene ', $itemURI)" />
                                </xsl:when>
                                <xsl:when test="./EDTL">
                                    <xsl:value-of select="concat('Edizione ', normalize-space(./EDTL), ' del bene ', $itemURI)" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat('Edizione ', position(), ' del bene ', $itemURI)" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </rdfs:label>
                        <l0:name>
                            <xsl:choose>
                                <xsl:when test="./EDTE and ./EDTL">
                                    <xsl:value-of select="concat('Edizione ', normalize-space(./EDTE), '-', normalize-space(./EDTL), ' del bene ', $itemURI)" />
                                </xsl:when>
                                <xsl:when test="./EDTE">
                                    <xsl:value-of select="concat('Edizione ', normalize-space(./EDTE), ' del bene ', $itemURI)" />
                                </xsl:when>
                                <xsl:when test="./EDTL">
                                    <xsl:value-of select="concat('Edizione ', normalize-space(./EDTL), ' del bene ', $itemURI)" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat('Edizione ', position(), ' del bene ', $itemURI)" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </l0:name>
                        <xsl:if test="./EDTE">
                            <culturaldefinition:editionDate>
                                <xsl:value-of select="normalize-space(./EDTE)" />
                            </culturaldefinition:editionDate>
                        </xsl:if>
                        <xsl:if test="./EDTL">
                            <culturaldefinition:editionLocation>
                                <xsl:value-of select="normalize-space(./EDTL)" />
                            </culturaldefinition:editionLocation>
                        </xsl:if>
                        <roapit:holdsRoleInTime>
                            <xsl:attribute name="rdf:resource">
                                <!-- URI modificato da Valentina, aggiungendo $itemURI -->
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-edition-', position())" />
                            </xsl:attribute>
                        </roapit:holdsRoleInTime>
                    </rdf:Description>
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-edition-', position())" />
                            </xsl:attribute>
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/RO/TimeIndexedRole'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:choose>
                                <xsl:when test="./EDTR">
                                    <xsl:value-of select="concat(normalize-space(./EDTR), ' del bene ', $itemURI)" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat('Ruolo nel tempo del bene ', $itemURI)" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </rdfs:label>
                        <xsl:if test="./EDTN">
                            <roapit:forAgent>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./EDTN)))" />
                                </xsl:attribute>
                            </roapit:forAgent>
                        </xsl:if>
                        <xsl:if test="./EDTR">
                            <roapit:withRole>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./EDTR)))" />
                                </xsl:attribute>
                            </roapit:withRole>
                        </xsl:if>
                    </rdf:Description>
                    <xsl:if test="./EDTR">
                        <rdf:Description>
                            <xsl:attribute name="rdf:about">
                                <xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./EDTR)))" />
                            </xsl:attribute>
                            <rdf:type>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
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
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./EDTN)))" />
                            </xsl:attribute>
                            <rdf:type>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
                                </xsl:attribute>
                            </rdf:type>
                            <rdfs:label>
                                <xsl:value-of select="normalize-space(./EDTN)" />
                            </rdfs:label>
                            <l0:name>
                                <xsl:value-of select="normalize-space(./EDTN)" />
                            </l0:name>
                            <xsl:if test="./EDTD">
                                <culturaldefinition:agentDate>
                                    <xsl:value-of select="normalize-space(./EDTD)" />
                                </culturaldefinition:agentDate>
                            </xsl:if>
                        </rdf:Description>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="schede/*/DT">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Dating/', $itemURI, '-', position())" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/subjective/Dating'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="concat('Cronologia ', position(), ' del bene ', $itemURI)" />
                    </rdfs:label>
                    <culturaldefinition:hasEvent>
                        <xsl:choose>
                            <xsl:when test="./DTN/DTNS">
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="concat($NS, 'Event/', arco-fn:urify(normalize-space(./DTN/DTNS)))" />
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="concat($NS, 'Event/', $itemURI, '-realizzazione-', position())" />
                                </xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </culturaldefinition:hasEvent>
                    <!-- Source of dating -->
                    <xsl:if test="./DTM and not(lower-case(normalize-space(./DTM))='nr' or lower-case(normalize-space(./DTM))='n.r.' or lower-case(normalize-space(./DTM))='nr (recupero pregresso)' or lower-case(normalize-space(./DTM/DTMM))='nr' or lower-case(normalize-space(./DTM/DTMM))='n.r.' or lower-case(normalize-space(./DTM/DTMM))='nr (recupero pregresso)')">
					<culturaldefinition:hasSource>
                    <xsl:choose>
                        <xsl:when test="./DTM/DTMS">
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./DTM/DTMM)))" />
                                </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./DTM)))" />
                                </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    </culturaldefinition:hasSource>
                    </xsl:if>
                </rdf:Description>
                <!-- Source of dating as individual-->
                <xsl:if test="./DTM and not(lower-case(normalize-space(./DTM))='nr' or lower-case(normalize-space(./DTM))='n.r.' or lower-case(normalize-space(./DTM))='nr (recupero pregresso)' or lower-case(normalize-space(./DTM/DTMM))='nr' or lower-case(normalize-space(./DTM/DTMM))='n.r.' or lower-case(normalize-space(./DTM/DTMM))='nr (recupero pregresso)')">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:choose>
                                <xsl:when test="./DTM/DTMS">
                                    <xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./DTM/DTMM)))" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./DTM)))" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/subjective/Source'" />
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
                                <xsl:when test="./DTMS">
                                    <xsl:value-of select="normalize-space(./DTM/DTMM)" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="normalize-space(./DTM)" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </l0:name>
                        <xsl:if test="./DTMS">
                            <arco:specifications>
                                <xsl:value-of select="normalize-space(./DTMS)" />
                            </arco:specifications>
                        </xsl:if>
                    </rdf:Description>
                </xsl:if>
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:choose>
                            <xsl:when test="./DTN/DTNS">
                                <xsl:value-of select="concat($NS, 'Event/', arco-fn:urify(normalize-space(./DTNS)))" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat($NS, 'Event/', $itemURI, '-realizzazione-', position())" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Event'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:choose>
                            <xsl:when test="./DTN/DTNS">
                                <xsl:value-of select="normalize-space(./DTN/DTNS)" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat('Realizzazione del bene ', $itemURI)" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </rdfs:label>
                    <l0:name>
                        <xsl:choose>
                            <xsl:when test="./DTN/DTNS">
                                <xsl:value-of select="normalize-space(./DTN/DTNS)" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat('Realizzazione del bene ', $itemURI)" />
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
                                        <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)), '-',  arco-fn:urify(normalize-space(./DTZ/DTZS)))" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)))" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                        </tiapit:atTime>
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
                        		<culturaldefinition:specificTime>
                        			<xsl:attribute name="rdf:resource">
		                            	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
		                        	</xsl:attribute>
                        		</culturaldefinition:specificTime>
                        	</xsl:if>
                        </xsl:if>
                    </xsl:if>
                </rdf:Description>
                <xsl:if test="./DTZ">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:choose>
                                <xsl:when test="./DTZ/DTZS">
                                    <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)), '-',  arco-fn:urify(normalize-space(./DTZ/DTZS)))" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./DTZ/DTZG)))" />
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
                                <xsl:when test="./DTZ/DTZS">
                                    <xsl:value-of select="concat(normalize-space(./DTZ/DTZG), ' ', normalize-space(./DTZ/DTZS))" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="normalize-space(./DTZ/DTZG)" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </rdfs:label>
                        <l0:name>
                            <xsl:choose>
                                <xsl:when test="./DTZ/DTZS">
                                    <xsl:value-of select="concat(normalize-space(./DTZ/DTZG), ' ', normalize-space(./DTZ/DTZS))" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="normalize-space(./DTZ/DTZG)" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </l0:name>
                        <!--  xsl:if test="./DTS">
                            <tiapit:startTime>
                                <xsl:choose>
                                    <xsl:when test="./DTS/DTSV">
                                        <xsl:value-of select="concat(normalize-space(./DTS/DTSV), ' ', normalize-space(./DTS/DTSI))" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="normalize-space(./DTS/DTSI)" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </tiapit:startTime>
                            <tiapit:endTime>
                                <xsl:choose>
                                    <xsl:when test="./DTS/DTSL">
                                        <xsl:value-of select="concat(normalize-space(./DTS/DTSL), ' ', normalize-space(./DTS/DTSF))" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="normalize-space(./DTS/DTSF)" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </tiapit:endTime>
                        </xsl:if -->
                    </rdf:Description>
                    
                    <!-- Time intervall with start time and end time -->
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
		                    <rdf:Description>
		                        <xsl:attribute name="rdf:about">
		                            <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat($startDate, '-',  $endDate)))" />
		                        </xsl:attribute>
		                        <rdf:type>
		                            <xsl:attribute name="rdf:resource">
		                                <xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
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
                                <xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:urify(normalize-space(./OGTD)), '-', arco-fn:urify(normalize-space(./OGTT)))" />
                            </xsl:when>
                            <xsl:when test="./OGTD">
                                <xsl:value-of select="concat($NS, 'CulturalPropertyType/', arco-fn:urify(normalize-space(./OGTD)))" />
                            </xsl:when>
                        </xsl:choose>
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/objective/CulturalPropertyType'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:choose>
                            <xsl:when test="./OGTT">
                                <!-- Cambiata label da Valentina, avendo tolto $itemURI dall'URI. 
									PRIMA ERA: <xsl:value-of select="concat('Tipo del bene ', $itemURI, ': ', 
									./OGTD, ' ', ./OGTT)" /> -->
                                <xsl:value-of select="concat('Tipo del bene: ', ./OGTD, ' ', ./OGTT)" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat('Tipo del bene: ', ./OGTD)" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </rdfs:label>
                    <xsl:if test="./OGTD and not(lower-case(normalize-space(./OGTD))='nr' or lower-case(normalize-space(./OGTD))='n.r.' or lower-case(normalize-space(./OGTD))='nr (recupero pregresso)')">
                    <cpdescription:hasCulturalPropertyDefinition>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat('https://w3id.org/arco/resource/CulturalPropertyDefinition/', arco-fn:urify(normalize-space(./OGTD)))" />
                        </xsl:attribute>
                    </cpdescription:hasCulturalPropertyDefinition>
                    </xsl:if>
                    <xsl:if test="./OGTT">
                        <cpdescription:hasCulturalPropertySpecification>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat('https://w3id.org/arco/resource/CulturalPropertySpecification/', arco-fn:urify(normalize-space(./OGTT)))" />
                            </xsl:attribute>
                        </cpdescription:hasCulturalPropertySpecification>
                    </xsl:if>
                </rdf:Description>
            </xsl:for-each>
            <!-- We add the definition as an individual. The definition is associated 
				with a Cultural Property Type by the property cpdescription:hasCulturalPropertyDefinition. -->
            <xsl:if test="schede/*/OG/OGT/OGTD and not(lower-case(normalize-space(schede/*/OG/OGT/OGTD))='nr' or lower-case(normalize-space(schede/*/OG/OGT/OGTD))='n.r.' or lower-case(normalize-space(schede/*/OG/OGT/OGTD))='nr (recupero pregresso)')">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat('https://w3id.org/arco/resource/CulturalPropertyDefinition/', arco-fn:urify(normalize-space(schede/*/OG/OGT/OGTD)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/objective/CulturalPropertyDefinition'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTD)" />
                    </rdfs:label>
                </rdf:Description>
            </xsl:if>
            <!-- We add the cultural property specification as an individual. It's 
				associated with a Cultural Property Type by the property cpdescription:hasCulturalPropertySpecification. -->
            <xsl:if test="schede/*/OG/OGT/OGTT">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat('https://w3id.org/arco/resource/CulturalPropertySpecification/', arco-fn:urify(normalize-space(schede/*/OG/OGT/OGTT)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/objective/CulturalPropertySpecification'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(schede/*/OG/OGT/OGTT)" />
                    </rdfs:label>
                </rdf:Description>
            </xsl:if>
            <!-- Ente Schedatore - Role in time CD/ESC -->
            <xsl:for-each select="schede/*/CD/ESC">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-cataloguing-agency')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/core/AgentRole'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="concat('Ente schedatore del bene ', $itemURI, ': ', .)" />
                    </rdfs:label>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="concat('Cataloguing agency for cultural property ', $itemURI, ': ', .)" />
                    </rdfs:label>
                    <arco:hasRole>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Role/CataloguinAgency')" />
                        </xsl:attribute>
                    </arco:hasRole>
                    <arco:hasAgent>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                        </xsl:attribute>
                    </arco:hasAgent>
                </rdf:Description>
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Role/CataloguinAgency')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="'Ente schedatore'" />
                    </rdfs:label>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="'Cataloguing agency'" />
                    </rdfs:label>
                    <arco:isRoleOf>
                    	<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-cataloguing-agency')" />
                        </xsl:attribute>
                    </arco:isRoleOf>
                </rdf:Description>
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(.)" />
                    </rdfs:label>
                    <l0:name>
                        <xsl:value-of select="normalize-space(.)" />
                    </l0:name>
                    <arco:isAgentOf>
                    	<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-cataloguing-agency')" />
                        </xsl:attribute>
                    </arco:isAgentOf>
                </rdf:Description>
            </xsl:for-each>
            <xsl:if test="schede/*/CD/ECP">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/core/AgentRole'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="concat('Ente competente per tutela del bene ', $itemURI, ': ', schede/*/CD/ECP)" />
                    </rdfs:label>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="concat('Heritage protection agency for cultural property ', $itemURI, ': ', schede/*/CD/ECP)" />
                    </rdfs:label>
                    <arco:hasRole>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Role/HeritageProtectionAgency')" />
                        </xsl:attribute>
                    </arco:hasRole>
                    <arco:hasAgent>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CD/ECP)))" />
                        </xsl:attribute>
                    </arco:hasAgent>
                </rdf:Description>
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Role/HeritageProtectionAgency')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="'Ente competente per tutela'" />
                    </rdfs:label>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="'Heritage Protection Agency'" />
                    </rdfs:label>
                    <arco:isRoleOf>
                    	<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
                        </xsl:attribute>
                    </arco:isRoleOf>
                </rdf:Description>
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CD/ECP)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(schede/*/CD/ECP)" />
                    </rdfs:label>
                    <l0:name>
                        <xsl:value-of select="normalize-space(schede/*/CD/ECP)" />
                    </l0:name>
                    <arco:isAgentOf>
                    	<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
                        </xsl:attribute>
                    </arco:isAgentOf>
                </rdf:Description>
            </xsl:if>
            <!-- Name in time -->
            <xsl:if test="schede/*/OG/OGD">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat('https://w3id.org/arco/resource/NameInTime/', arco-fn:urify(arco-fn:md5(schede/*/OG/OGD)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'http://dati.beniculturali.it/cis/NameInTime'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(schede/*/OG/OGD)" />
                    </rdfs:label>
                    <xsl:if test="schede/*/OG/OGD/OGDR">
                        <cis:isValidDuring>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat('https://w3id.org/arco/resource/TimeInterval/', arco-fn:urify(schede/*/OG/OGD/OGDR))" />
                            </xsl:attribute>
                        </cis:isValidDuring>
                    </xsl:if>
                </rdf:Description>
                <!-- Name in time - Time interval -->
                <xsl:if test="schede/*/OG/OGD/OGDR">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat('https://w3id.org/arco/resource/TimeInterval/', arco-fn:urify(schede/*/OG/OGD/OGDR))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:value-of select="normalize-space(schede/*/OG/OGD/OGDR)" />
                        </rdfs:label>
                        <tiapit:startTime>
                            <xsl:value-of select="schede/*/OG/OGD/OGDR" />
                        </tiapit:startTime>
                    </rdf:Description>
                </xsl:if>
            </xsl:if>
            <!-- We add the scope of protection as an individual. The scope of protection 
				is associated with a Cultural Property by the property cpdescription:hasMibactScopeOfProtection. 
				ALERT: this part has been removed in version 0.2 as the Mibact Scope of Protection 
				has been defined within the ontologies. -->
            <!-- xsl:if test="schede/*/OG/AMB"> <rdf:Description> <xsl:attribute name="rdf:about"> 
				<xsl:value-of select="concat('https://w3id.org/arco/resource/MibactScopeOfProtection/', 
				arco-fn:urify(normalize-space(schede/*/OG/AMB)))" /> </xsl:attribute> <rdf:type> 
				<xsl:attribute name="rdf:resource"> <xsl:value-of select="'https://w3id.org/arco/cpdescription/MibactScopeOfProtection'" 
				/> </xsl:attribute> </rdf:type> <rdfs:label> <xsl:value-of select="normalize-space(schede/*/OG/AMB)" 
				/> </rdfs:label> </rdf:Description> </xsl:if -->
            <!-- We add the category as an individual. The category is associated 
				with a Cultural Property by the property cpdescription:hasCategory. -->
            <xsl:if test="schede/*/OG/CTG">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat('https://w3id.org/arco/resource/CulturalPropertyCategory/', arco-fn:urify(normalize-space(schede/*/OG/CTG)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/core/CulturalPropertyCategory'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(schede/*/OG/CTG)" />
                    </rdfs:label>
                </rdf:Description>
            </xsl:if>
            <!-- We add the cultural scope attribution as an individual. -->
            <xsl:for-each select="schede/*/AU/ATB">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'CulturalScopeAttribution/', $itemURI, '-attribuzione-ambito-culturale-', position())" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/subjective/CulturalScopeAttribution'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                    	<xsl:value-of select="concat('Attribuzione di ambito culturale del bene: ', $itemURI)" />
                    </rdfs:label>
                    <l0:name xml:lang="it">
                    	<xsl:value-of select="concat('Attribuzione di ambito culturale del bene: ', $itemURI)" />
                    </l0:name>
                    <rdfs:label xml:lang="en">
                    	<xsl:value-of select="concat('Cultural scope attribution of cultural property: ', $itemURI)" />
                    </rdfs:label>
                    <l0:name xml:lang="en">
                    	<xsl:value-of select="concat('Cultural scope attribution of cultural property: ', $itemURI)" />
                    </l0:name>
                    <xsl:if test="./ATBD">
                        <culturaldefinition:hasCulturalScope>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'CulturalScope/', arco-fn:urify(normalize-space(./ATBD)))" />
                            </xsl:attribute>
                        </culturaldefinition:hasCulturalScope>
                    </xsl:if>
                    <xsl:if test="./ATBR">
                        <culturaldefinition:hasInterventionRole>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Role/', $itemURI, '-', arco-fn:urify(normalize-space(./ATBR)))" />
                            </xsl:attribute>
                        </culturaldefinition:hasInterventionRole>
                    </xsl:if>
                    <xsl:if test="./ATBS">
                        <arco:note>
                            <xsl:value-of select="normalize-space(./ATBS)" />
                        </arco:note>
                    </xsl:if>
                    <xsl:if test="./ATBM and not(lower-case(normalize-space(./ATBM))='nr' or lower-case(normalize-space(./ATBM))='nr (recupero pregresso)' or lower-case(normalize-space(./ATBM))='n.r.')">
                        <culturaldefinition:hasSource>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./ATBM)))" />
                            </xsl:attribute>
                        </culturaldefinition:hasSource>
                    </xsl:if>
                </rdf:Description>
                <!-- We add the cultural scope attribution source as an individual. -->
                <xsl:if test="./ATBM and not(lower-case(normalize-space(./ATBM))='nr' or lower-case(normalize-space(./ATBM))='nr (recupero pregresso)' or lower-case(normalize-space(./ATBM))='n.r.')">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./ATBM)))" />
                        </xsl:attribute>
                        <rdf:type rdf:resource="https://w3id.org/arco/subjective/Source" />
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
                            <xsl:value-of select="concat($NS, 'Role/', $itemURI, '-', arco-fn:urify(normalize-space(./ATBR)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
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
                <xsl:if test="./ATBD">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'CulturalScope/', arco-fn:urify(normalize-space(./ATBD)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/subjective/CulturalScope'" />
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
            <xsl:for-each select="schede/*/AU/AUT">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/subjective/PreferredAuthorshipAttribution'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                    	<xsl:value-of select="concat('Attribuzione di autore preferita, maggiormente accreditata o convincente del bene: ', $itemURI)" />
                    </rdfs:label>
                    <l0:name xml:lang="it">
                    	<xsl:value-of select="concat('Attribuzione di autore preferita, maggiormente accreditata o convincente del bene: ', $itemURI)" />
                    </l0:name>
                    <rdfs:label xml:lang="en">
                    	<xsl:value-of select="concat('Preferred authorship attribution of cultural property: ', $itemURI)" />
                    </rdfs:label>
                    <l0:name xml:lang="en">
                    	<xsl:value-of select="concat('Preferred authorship attribution of cultural property: ', $itemURI)" />
                    </l0:name>
                    <xsl:if test="./AUTN">
                        <culturaldefinition:hasAttributedAuthor>
                            <xsl:attribute name="rdf:resource">
                            	<xsl:variable name="author">
		                            <xsl:choose>
		                                <xsl:when test="./AUTA">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTN)), '-', arco-fn:urify(normalize-space(./AUTA)))" />
		                                </xsl:when>
		                                <xsl:otherwise>
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTN)))" />
		                                </xsl:otherwise>
		                            </xsl:choose>
	                            </xsl:variable>
	                            <xsl:choose>
	                                <xsl:when test="./AUTS">
	                                    <xsl:value-of select="concat($author, '-', arco-fn:urify(normalize-space(./AUTS)))" />
	                                </xsl:when>
	                                <xsl:otherwise>
	                                    <xsl:value-of select="$author" />
	                                </xsl:otherwise>
	                            </xsl:choose>
                            </xsl:attribute>
                        </culturaldefinition:hasAttributedAuthor>
                    </xsl:if>
                    <xsl:if test="./AUTR and not(lower-case(normalize-space(./AUTR))='nr' or lower-case(normalize-space(./AUTR))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTR))='n.r.')">
                        <culturaldefinition:hasInterventionRole>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./AUTR)))" />
                            </xsl:attribute>
                        </culturaldefinition:hasInterventionRole>
                    </xsl:if>
                    <xsl:if test="./AUTY">
                        <culturaldefinition:authorIntervention>
                            <xsl:value-of select="normalize-space(./AUTY)" />
                        </culturaldefinition:authorIntervention>
                    </xsl:if>
                    <xsl:if test="./AUTZ">
                        <arco:note>
                            <xsl:value-of select="normalize-space(./AUTZ)" />
                        </arco:note>
                    </xsl:if>
                    <xsl:if test="./AUTJ">
                        <culturaldefinition:hasAuthorityFileCataloguingAgency>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTJ)))" />
                            </xsl:attribute>
                        </culturaldefinition:hasAuthorityFileCataloguingAgency>
                    </xsl:if>
                    <xsl:if test="./AUTM and not(lower-case(normalize-space(./AUTM))='nr' or lower-case(normalize-space(./AUTM))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTM))='n.r.')">
                        <culturaldefinition:hasSource>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./AUTM)))" />
                            </xsl:attribute>
                        </culturaldefinition:hasSource>
                    </xsl:if>
                </rdf:Description>
                <xsl:if test="./AUTJ">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTJ)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
                <xsl:if test="./AUTM and not(lower-case(normalize-space(./AUTM))='nr' or lower-case(normalize-space(./AUTM))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTM))='n.r.')">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./AUTM)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/subjective/Source'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:value-of select="normalize-space(./AUTM)" />
                        </rdfs:label>
                        <l0:name>
                            <xsl:value-of select="normalize-space(./AUTM)" />
                        </l0:name>
                    </rdf:Description>
                </xsl:if>
                <xsl:if test="./AUTR and not(lower-case(normalize-space(./AUTR))='nr' or lower-case(normalize-space(./AUTR))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTR))='n.r.')">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./AUTR)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:value-of select="normalize-space(./AUTR)" />
                        </rdfs:label>
                        <l0:name>
                            <xsl:value-of select="normalize-space(./AUTR)" />
                        </l0:name>
                    </rdf:Description>
                </xsl:if>
                <xsl:if test="./AUTN">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                        	<xsl:variable name="author">
	                            <xsl:choose>
	                                <xsl:when test="./AUTA">
	                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTN)), '-', arco-fn:urify(normalize-space(./AUTA)))" />
	                                </xsl:when>
	                                <xsl:otherwise>
	                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTN)))" />
	                                </xsl:otherwise>
	                            </xsl:choose>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="./AUTS">
                                    <xsl:value-of select="concat($author, '-', arco-fn:urify(normalize-space(./AUTS)))" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$author" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="lower-case(normalize-space(./AUTP))=p">
                                        <xsl:value-of select="'https://w3id.org/italia/onto/CPV/Person'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./AUTP))=e">
                                        <xsl:value-of select="'https://w3id.org/italia/onto/COV/Organization'" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:choose>
                                <xsl:when test="./AUTS">
                                    <xsl:value-of select="concat(normalize-space(./AUTN), ' (', normalize-space(./AUTS), ')')" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="normalize-space(./AUTN)" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </rdfs:label>
                        <l0:name>
                            <xsl:choose>
                                <xsl:when test="./AUTS">
                                    <xsl:value-of select="concat(normalize-space(./AUTN), ' (', normalize-space(./AUTS), ')')" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="normalize-space(./AUTN)" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </l0:name>
                        <xsl:if test="./AUTA">
                            <culturaldefinition:authorDate>
                                <xsl:value-of select="normalize-space(./AUTA)" />
                            </culturaldefinition:authorDate>
                        </xsl:if>
                        <xsl:if test="./AUTH">
                            <culturaldefinition:authorLocalIdentifier>
                                <xsl:value-of select="normalize-space(./AUTH)" />
                            </culturaldefinition:authorLocalIdentifier>
                        </xsl:if>
                        <xsl:if test="./AUTK">
                            <culturaldefinition:authorICCDIdentifier>
                                <xsl:value-of select="normalize-space(./AUTK)" />
                            </culturaldefinition:authorICCDIdentifier>
                        </xsl:if>
                        <xsl:if test="./NCUN">
                            <culturaldefinition:authorICCDIdentifier>
                                <xsl:value-of select="normalize-space(./NCUN)" />
                            </culturaldefinition:authorICCDIdentifier>
                        </xsl:if>
                    </rdf:Description>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="schede/*/AU/CMM">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'Commission/', $itemURI, '-', position())" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/subjective/Commission'" />
                        </xsl:attribute>
                    </rdf:type>
                    <xsl:if test="./CMMN">
                        <culturaldefinition:hasCommittent>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CMMN)))" />
                            </xsl:attribute>
                        </culturaldefinition:hasCommittent>
                    </xsl:if>
                    <xsl:if test="./CMMC">
                        <culturaldefinition:hasCircumstance>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./CMMC)))" />
                            </xsl:attribute>
                        </culturaldefinition:hasCircumstance>
                    </xsl:if>
                    <xsl:if test="./CMMF and not(lower-case(normalize-space(./CMMF))='nr' or lower-case(normalize-space(./CMMF))='nr (recupero pregresso)' or lower-case(normalize-space(./CMMF))='n.r.')">
                        <culturaldefinition:hasSource>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./CMMF)))" />
                            </xsl:attribute>
                        </culturaldefinition:hasSource>
                    </xsl:if>
                    <!-- Valentina timeinterval -->
                    <xsl:if test="./CMMD">
                        <tiapit:atTime>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./CMMD)))" />
                            </xsl:attribute>
                        </tiapit:atTime>
                    </xsl:if>
                    <xsl:if test="./CMMY">
                        <arco:note>
                            <xsl:value-of select="normalize-space(./CMMY)" />
                        </arco:note>
                    </xsl:if>
                </rdf:Description>
                <!-- Valentina timeinterval -->
                <xsl:if test="./CMMD">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./CMMD)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
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
                <xsl:if test="./CMMF and not(lower-case(normalize-space(./CMMF))='nr' or lower-case(normalize-space(./CMMF))='nr (recupero pregresso)' or lower-case(normalize-space(./CMMF))='n.r.')">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./CMMF)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/subjective/Source'" />
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
                            <xsl:value-of select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./CMMC)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/subjective/Circumstance'" />
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
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./CMMN)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
            <xsl:for-each select="schede/*/AU/AAT">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'AlternativeAuthorshipAttribution/', $itemURI, '-', position())" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/subjective/AlternativeAuthorshipAttribution'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                    	<xsl:value-of select="concat('Attribuzione superata, alternativa o tradizionale di autore del bene: ', $itemURI)" />
                    </rdfs:label>
                    <l0:name xml:lang="it">
                    	<xsl:value-of select="concat('Attribuzione superata, alternativa o tradizionale di autore del bene: ', $itemURI)" />
                    </l0:name>
                    <rdfs:label xml:lang="en">
                    	<xsl:value-of select="concat('Alternative authorship attribution of cultural property: ', $itemURI)" />
                    </rdfs:label>
                    <l0:name xml:lang="en">
                    	<xsl:value-of select="concat('Alternative authorship attribution of cultural property: ', $itemURI)" />
                    </l0:name>
                    <culturaldefinition:hasAttributedAuthor>
                        <xsl:attribute name="rdf:resource">
                        	<xsl:variable name="author">
	                            <xsl:choose>
	                                <xsl:when test="./AATN">
		                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AATN)))" />
		                            </xsl:when>
		                            <xsl:otherwise>
		                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
		                            </xsl:otherwise>
	                            </xsl:choose>
	                        </xsl:variable>
	                        <xsl:choose>
	                        	<xsl:when test="./AATA">
	                            	<xsl:value-of select="concat($author, '-', arco-fn:urify(normalize-space(./AATA)))" />
	                            </xsl:when>
	                            <xsl:otherwise>
	                            	<xsl:value-of select="$author" />
	                            </xsl:otherwise>
	                       </xsl:choose>
                        </xsl:attribute>
                    </culturaldefinition:hasAttributedAuthor>
                    <xsl:if test="./AATY">
                        <arco:note>
                            <xsl:value-of select="normalize-space(./AATY)" />
                        </arco:note>
                    </xsl:if>
                    <xsl:if test="./AATM and not(lower-case(normalize-space(./AATM))='nr' or lower-case(normalize-space(./AATM))='nr (recupero pregresso)' or lower-case(normalize-space(./AATM))='n.r.')">
                        <culturaldefinition:hasSource>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./AATM)))" />
                            </xsl:attribute>
                        </culturaldefinition:hasSource>
                    </xsl:if>
                </rdf:Description>
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                    	<xsl:variable name="author">
                            <xsl:choose>
                                <xsl:when test="./AATN">
	                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AATN)))" />
	                            </xsl:when>
	                            <xsl:otherwise>
	                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
	                            </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:choose>
                        	<xsl:when test="./AATA">
                            	<xsl:value-of select="concat($author, '-', arco-fn:urify(normalize-space(./AATA)))" />
                            </xsl:when>
                            <xsl:otherwise>
                            	<xsl:value-of select="$author" />
                            </xsl:otherwise>
                       </xsl:choose>
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label>
                        <xsl:choose>
                            <xsl:when test="./AATN">
                                <xsl:value-of select="normalize-space(./AATN)" />
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
                            <xsl:otherwise>
                                <xsl:value-of select="normalize-space(.)" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </l0:name>
                    <xsl:if test="./AATA">
                        <culturaldefinition:authorDate>
                            <xsl:value-of select="normalize-space(./AATA)" />
                        </culturaldefinition:authorDate>
                    </xsl:if>
                </rdf:Description>
                <xsl:if test="./AATM and not(lower-case(normalize-space(./AATM))='nr' or lower-case(normalize-space(./AATM))='nr (recupero pregresso)' or lower-case(normalize-space(./AATM))='n.r.')">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./AATM)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/subjective/Source'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:value-of select="normalize-space(./AATM)" />
                        </rdfs:label>
                        <l0:name>
                            <xsl:value-of select="normalize-space(./AATM)" />
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
            <xsl:for-each select="schede/*/CO/STC">
                <xsl:if test="./*">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'ConservationStatus/', $itemURI, '-stato-conservazione-', position())" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/objective/ConservationStatus'" />
                            </xsl:attribute>
                        </rdf:type>
                        <cpdescription:hasConservationStatusType>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <!-- Valentina - aggiunto lower case per intercettare anche maiuscoli e aggiunti alcuni or in base ai dati -->
                                    <xsl:when test="lower-case(normalize-space(./STCC))='buono' or lower-case(normalize-space(./STCC))='buonoe' or lower-case(normalize-space(./STCC))='buona'">
                                        <xsl:value-of select="'https://w3id.org/arco/objective/Good'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./STCC))='mediocre'">
                                        <xsl:value-of select="'https://w3id.org/arco/objective/Mediocre'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./STCC))='discreto' or lower-case(normalize-space(./STCC))='discreta'">
                                        <xsl:value-of select="'https://w3id.org/arco/objective/Decent'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./STCC))='cattivo' or lower-case(normalize-space(./STCC))='cattiva'">
                                        <xsl:value-of select="'https://w3id.org/arco/objective/Bad'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./STCC))='dato non disponibile'">
                                        <xsl:value-of select="'https://w3id.org/arco/objective/Unavailable'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./STCC))='NR (recupero pregresso)' or lower-case(normalize-space(./STCC))='NR'">
                                        <xsl:value-of select="'https://w3id.org/arco/objective/NR'" />
                                    </xsl:when>
                                    <xsl:when test="./STCC">
                                        <xsl:value-of select="concat('https://w3id.org/arco/objective/', arco-fn:urify(normalize-space(./STCC)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </cpdescription:hasConservationStatusType>
                        <xsl:if test="./STCS">
                            <arco:specifications>
                                <xsl:value-of select="normalize-space(./STCS)" />
                            </arco:specifications>
                        </xsl:if>
                        <xsl:if test="./STCN">
                            <arco:note>
                                <xsl:value-of select="normalize-space(./STCN)" />
                            </arco:note>
                        </xsl:if>
                    </rdf:Description>
                    <xsl:choose>
                        <!-- Valentina - aggiunto lower case per intercettare anche i maiuscoli -->
                        <xsl:when test="lower-case(normalize-space(./STCC))='buono' or lower-case(normalize-space(./STCC))='buonoe' or lower-case(normalize-space(./STCC))='buona'" />
                        <xsl:when test="lower-case(normalize-space(./STCC))='mediocre'" />
                        <xsl:when test="lower-case(normalize-space(./STCC))='discreto' or lower-case(normalize-space(./STCC))='discreta'" />
                        <xsl:when test="lower-case(normalize-space(./STCC))='cattivo' or lower-case(normalize-space(./STCC))='cattiva'" />
                        <xsl:when test="lower-case(normalize-space(./STCC))='dato non disponibile'" />
                        <xsl:when test="lower-case(normalize-space(./STCC))='NR (recupero pregresso)' or lower-case(normalize-space(./STCC))='NR'" />
                        <xsl:when test="./STCC">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat('https://w3id.org/arco/objective/', arco-fn:urify(normalize-space(./STCC)))" />
                                </xsl:attribute>
                                <rdf:type rdf:resource="https://w3id.org/arco/objective/ConservationStatusType" />
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
            </xsl:for-each>
            <!-- We create the Time Indexed Qualified Location associated with the 
				Cultural Property -->
            <xsl:if test="schede/*/LC">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-current')" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/location/TimeIndexedQualifiedLocation'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                    	<xsl:value-of select="concat('Localizzazione fisica attuale del bene: ', $itemURI)" />
                    </rdfs:label>
                    <l0:name xml:lang="it">
                    	<xsl:value-of select="concat('Localizzazione fisica attuale del bene: ', $itemURI)" />
                    </l0:name>
                    <rdfs:label xml:lang="en">
                    	<xsl:value-of select="concat('Current physical location of cultural property: ', $itemURI)" />
                    </rdfs:label>
                    <l0:name xml:lang="en">
                    	<xsl:value-of select="concat('Current physical location of cultural property: ', $itemURI)" />
                    </l0:name>
                    <locgeoamm:hasLocationType>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/location/CurrentPhysicalLocation'" />
                        </xsl:attribute>
                    </locgeoamm:hasLocationType>
                    <xsl:if test="schede/*/LC/LDC/LDCS">
                        <arco:specifications>
                            <xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCS)" />
                        </arco:specifications>
                    </xsl:if>
                    <xsl:if test="schede/*/LC/PVC/PVCV">
                        <locgeoamm:locationDetails>
                            <xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCV)" />
                        </locgeoamm:locationDetails>
                    </xsl:if>
                    <xsl:if test="schede/*/LC/LCN">
                        <arco:note>
                            <xsl:value-of select="normalize-space(schede/*/LC/LCN)" />
                        </arco:note>
                    </xsl:if>
                    <xsl:if test="schede/*/UB/UBO">
                        <arco:note>
                            <xsl:value-of select="concat('Ubicazione originaria: ', normalize-space(schede/*/UB/UBO))" />
                        </arco:note>
                    </xsl:if>
                    <xsl:if test="schede/*/LC/LDC/LDCD">
                        <tiapit:atTime>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCD)))" />
                            </xsl:attribute>
                        </tiapit:atTime>
                    </xsl:if>
                </rdf:Description>
            </xsl:if>
            <!-- Time Interval for Current Location -->
            <xsl:if test="schede/*/LC/LDC/LDCD">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCD)))" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInteval'" />
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
                        <xsl:value-of select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-alternative-', position())" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/location/TimeIndexedQualifiedLocation'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                    	<xsl:value-of select="concat('Localizzazione alternativa ', position(), ' del bene: ', $itemURI)" />
                    </rdfs:label>
                    <l0:name xml:lang="it">
                    	<xsl:value-of select="concat('Localizzazione alternativa ', position(), ' del bene: ', $itemURI)" />
                    </l0:name>
                    <rdfs:label xml:lang="en">
                    	<xsl:value-of select="concat('Alternative location ', position(), ' of cultural property: ', $itemURI)" />
                    </rdfs:label>
                    <l0:name xml:lang="en">
                    	<xsl:value-of select="concat('Alternative location ', position(), ' of cultural property: ', $itemURI)" />
                    </l0:name>
                    <xsl:if test="./PRC/PRCS">
                        <arco:specifications>
                            <xsl:value-of select="normalize-space(./PRC/PRCS)" />
                        </arco:specifications>
                    </xsl:if>
                    <xsl:if test="./LAN">
                        <arco:note>
                            <xsl:value-of select="normalize-space(./LAN)" />
                        </arco:note>
                    </xsl:if>
                    <xsl:if test="./TLC or ./TCL or ../../F/LR and not(./TLC='.' or ./TCL='.' or ./TLC='-' or ./TCL='-' or ./TLC='/' or ./TCL='/')">
                        <locgeoamm:hasLocationType>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="lower-case(normalize-space(./TLC))='luogo di provenienza/collocazione precedente' or lower-case(normalize-space(./TCL))='luogo di provenienza' or lower-case(normalize-space(./TLC))='provenienza' or lower-case(normalize-space(./TCL))='provenienza'">
                                        <xsl:value-of select="'https://w3id.org/arco/location/LastLocation'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./TLC))='luogo di produzione/realizzazione' or lower-case(normalize-space(./TCL))='luogo di esecuzione/fabbricazione'">
                                        <xsl:value-of select="'https://w3id.org/arco/location/ProductionRealizationLocation'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./TLC))='luogo di reperimento' or lower-case(normalize-space(./TCL))='luogo di reperimento' or lower-case(normalize-space(./TLC))='reperimento' or lower-case(normalize-space(./TCL))='reperimento'">
                                        <xsl:value-of select="'https://w3id.org/arco/location/FindingLocation'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./TLC))='luogo di deposito' or lower-case(normalize-space(./TCL))='luogo di deposito' or lower-case(normalize-space(./TLC))='deposito temporaneo' or lower-case(normalize-space(./TCL))='deposito temporaneo' or lower-case(normalize-space(./TLC))='deposito' or lower-case(normalize-space(./TCL))='deposito'">
                                        <xsl:value-of select="'https://w3id.org/arco/location/StorageLocation'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./TLC))='luogo di esposizione' or lower-case(normalize-space(./TCL))='luogo di esposizione' or lower-case(normalize-space(./TLC))='espositiva' or lower-case(normalize-space(./TCL))='espositiva' or lower-case(normalize-space(./TLC))='espositivo' or lower-case(normalize-space(./TCL))='espositivo' or lower-case(normalize-space(./TLC))='esposizione' or lower-case(normalize-space(./TCL))='esposizione'">
                                        <xsl:value-of select="'https://w3id.org/arco/location/ExhibitionLocation'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./TLC))='luogo di rilevamento' or lower-case(normalize-space(./TCL))='luogo di rilevamento' or lower-case(normalize-space(./TCL))='di rilevamento' or lower-case(normalize-space(./TLC))='di rilevamento' or lower-case(normalize-space(./TCL))='localizzazione di rilevamento' or lower-case(normalize-space(./TLC))='localizzazione di rilevamento'">
                                        <xsl:value-of select="'https://w3id.org/arco/location/ObservationLocation'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./TLC))='area rappresentata' or lower-case(normalize-space(./TCL))='area rappresentata'">
                                        <xsl:value-of select="'https://w3id.org/arco/location/SubjectLocation'" />
                                    </xsl:when>
                                    <xsl:when test="./TLC">
                                        <xsl:variable name="tlc" select="normalize-space(./TLC)" />
                                        <xsl:value-of select="concat('https://w3id.org/arco/location/', arco-fn:urify(normalize-space(./TLC)))" />
                                    </xsl:when>
                                    <xsl:when test="./TCL">
                                        <xsl:variable name="tcl" select="normalize-space(./TCL)" />
                                        <xsl:value-of select="concat('https://w3id.org/arco/location/', arco-fn:urify(normalize-space(./TCL)))" />
                                    </xsl:when>
                                    <xsl:when test="../../F/LR">
                                    	<xsl:value-of select="'https://w3id.org/arco/location/ShotLocation'" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </locgeoamm:hasLocationType>
                    </xsl:if>
                    <xsl:if test="./PRD or ../../F/LR/LRD">
                        <tiapit:atTime>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeInterval/', $itemURI, '-time-interval-', position())" />
                            </xsl:attribute>
                        </tiapit:atTime>
                    </xsl:if>
                </rdf:Description>
                <xsl:if test="./TLC or ./TCL">
                    <xsl:choose>
                        <xsl:when test="lower-case(normalize-space(./TLC))='luogo di provenienza/collocazione precedente' or lower-case(normalize-space(./TCL))='luogo di provenienza' or lower-case(normalize-space(./TLC))='provenienza' or lower-case(normalize-space(./TCL))='provenienza'" />
                        <xsl:when test="lower-case(normalize-space(./TLC))='luogo di produzione/realizzazione' or lower-case(normalize-space(./TCL))='luogo di esecuzione/fabbricazione'" />
                        <xsl:when test="lower-case(normalize-space(./TLC))='luogo di reperimento' or lower-case(normalize-space(./TCL))='luogo di reperimento' or lower-case(normalize-space(./TLC))='reperimento' or lower-case(normalize-space(./TCL))='reperimento'" />
                        <xsl:when test="lower-case(normalize-space(./TLC))='luogo di deposito' or lower-case(normalize-space(./TCL))='luogo di deposito' or lower-case(normalize-space(./TLC))='deposito temporaneo' or lower-case(normalize-space(./TCL))='deposito temporaneo' or lower-case(normalize-space(./TLC))='deposito' or lower-case(normalize-space(./TCL))='deposito'" />
                        <xsl:when test="lower-case(normalize-space(./TLC))='luogo di esposizione' or lower-case(normalize-space(./TCL))='luogo di esposizione' or lower-case(normalize-space(./TLC))='espositiva' or lower-case(normalize-space(./TCL))='espositiva' or lower-case(normalize-space(./TLC))='espositivo' or lower-case(normalize-space(./TCL))='espositivo' or lower-case(normalize-space(./TLC))='esposizione' or lower-case(normalize-space(./TCL))='esposizione'" />
                        <xsl:when test="lower-case(normalize-space(./TLC))='luogo di rilevamento' or lower-case(normalize-space(./TCL))='luogo di rilevamento' or lower-case(normalize-space(./TCL))='di rilevamento' or lower-case(normalize-space(./TLC))='di rilevamento' or lower-case(normalize-space(./TCL))='localizzazione di rilevamento' or lower-case(normalize-space(./TLC))='localizzazione di rilevamento'" />
                        <xsl:when test="lower-case(normalize-space(./TLC))='area rappresentata' or lower-case(normalize-space(./TCL))='area rappresentata'" />
                        <xsl:when test="./TLC and not(./TLC='.' or ./TLC='-' or ./TLC='/')">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat('https://w3id.org/arco/location/', arco-fn:urify(normalize-space(./TLC)))" />
                                </xsl:attribute>
                                <rdf:type rdf:resource="https://w3id.org/arco/location/LocationType" />
                                <rdfs:label>
                                    <xsl:value-of select="./TLC" />
                                </rdfs:label>
                                <l0:name>
                                    <xsl:value-of select="./TLC" />
                                </l0:name>
                            </rdf:Description>
                        </xsl:when>
                        <xsl:when test="./TCL and not(./TCL='.' or ./TCL='-' or ./TCL='/')">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat('https://w3id.org/arco/location/', arco-fn:urify(normalize-space(./TCL)))" />
                                </xsl:attribute>
                                <rdf:type rdf:resource="https://w3id.org/arco/location/LocationType" />
                                <rdfs:label>
                                    <xsl:value-of select="./TCL" />
                                </rdfs:label>
                                <l0:name>
                                    <xsl:value-of select="./TCL" />
                                </l0:name>
                            </rdf:Description>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>
                <!-- Monumental Area as individual in the scope of the Site of LA -->
                <xsl:if test="./PRC/PRCC">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'MonumentalArea/', arco-fn:urify(normalize-space(./PRC/PRCC)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'http://dati.beniculturali.it/cis/MonumentalArea'" />
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
                            <xsl:value-of select="concat($NS, 'TimeInterval/', $itemURI, '-time-interval-', position())" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInteval'" />
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
                	<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(schede/*/LC/PVC), normalize-space(schede/*/LC/PVL), normalize-space(schede/*/LC/LDC/LDCU)))))" />
                </xsl:variable>
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="$address" />
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/clv/Address'" />
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
                        <locgeoamm:hasToponymInTime>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="schede/*/LC/PVL/PVLT">
                                        <xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(schede/*/LC/PVL/PVLT)))" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(schede/*/LC/PVL)))" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                        </locgeoamm:hasToponymInTime>
                    </xsl:if>
                    <xsl:if test="schede/*/LC/PVC/PVCI and not(schede/*/LC/PVC/PVCI='.' or schede/*/LC/PVC/PVCI='-' or schede/*/LC/PVC/PVCI='/')">
                        <clvapit:fullAddress>
                            <xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCI)" />
                        </clvapit:fullAddress>
                    </xsl:if>
                    <xsl:if test="schede/*/LC/LDC/LDCU and not(schede/*/LC/LDC/LDCU='.' or schede/*/LC/LDC/LDCU='-' or schede/*/LC/LDC/LDCU='/')">
                        <clvapit:fullAddress>
                            <xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCU)" />
                        </clvapit:fullAddress>
                    </xsl:if>
                    <!-- Stato -->
                    <xsl:if test="schede/*/LC/PVC/PVCS">
                        <clvapit:hasCountry>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(schede/*/LC/PVC/PVCS))" />
                            </xsl:attribute>
                        </clvapit:hasCountry>
                    </xsl:if>
                    <!-- Regione -->
                    <xsl:if test="schede/*/LC/PVC/PVCR">
                        <clvapit:hasRegion>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(schede/*/LC/PVC/PVCR))" />
                            </xsl:attribute>
                        </clvapit:hasRegion>
                    </xsl:if>
                    <!-- Provincia -->
                    <xsl:if test="schede/*/LC/PVC/PVCP">
                        <clvapit:hasProvince>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(schede/*/LC/PVC/PVCP))" />
                            </xsl:attribute>
                        </clvapit:hasProvince>
                    </xsl:if>
                    <!-- Comune -->
                    <xsl:if test="schede/*/LC/PVC/PVCC">
                        <clvapit:hasCity>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(schede/*/LC/PVC/PVCC))" />
                            </xsl:attribute>
                        </clvapit:hasCity>
                    </xsl:if>
                    <!-- Località -->
                    <xsl:if test="schede/*/LC/PVC/PVCL">
                        <clvapit:hasAddressArea>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(schede/*/LC/PVC/PVCL))" />
                            </xsl:attribute>
                        </clvapit:hasAddressArea>
                    </xsl:if>
                    <xsl:if test="schede/*/LC/PVC/PVCE">
                        <clvapit:hasAddressArea>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(schede/*/LC/PVC/PVCE))" />
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
                                    <xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(schede/*/LC/PVL/PVLT)))" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(schede/*/LC/PVL)))" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/location/ToponymInTime'" />
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
                            <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(schede/*/LC/PVC/PVCS))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/clv/Country'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:value-of select="schede/*/LC/PVC/PVCS" />
                        </rdfs:label>
                        <l0:name>
                            <xsl:value-of select="schede/*/LC/PVC/PVCS" />
                        </l0:name>
                    </rdf:Description>
                </xsl:if>
                <!-- Regione -->
                <xsl:if test="schede/*/LC/PVC/PVCR">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(schede/*/LC/PVC/PVCR))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/clv/Region'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:value-of select="schede/*/LC/PVC/PVCR" />
                        </rdfs:label>
                        <l0:name>
                            <xsl:value-of select="schede/*/LC/PVC/PVCR" />
                        </l0:name>
                    </rdf:Description>
                </xsl:if>
                <!-- Provincia -->
                <xsl:if test="schede/*/LC/PVC/PVCP">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(schede/*/LC/PVC/PVCP))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/clv/Province'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:value-of select="schede/*/LC/PVC/PVCP" />
                        </rdfs:label>
                        <l0:name>
                            <xsl:value-of select="schede/*/LC/PVC/PVCP" />
                        </l0:name>
                    </rdf:Description>
                </xsl:if>
                <!-- Comune -->
                <xsl:if test="schede/*/LC/PVC/PVCC">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(schede/*/LC/PVC/PVCC))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/clv/City'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:value-of select="schede/*/LC/PVC/PVCC" />
                        </rdfs:label>
                        <l0:name>
                            <xsl:value-of select="schede/*/LC/PVC/PVCC" />
                        </l0:name>
                    </rdf:Description>
                </xsl:if>
                <!-- Address Area -->
                <xsl:if test="schede/*/LC/PVC/PVCL">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(schede/*/LC/PVC/PVCL))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/clv/AddressArea'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:value-of select="schede/*/LC/PVC/PVCL" />
                        </rdfs:label>
                        <l0:name>
                            <xsl:value-of select="schede/*/LC/PVC/PVCL" />
                        </l0:name>
                    </rdf:Description>
                </xsl:if>
                <xsl:if test="schede/*/LC/PVC/PVCE">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(schede/*/LC/PVC/PVCE))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/clv/AddressArea'" />
                            </xsl:attribute>
                        </rdf:type>
                        <rdfs:label>
                            <xsl:value-of select="schede/*/LC/PVC/PVCE" />
                        </rdfs:label>
                        <l0:name>
                            <xsl:value-of select="schede/*/LC/PVC/PVCE" />
                        </l0:name>
                    </rdf:Description>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="schede/*/LC/LDC/*">
                        <xsl:variable name="site" select="concat($NS, 'Site/', arco-fn:urify(arco-fn:md5(concat(normalize-space(schede/*/LC/LDC), normalize-space(schede/*/LC/PVC)))))" />
                        <rdf:Description>
                            <xsl:attribute name="rdf:about">
                                <xsl:value-of select="$site" />
                            </xsl:attribute>
                            <rdf:type>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="'http://dati.beniculturali.it/cis/Site'" />
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
                                        <xsl:value-of select="$address" />
                                    </xsl:attribute>
                                </cis:siteAddress>
                            </xsl:if>
                            <xsl:if test="schede/*/LC/LDC/LDCK">
                                <locgeoamm:siteIdentifier>
                                    <xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCK)" />
                                </locgeoamm:siteIdentifier>
                            </xsl:if>
                            <xsl:if test="schede/*/LC/LDC/LDCM">
                                <cis:isSiteOf>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                    </xsl:attribute>
                                </cis:isSiteOf>
                            </xsl:if>
                            <xsl:if test="schede/*/LC/LDC/LDCC">
                                <cis:isPartOf>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="concat($NS, 'MonumentalArea/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCC)))" />
                                    </xsl:attribute>
                                </cis:isPartOf>
                            </xsl:if>
                            <!-- Site Type -->
                            <xsl:if test="schede/*/LC/LDC/LDCT and not(normalize-space(schede/*/LC/LDC/LDCT)='.')">
                                <locgeoamm:hasSiteType>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:choose>
                                        <!-- Valentina: tolto $itemURI da URI -->
                                            <xsl:when test="schede/*/LC/LDC/LDCQ">
                                                <xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCT)), '-', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCQ)))" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCT)))" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                </locgeoamm:hasSiteType>
                            </xsl:if>
                        </rdf:Description>
                        <!-- Site Type as an individual -->
                        <xsl:if test="schede/*/LC/LDC/LDCT and not(normalize-space(schede/*/LC/LDC/LDCT)='.')">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:choose>
                                    <!-- Valentina: tolto $itemURI da URI -->
                                        <xsl:when test="schede/*/LC/LDC/LDCQ">
                                            <xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCT)), '-', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCQ)))" />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCT)))" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <rdf:type>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="'https://w3id.org/arco/location/SiteType'" />
                                    </xsl:attribute>
                                </rdf:type>
                                <rdfs:label>
                                <xsl:choose>
                                	<xsl:when test="schede/*/LC/LDC/LDCQ">
                                    	<xsl:value-of select="concat('Tipo di contenitore fisico:', ' ', normalize-space(schede/*/LC/LDC/LDCT), ' ', normalize-space(schede/*/LC/LDC/LDCQ))" />
                                	</xsl:when>
                                	<xsl:otherwise>
                                		<xsl:value-of select="concat('Tipo di contenitore fisico:', ' ', normalize-space(schede/*/LC/LDC/LDCT))" />
                                	</xsl:otherwise>
                                </xsl:choose>
                                </rdfs:label>
                                <l0:name>
                                    <xsl:choose>
                                	<xsl:when test="schede/*/LC/LDC/LDCQ">
                                    	<xsl:value-of select="concat('Tipo di contenitore fisico:', ' ', normalize-space(schede/*/LC/LDC/LDCT), ' ', normalize-space(schede/*/LC/LDC/LDCQ))" />
                                	</xsl:when>
                                	<xsl:otherwise>
                                		<xsl:value-of select="concat('Tipo di contenitore fisico:', ' ', normalize-space(schede/*/LC/LDC/LDCT))" />
                                	</xsl:otherwise>
                                </xsl:choose>
                                </l0:name>
                                <locgeoamm:hasSiteDefinition>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="concat('https://w3id.org/arco/resource/SiteDefinition/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCT)))" />
                                    </xsl:attribute>
                                </locgeoamm:hasSiteDefinition>
                                <xsl:if test="schede/*/LC/LDC/LDCQ">
                                    <locgeoamm:hasSiteSpecification>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="concat('https://w3id.org/arco/resource/SiteSpecification/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCQ)))" />
                                        </xsl:attribute>
                                    </locgeoamm:hasSiteSpecification>
                                </xsl:if>
                            </rdf:Description>
                        </xsl:if>
                        <!-- Site Definition as an individual -->
                        <xsl:if test="schede/*/LC/LDC/LDCT">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat('https://w3id.org/arco/resource/SiteDefinition/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCT)))" />
                                </xsl:attribute>
                                <rdf:type>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="'https://w3id.org/arco/objective/SiteDefinition'" />
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
                                    <xsl:value-of select="concat('https://w3id.org/arco/resource/SiteSpecification/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCQ)))" />
                                </xsl:attribute>
                                <rdf:type>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="'https://w3id.org/arco/objective/SiteSpecification'" />
                                    </xsl:attribute>
                                </rdf:type>
                                <rdfs:label>
                                    <xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCQ)" />
                                </rdfs:label>
                            </rdf:Description>
                        </xsl:if>
                        <!-- Monumental Area as individual -->
                        <xsl:if test="schede/*/LC/LDC/LDCC">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'MonumentalArea/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCC)))" />
                                </xsl:attribute>
                                <rdf:type>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="'http://dati.beniculturali.it/cis/MonumentalArea'" />
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
                                <xsl:value-of select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-current')" />
                            </xsl:attribute>
                            <locgeoamm:atSite>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="$site" />
                                </xsl:attribute>
                            </locgeoamm:atSite>
                        </rdf:Description>
                        <!-- rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of 
							select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), 
							'/', $itemURI)" /> </xsl:attribute> <locgeoamm:isInSite> <xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="$site" /> </xsl:attribute> </locgeoamm:isInSite> </rdf:Description -->
                        <!-- Cultural Institute or Site -->
                        <xsl:if test="schede/*/LC/LDC/LDCM">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                </xsl:attribute>
                                <rdf:type>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
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
                                        <xsl:value-of select="concat($NS, 'NameInTime/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                    </xsl:attribute>
                                </cis:hasNameInTime>
                                <cis:hasSite>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="$site" />
                                    </xsl:attribute>
                                </cis:hasSite>
                            </rdf:Description>
                            <!-- Name in time -->
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'NameInTime/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                </xsl:attribute>
                                <rdf:type>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="'http://dati.beniculturali.it/cis/NameInTime'" />
                                    </xsl:attribute>
                                </rdf:type>
                                <rdfs:label>
                                    <xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(schede/*/LC/LDC/LDCM))" />
                                </rdfs:label>
                                <l0:name>
                                    <xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(schede/*/LC/LDC/LDCM))" />
                                </l0:name>
                                <cis:institutionalName>
                                    <xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCM)" />
                                </cis:institutionalName>
                            </rdf:Description>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="location" select="concat($NS, 'Feature/', arco-fn:urify(arco-fn:md5(normalize-space(schede/*/LC/PVC))))" />
                        <rdf:Description>
                            <xsl:attribute name="rdf:about">
                                <xsl:value-of select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-current')" />
                            </xsl:attribute>
                            <locgeoamm:atLocation>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="$location" />
                                </xsl:attribute>
                            </locgeoamm:atLocation>
                        </rdf:Description>
                        <rdf:Description>
                            <xsl:attribute name="rdf:about">
                                <xsl:value-of select="$location" />
                            </xsl:attribute>
                            <rdf:type>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
                                </xsl:attribute>
                            </rdf:type>
                            <rdfs:label>
                                <xsl:value-of select="normalize-space(schede/*/LC/PVC)" />
                            </rdfs:label>
                            <xsl:if test="schede/*/LC/PVC/*">
                                <clvapit:hasAddress>
                                    <xsl:attribute name="rdf:resource">
                                    	<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(schede/*/LC/PVC), normalize-space(schede/*/LC/PVL), normalize-space(schede/*/LC/LDC/LDCU)))))" />
                                    </xsl:attribute>
                                </clvapit:hasAddress>
                            </xsl:if>
                        </rdf:Description>
                        <xsl:if test="schede/*/LC/PVC/*">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                	<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(schede/*/LC/PVC), normalize-space(schede/*/LC/PVL), normalize-space(schede/*/LC/LDC/LDCU)))))" />
                				</xsl:attribute>
                                <rdf:type>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="'https://w3id.org/italia/onto/clv/Address'" />
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
									<locgeoamm:addressDetails> <xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCV)"" 
									/> </locgeoamm:addressDetails> -->
                                <!-- Aggiunto da Valentina - Full Address - per issue github #8 <xsl:if 
									test="schede/*/LC/PVC/PVCI"> <clvapit:fullAddress> <xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCI)" 
									/> </clvapit:fullAddress> </xsl:if> <xsl:if test="schede/*/LC/LDC/LDCU"> 
									<clvapit:fullAddress> <xsl:value-of select="normalize-space(schede/*/LC/LDC/LDCU)" 
									/> </clvapit:fullAddress> </xsl:if> -->
                                <!-- Stato -->
                                <xsl:if test="schede/*/LC/PVC/PVCS">
                                    <clvapit:hasCountry>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(schede/*/LC/PVC/PVCS))" />
                                        </xsl:attribute>
                                    </clvapit:hasCountry>
                                </xsl:if>
                                <!-- Regione -->
                                <xsl:if test="schede/*/LC/PVC/PVCR">
                                    <clvapit:hasRegion>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(schede/*/LC/PVC/PVCR))" />
                                        </xsl:attribute>
                                    </clvapit:hasRegion>
                                </xsl:if>
                                <!-- Provincia -->
                                <xsl:if test="schede/*/LC/PVC/PVCP">
                                    <clvapit:hasProvince>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(schede/*/LC/PVC/PVCP))" />
                                        </xsl:attribute>
                                    </clvapit:hasProvince>
                                </xsl:if>
                                <!-- Comune -->
                                <xsl:if test="schede/*/LC/PVC/PVCC">
                                    <clvapit:hasCity>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(schede/*/LC/PVC/PVCC))" />
                                        </xsl:attribute>
                                    </clvapit:hasCity>
                                </xsl:if>
                                <!-- Località -->
                                <xsl:if test="schede/*/LC/PVC/PVCL">
                                    <clvapit:hasAddressArea>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(schede/*/LC/PVC/PVCL))" />
                                        </xsl:attribute>
                                    </clvapit:hasAddressArea>
                                </xsl:if>
                                <xsl:if test="schede/*/LC/PVC/PVCI and not(schede/*/LC/PVC/PVCI='.' or schede/*/LC/PVC/PVCI='-' or schede/*/LC/PVC/PVCI='/')">
                        			<clvapit:fullAddress>
                            			<xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCI)" />
                        			</clvapit:fullAddress>
                    			</xsl:if>
                    			<xsl:if test="schede/*/LC/LDC/LDCU and not(schede/*/LC/LDC/LDCU='.' or schede/*/LC/LDC/LDCU='-' or schede/*/LC/LDC/LDCU='/')">
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
                            <xsl:variable name="site" select="concat($NS, 'Site/', arco-fn:urify(arco-fn:md5(concat(normalize-space(./PRC), normalize-space(./PRV)))))" />
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-alternative-', position())" />
                                </xsl:attribute>
                                <locgeoamm:atSite>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="$site" />
                                    </xsl:attribute>
                                </locgeoamm:atSite>
                            </rdf:Description>
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="$site" />
                                </xsl:attribute>
                                <rdf:type>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="'http://dati.beniculturali.it/cis/Site'" />
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
                                <!-- Denominazione contenitore fisico in normative precedenti a 4.00 -->
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
                                        	<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(./PRV), normalize-space(./PRL), normalize-space(./PRC/PRCU)))))" />
                                        </xsl:attribute>
                                    </cis:siteAddress>
                                </xsl:if>
                                <xsl:if test="./PRC/PRCK">
                                    <locgeoamm:siteIdentifier>
                                        <xsl:value-of select="normalize-space(./PRC/PRCK)" />
                                    </locgeoamm:siteIdentifier>
                                </xsl:if>
                                <xsl:if test="./PRC/PRCM">
                                    <cis:isSiteOf>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:urify(normalize-space(./PRC/PRCM)))" />
                                        </xsl:attribute>
                                    </cis:isSiteOf>
                                </xsl:if>
                                <xsl:if test="./PRC/PRCC">
                                    <cis:isPartOf>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="concat($NS, 'MonumentalArea/', arco-fn:urify(normalize-space(./PRC/PRCC)))" />
                                        </xsl:attribute>
                                    </cis:isPartOf>
                                </xsl:if>
                                <xsl:if test="./PRT/PRTK">
                                    <locgeoamm:hasContinent>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="concat($NS, 'Continent/', arco-fn:urify(normalize-space(./PRT/PRTK)))" />
                                        </xsl:attribute>
                                    </locgeoamm:hasContinent>
                                </xsl:if>
                                <!-- Site Type -->
                                <xsl:if test="./PRC/PRCT and not(normalize-space(./PRC/PRCT)='.')">
                                    <locgeoamm:hasSiteType>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:choose>
                                                <xsl:when test="./PRC/PRCQ">
                                                    <xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(./PRC/PRCT)), '-', arco-fn:urify(normalize-space(./PRC/PRCQ)))" />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(./PRC/PRCT)))" />
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
                                    </locgeoamm:hasSiteType>
                                </xsl:if>
                            </rdf:Description>
                            <!-- PRCM cultural institute or site as an individual -->
                            <xsl:if test="./PRC/PRCM">
                            	<rdf:Description>
                            		<xsl:attribute name="rdf:about">
                                        <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:urify(normalize-space(./PRC/PRCM)))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
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
                                            <xsl:value-of select="concat($NS, 'NameInTime/', arco-fn:urify(normalize-space(./PRC/PRCM)))" />
                                        </xsl:attribute>
                                    </cis:hasNameInTime>
                                    <cis:hasSite>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="$site" />
                                        </xsl:attribute>
                                    </cis:hasSite>
                                </rdf:Description>
                                <!-- Name in time of CIS -->
                                <rdf:Description>
                                    <xsl:attribute name="rdf:about">
                                        <xsl:value-of select="concat($NS, 'NameInTime/', arco-fn:urify(normalize-space(./PRC/PRCM)))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'http://dati.beniculturali.it/cis/NameInTime'" />
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
                                                <xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(./PRC/PRCT)), '-', arco-fn:urify(normalize-space(./PRC/PRCQ)))" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="concat($NS, 'SiteType/', arco-fn:urify(normalize-space(./PRC/PRCT)))" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/arco/location/SiteType'" />
                                        </xsl:attribute>
                                    </rdf:type>
                                    <rdfs:label>
                                    	<xsl:choose>
                                            <xsl:when test="./PRC/PRCQ">
                                                <xsl:value-of select="concat('Tipo di contenitore fisico: ', normalize-space(./PRC/PRCT), ' ', normalize-space(./PRC/PRCQ))" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="concat('Tipo di contenitore fisico: ', normalize-space(./PRC/PRCT))" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </rdfs:label>
                                        <l0:name>
                                            <xsl:choose>
                                            <xsl:when test="./PRC/PRCQ">
                                                <xsl:value-of select="concat('Tipo di contenitore fisico: ', normalize-space(./PRC/PRCT), ' ', normalize-space(./PRC/PRCQ))" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="concat('Tipo di contenitore fisico: ', normalize-space(./PRC/PRCT))" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        </l0:name>
                                    <locgeoamm:hasSiteDefinition>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="concat('https://w3id.org/arco/resource/SiteDefinition/', arco-fn:urify(normalize-space(./PRC/PRCT)))" />
                                        </xsl:attribute>
                                    </locgeoamm:hasSiteDefinition>
                                    <xsl:if test="./PRC/PRCQ">
                                        <locgeoamm:hasSiteSpecification>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat('https://w3id.org/arco/resource/SiteSpecification/', arco-fn:urify(normalize-space(./PRC/PRCQ)))" />
                                            </xsl:attribute>
                                        </locgeoamm:hasSiteSpecification>
                                    </xsl:if>
                                </rdf:Description>
                            </xsl:if>
                            <!-- Site Definition as an individual -->
                            <xsl:if test="./PRC/PRCT">
                                <rdf:Description>
                                    <xsl:attribute name="rdf:about">
                                        <xsl:value-of select="concat('https://w3id.org/arco/resource/SiteDefinition/', arco-fn:urify(normalize-space(./PRC/PRCT)))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/arco/objective/SiteDefinition'" />
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
                                        <xsl:value-of select="concat('https://w3id.org/arco/resource/SiteSpecification/', arco-fn:urify(normalize-space(./PRC/PRCQ)))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/arco/objective/SiteSpecification'" />
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
                                        <xsl:value-of select="concat($NS, 'Continent/', arco-fn:urify(normalize-space(./PRT/PRTK)))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/arco/location/Continent'" />
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
                                    	<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(./PRV), normalize-space(./PRL), normalize-space(./PRC/PRCU)))))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/clv/Address'" />
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
                                        <locgeoamm:hasToponymInTime>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:choose>
                                                    <xsl:when test="./PRL/PRLT">
                                                        <xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./PRL/PRLT)))" />
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./PRL)))" />
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:attribute>
                                        </locgeoamm:hasToponymInTime>
                                    </xsl:if>
                                    <xsl:if test="./PRC/PRCU and not(./PRC/PRCU='.' or ./PRC/PRCU='-' or ./PRC/PRCU='/')">
                                        <clvapit:fullAddress>
                                            <xsl:value-of select="normalize-space(./PRC/PRCU)" />
                                        </clvapit:fullAddress>
                                    </xsl:if>
                                    <!-- Stato -->
                                    <xsl:if test="./PRV/PRVS">
                                        <clvapit:hasCountry>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./PRV/PRVS))" />
                                            </xsl:attribute>
                                        </clvapit:hasCountry>
                                    </xsl:if>
                                    <!-- Regione -->
                                    <xsl:if test="./PRV/PRVR">
                                        <clvapit:hasRegion>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVR))" />
                                            </xsl:attribute>
                                        </clvapit:hasRegion>
                                    </xsl:if>
                                    <!-- Provincia -->
                                    <xsl:if test="./PRV/PRVP">
                                        <clvapit:hasProvince>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./PRV/PRVP))" />
                                            </xsl:attribute>
                                        </clvapit:hasProvince>
                                    </xsl:if>
                                    <!-- Comune -->
                                    <xsl:if test="./PRV/PRVC">
                                        <clvapit:hasCity>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./PRV/PRVC))" />
                                            </xsl:attribute>
                                        </clvapit:hasCity>
                                    </xsl:if>
                                    <!-- Località -->
                                    <xsl:if test="./PRV/PRVL">
                                        <clvapit:hasAddressArea>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVL))" />
                                            </xsl:attribute>
                                        </clvapit:hasAddressArea>
                                    </xsl:if>
                                    <xsl:if test="./PRT/PRTL">
                                        <clvapit:hasAddressArea>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./PRT/PRTL))" />
                                            </xsl:attribute>
                                        </clvapit:hasAddressArea>
                                    </xsl:if>
                                    <xsl:if test="./PRV/PRVE">
                                        <clvapit:hasAddressArea>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVE))" />
                                            </xsl:attribute>
                                        </clvapit:hasAddressArea>
                                    </xsl:if>
                                </rdf:Description>
                                <!-- Country -->
                                <xsl:if test="./PRV/PRVS">
                                    <rdf:Description>
                                        <xsl:attribute name="rdf:about">
                                            <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./PRV/PRVS))" />
                                        </xsl:attribute>
                                        <rdf:type>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
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
                                            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVR))" />
                                        </xsl:attribute>
                                        <rdf:type>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
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
                                            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVP))" />
                                        </xsl:attribute>
                                        <rdf:type>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
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
                                            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVC))" />
                                        </xsl:attribute>
                                        <rdf:type>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
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
                                            <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVL))" />
                                        </xsl:attribute>
                                        <rdf:type>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
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
                                            <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./PRT/PRTL))" />
                                        </xsl:attribute>
                                        <rdf:type>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
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
                                            <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVE))" />
                                        </xsl:attribute>
                                        <rdf:type>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
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
                                                <xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./PRL/PRLT)))" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./PRL)))" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/arco/location/ToponymInTime'" />
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
                            <!-- rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of 
								select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-current')" 
								/> </xsl:attribute> <locgeoamm:atSite> <xsl:attribute name="rdf:resource"> 
								<xsl:value-of select="$site" /> </xsl:attribute> </locgeoamm:atSite> </rdf:Description -->
                            <!-- rdf:Description> <xsl:attribute name="rdf:about"> <xsl:value-of 
								select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), 
								'/', $itemURI)" /> </xsl:attribute> <locgeoamm:isInSite> <xsl:attribute name="rdf:resource"> 
								<xsl:value-of select="$site" /> </xsl:attribute> </locgeoamm:isInSite> </rdf:Description -->
                            <!-- Cultural Institute or Site -->
                            <xsl:if test="schede/*/LC/LDC/LDCM">
                                <rdf:Description>
                                    <xsl:attribute name="rdf:about">
                                        <xsl:value-of select="concat($NS, 'CulturalInstituteOrSite/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalInstituteOrSite'" />
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
                                            <xsl:value-of select="concat($NS, 'NameInTime/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                        </xsl:attribute>
                                    </cis:hasNameInTime>
                                    <cis:hasSite>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="$site" />
                                        </xsl:attribute>
                                    </cis:hasSite>
                                </rdf:Description>
                                <!-- Name in time -->
                                <rdf:Description>
                                    <xsl:attribute name="rdf:about">
                                        <xsl:value-of select="concat($NS, 'NameInTime/', arco-fn:urify(normalize-space(schede/*/LC/LDC/LDCM)))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'http://dati.beniculturali.it/cis/NameInTime'" />
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
                        				<xsl:value-of select="concat($NS, 'Feature/', arco-fn:urify(arco-fn:md5(normalize-space(./PRV))))" />
                        			</xsl:if>
                        			<xsl:if test="../../F/LR">
                        				<xsl:value-of select="concat($NS, 'Feature/', arco-fn:urify(arco-fn:md5(normalize-space(../../F/LR/LRC))))" />
                        			</xsl:if>
                        	</xsl:variable>
                       		<rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'TimeIndexedQualifiedLocation/', $itemURI, '-alternative-', position())" />
                                </xsl:attribute>
                                <locgeoamm:atLocation>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="$location" />
                                    </xsl:attribute>
                                </locgeoamm:atLocation>
                            </rdf:Description>
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="$location" />
                                </xsl:attribute>
                                <rdf:type>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
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
                                        	<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(./PRV), normalize-space(./PRC/PRL), normalize-space(./PRC/PRCU)))))" />
                                        </xsl:attribute>
                                    </clvapit:hasAddress>
                                </xsl:if>
                                <xsl:if test="../../F/LR/*">
                                    <clvapit:hasAddress>
                                        <xsl:attribute name="rdf:resource">
                                        	<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(../../F/LR/LRC), normalize-space(../../F/LR/LRL)))))" />
                                        </xsl:attribute>
                                    </clvapit:hasAddress>
                                </xsl:if>
                                <xsl:if test="./PRT/PRTK">
                                    <locgeoamm:hasContinent>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="concat($NS, 'Continent/', arco-fn:urify(arco-fn:md5(normalize-space(./PRT/PRTK))))" />
                                        </xsl:attribute>
                                    </locgeoamm:hasContinent>
                                </xsl:if>
                                <!--  <xsl:if test="./PRL">
                                        <locgeoamm:hasToponymInTime>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:choose>
                                                    <xsl:when test="./PRL/PRLT">
                                                        <xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./PRL/PRLT)))" />
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(./PRL)))" />
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:attribute>
                                        </locgeoamm:hasToponymInTime>
                                    </xsl:if>
                                    <xsl:if test="../../F/LR/LRL">
                                        <locgeoamm:hasToponymInTime>
                                            <xsl:attribute name="rdf:resource">
                                            	<xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(../../F/LR/LRL)))" />
                                            </xsl:attribute>
                                        </locgeoamm:hasToponymInTime>
                                    </xsl:if>
                                    <xsl:if test="../../F/LR/LRC/LRCF">
                                        <locgeoamm:hasToponymInTime>
                                            <xsl:attribute name="rdf:resource">
                                            	<xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(../../F/LR/LRC/LRCF)))" />
                                            </xsl:attribute>
                                        </locgeoamm:hasToponymInTime>
                                    </xsl:if> -->
                            </rdf:Description>
                            <!-- Continent as individual -->
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'Continent/', arco-fn:urify(arco-fn:md5(normalize-space(./PRT/PRTK))))" />
                                </xsl:attribute>
                                <rdf:type>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="'https://w3id.org/arco/location/Continent'" />
                                    </xsl:attribute>
                                </rdf:type>
                                <rdfs:label>
                                    <xsl:value-of select="concat($NS, 'Continent/', arco-fn:urify(arco-fn:md5(normalize-space(./PRT/PRTK))))" />
                                </rdfs:label>
                                <l0:name>
                                    <xsl:value-of select="concat($NS, 'Continent/', arco-fn:urify(arco-fn:md5(normalize-space(./PRT/PRTK))))" />
                                </l0:name>
                            </rdf:Description>
                            <xsl:if test="./PRV/* | ../../F/LR/LRC/*">
                                <rdf:Description>
                                    <xsl:attribute name="rdf:about">
                                    	<xsl:choose>
                                    		<xsl:when test="./PRC/PRCU and not(./PRC/PRCU='.' or ./PRC/PRCU='-' or ./PRC/PRCU='/')">
                                    			<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(./PRV), normalize-space(./PRC/PRCU)))))" />
                                    		</xsl:when>
                                    		<xsl:when test="../../F/LR/LRC/*">
                                    			<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(concat(normalize-space(../../F/LR/LRC), normalize-space(../../F/LR/LRL)))))" />
                                    		</xsl:when>
                                    		<xsl:otherwise>
                                    			<xsl:value-of select="concat($NS, 'Address/', arco-fn:urify(arco-fn:md5(normalize-space(./PRV))))" />
                                    		</xsl:otherwise>
                                    	</xsl:choose>
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/clv/Address'" />
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
										<locgeoamm:addressDetails> <xsl:value-of select="normalize-space(schede/*/LC/PVC/PVCV)"" 
										/> </locgeoamm:addressDetails> -->
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
                                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./PRV/PRVS))" />
                                            </xsl:attribute>
                                        </clvapit:hasCountry>
                                    </xsl:if>
                                    <xsl:if test="../../F/LR/LRC/LRCS">
                                        <clvapit:hasCountry>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(../../F/LR/LRC/LRCS))" />
                                            </xsl:attribute>
                                        </clvapit:hasCountry>
                                    </xsl:if>
                                    <!-- Regione -->
                                    <xsl:if test="./PRV/PRVR">
                                        <clvapit:hasRegion>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVR))" />
                                            </xsl:attribute>
                                        </clvapit:hasRegion>
                                    </xsl:if>
                                    <xsl:if test="../../F/LR/LRC/LRCR">
                                        <clvapit:hasRegion>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(../../F/LR/LRC/LRCR))" />
                                            </xsl:attribute>
                                        </clvapit:hasRegion>
                                    </xsl:if>
                                    <!-- Provincia -->
                                    <xsl:if test="./PRV/PRVP">
                                        <clvapit:hasProvince>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./PRV/PRVP))" />
                                            </xsl:attribute>
                                        </clvapit:hasProvince>
                                    </xsl:if>
                                    <xsl:if test="../../F/LR/LRC/LRCP">
                                        <clvapit:hasProvince>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(../../F/LR/LRC/LRCP))" />
                                            </xsl:attribute>
                                        </clvapit:hasProvince>
                                    </xsl:if>
                                    <!-- Comune -->
                                    <xsl:if test="./PRV/PRVC">
                                        <clvapit:hasCity>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./PRV/PRVC))" />
                                            </xsl:attribute>
                                        </clvapit:hasCity>
                                    </xsl:if>
                                    <xsl:if test="../../F/LR/LRC/LRCC">
                                        <clvapit:hasCity>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(../../F/LR/LRC/LRCC))" />
                                            </xsl:attribute>
                                        </clvapit:hasCity>
                                    </xsl:if>
                                    <!-- Località -->
                                    <xsl:if test="./PRV/PRVL">
                                        <clvapit:hasAddressArea>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVL))" />
                                            </xsl:attribute>
                                        </clvapit:hasAddressArea>
                                    </xsl:if>
                                    <xsl:if test="./PRT/PRTL">
                                        <clvapit:hasAddressArea>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./PRT/PRTL))" />
                                            </xsl:attribute>
                                        </clvapit:hasAddressArea>
                                    </xsl:if>
                                    <xsl:if test="./PRV/PRVE">
                                        <clvapit:hasAddressArea>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVE))" />
                                            </xsl:attribute>
                                        </clvapit:hasAddressArea>
                                    </xsl:if>
                                    <xsl:if test="../../F/LR/LRC/LRCL">
                                        <clvapit:hasAddressArea>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(../../F/LR/LRC/LRCL))" />
                                            </xsl:attribute>
                                        </clvapit:hasAddressArea>
                                    </xsl:if>
                                    <xsl:if test="../../F/LR/LRA">
                                        <clvapit:hasAddressArea>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(../../F/LR/LRA))" />
                                            </xsl:attribute>
                                        </clvapit:hasAddressArea>
                                    </xsl:if>
                                    <xsl:if test="../../F/LR/LRC/LRCE">
                                        <clvapit:hasAddressArea>
                                            <xsl:attribute name="rdf:resource">
                                                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(../../F/LR/LRC/LRCE))" />
                                            </xsl:attribute>
                                        </clvapit:hasAddressArea>
                                    </xsl:if>
                                    <xsl:if test="./PRC/PRCU and not(./PRC/PRCU='.' or ./PRC/PRCU='-' or ./PRC/PRCU='/')">
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
                                        <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./PRV/PRVS))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
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
                                        <xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(../../F/LR/LRC/LRCS))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
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
                                        <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVR))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
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
                                        <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(../../F/LR/LRC/LRCR))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
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
                                        <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./PRV/PRVP))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
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
                                        <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(../../F/LR/LRC/LRCP))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
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
                                        <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./PRV/PRVC))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
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
                                        <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(../../F/LR/LRC/LRCC))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
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
                                        <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVL))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
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
                                        <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./PRT/PRTL))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
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
                                        <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./PRV/PRVE))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
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
                                        <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(../../F/LR/LRC/LRCL))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
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
                                        <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(../../F/LR/LRC/LRCE))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
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
                                        <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(../../F/LR/LRA))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
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
                                        <xsl:value-of select="concat($NS, 'Exhibition/', $itemURI, '-', position())" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/arco/culturalevent/Exhibition'" />
                                        </xsl:attribute>
                                    </rdf:type>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="rdf:about">
                                        <xsl:value-of select="concat($NS, 'CulturalEvent/', $itemURI, '-', position())" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalEvent'" />
                                        </xsl:attribute>
                                    </rdf:type>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="rdf:about">
                                <xsl:value-of select="concat($NS, 'CulturalEvent/', $itemURI, '-', position())" />
                            </xsl:attribute>
                            <rdf:type>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalEvent'" />
                                </xsl:attribute>
                            </rdf:type>
                        </xsl:otherwise>
                    </xsl:choose>
                    <cis:involves>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                        </xsl:attribute>
                    </cis:involves>
                    <!-- Event name -->
                    <xsl:if test="./MSTT">
                        <l0:name>
                            <xsl:value-of select="normalize-space(./MSTT)" />
                        </l0:name>
                    </xsl:if>
                    <!-- Event organizer -->
                    <xsl:for-each select="./MSTE">
                        <cis:isRelatedToRiT>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
                            </xsl:attribute>
                        </cis:isRelatedToRiT>
                        <culturalevent:hasEventOrganiser>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                            </xsl:attribute>
                        </culturalevent:hasEventOrganiser>
                    </xsl:for-each>
                    <!-- Event location and time -->
                    <xsl:for-each select="./MSTL">
                        <culturalevent:eventTimeLocation>
                            <xsl:value-of select="normalize-space(.)" />
                        </culturalevent:eventTimeLocation>
                    </xsl:for-each>
                    <!-- Event notes -->
                    <xsl:if test="./MSTS">
                        <arco:note>
                            <xsl:value-of select="normalize-space(./MSTS)" />
                        </arco:note>
                    </xsl:if>
                </rdf:Description>
                <!-- Event organizer - Time Indexed Role -->
                <xsl:for-each select="./MSTE">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                            </xsl:attribute>
                        </rdf:type>
                        <roapit:withRole>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Role/Organiser')" />
                            </xsl:attribute>
                        </roapit:withRole>
                        <roapit:isRoleInTimeOf>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                            </xsl:attribute>
                        </roapit:isRoleInTimeOf>
                    </rdf:Description>
                    <!-- Event organizer - Role -->
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'Role/Organiser')" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/RO/Role'" />
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
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
                            <xsl:value-of select="concat($NS, 'CulturalEvent/', $itemURI, '-', position())" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'http://dati.beniculturali.it/cis/CulturalEvent'" />
                            </xsl:attribute>
                        </rdf:type>
                        <cis:involves>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                            </xsl:attribute>
                        </cis:involves>
                        <!-- Event name -->
                        <xsl:if test="./MSTT">
                            <l0:name>
                                <xsl:value-of select="normalize-space(./MSTT)" />
                            </l0:name>
                        </xsl:if>
                        <!-- Event organizer -->
                        <xsl:if test="./MSTO">
                            <xsl:for-each select="./MSTO">
                                <cis:isRelatedToRiT>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
                                    </xsl:attribute>
                                </cis:isRelatedToRiT>
                                <culturalevent:hasEventOrganiser>
                                    <xsl:attribute name="rdf:resource">
                                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                                    </xsl:attribute>
                                </culturalevent:hasEventOrganiser>
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
                            <arco:hasLocation>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="concat($NS, 'GeographicalFeature/', arco-fn:urify(normalize-space(.)))" />
                                </xsl:attribute>
                            </arco:hasLocation>
                        </xsl:for-each>
                        <!-- Event site -->
                        <xsl:for-each select="./MSTS">
                            <cis:isHostedBy>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="concat($NS, 'Site/', arco-fn:urify(arco-fn:md5(normalize-space(.))))" />
                                </xsl:attribute>
                            </cis:isHostedBy>
                        </xsl:for-each>
                    </rdf:Description>
                    <!-- Event site -->
                    <xsl:for-each select="./MSTS">
                        <rdf:Description>
                            <xsl:attribute name="rdf:about">
                                <xsl:value-of select="concat($NS, 'Site/', arco-fn:urify(arco-fn:md5(normalize-space(.))))" />
                            </xsl:attribute>
                            <rdf:type>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="'http://dati.beniculturali.it/cis/Site'" />
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
                                <xsl:value-of select="concat($NS, 'TimeIndexedRole/', $itemURI, '-', arco-fn:urify(normalize-space(.)))" />
                            </xsl:attribute>
                            <rdf:type>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="'https://w3id.org/italia/RO/TimeIndexedRole'" />
                                </xsl:attribute>
                            </rdf:type>
                            <roapit:withRole>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="concat($NS, 'Role/ente-soggetto-organizzatore')" />
                                </xsl:attribute>
                            </roapit:withRole>
                            <roapit:isRoleInTimeOf>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                                </xsl:attribute>
                            </roapit:isRoleInTimeOf>
                        </rdf:Description>
                        <!-- Event organizer - Role -->
                        <rdf:Description>
                            <xsl:attribute name="rdf:about">
                                <xsl:value-of select="concat($NS, 'Role/ente-soggetto-organizzatore')" />
                            </xsl:attribute>
                            <rdf:type>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="'https://w3id.org/italia/RO/Role'" />
                                </xsl:attribute>
                            </rdf:type>
                            <rdfs:label>
                                <xsl:value-of select="'Ente/Soggetto organizzatore'" />
                            </rdfs:label>
                            <l0:name>
                                <xsl:value-of select="'Ente/Soggetto organizzatore'" />
                            </l0:name>
                        </rdf:Description>
                        <!-- Event organizer - Agent -->
                        <rdf:Description>
                            <xsl:attribute name="rdf:about">
                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(.)))" />
                            </xsl:attribute>
                            <rdf:type>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
                                <xsl:value-of select="concat($NS, 'GeographicalFeature/', arco-fn:urify(normalize-space(.)))" />
                            </xsl:attribute>
                            <rdf:type>
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="'http://dati.beniculturali.it/cis/GeographicalFeature'" />
                                </xsl:attribute>
                            </rdf:type>
                            <rdfs:label>
                                <xsl:value-of select="normalize-space(.)" />
                            </rdfs:label>
                        </rdf:Description>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>
</xsl:stylesheet>