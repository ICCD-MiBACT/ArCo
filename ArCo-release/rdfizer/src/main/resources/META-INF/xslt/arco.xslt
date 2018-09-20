<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:arco="https://w3id.org/arco/core/" xmlns:arco-fn="http://w3id.org/arco/saxon-extension" xmlns:cataloguerecord="https://w3id.org/arco/catalogue/" xmlns:cis="http://dati.beniculturali.it/cis/" xmlns:clvapit="https://w3id.org/italia/onto/CLV/" xmlns:smapit="https://w3id.org/italia/onto/SM/" xmlns:cpdescription="https://w3id.org/arco/objective/" xmlns:culturaldefinition="https://w3id.org/arco/subjective/" xmlns:culturalevent="https://w3id.org/arco/culturalevent/" xmlns:dcterms="http://purl.org/dc/terms/creator" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:frbr="http://purl.org/vocab/frbr/core#" xmlns:identifier="https://w3id.org/arco/identifier/" xmlns:l0="https://w3id.org/italia/onto/l0/" xmlns:locgeoamm="https://w3id.org/arco/location/" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:php="http://php.net/xsl" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:roapit="https://w3id.org/italia/onto/RO/" xmlns:tiapit="https://w3id.org/italia/onto/TI/" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="1.0" exclude-result-prefixes="xsl php">
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
                <rdfs:label xml:lang="en">
                    <xsl:value-of select="concat('Catalogue Record n: ', $itemURI)" />
                </rdfs:label>
                <rdfs:label xml:lang="it">
                    <xsl:value-of select="concat('Scheda catalografica n: ', $itemURI)" />
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
                    <xsl:if test="schede/*/CM/FUR and not(lower-case(normalize-space(schede/*/CM/FUR))='nr' or lower-case(normalize-space(schede/*/CM/FUR))='n.r.' or lower-case(normalize-space(schede/*/CM/FUR))='nr (recupero pregresso)')">
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
                    <xsl:if test="schede/*/CM/FUR and not(lower-case(normalize-space(schede/*/CM/FUR))='nr' or lower-case(normalize-space(schede/*/CM/FUR))='n.r.' or lower-case(normalize-space(schede/*/CM/FUR))='nr (recupero pregresso)')">
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
                    <xsl:if test="./AGGF and not(lower-case(normalize-space(./AGGF))='nr' or lower-case(normalize-space(./AGGF))='n.r.' or lower-case(normalize-space(./AGGF))='nr (recupero pregresso)')">
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
            <xsl:if test="schede/*/CM/FUR and not(lower-case(normalize-space(schede/*/CM/FUR))='nr' or lower-case(normalize-space(schede/*/CM/FUR))='n.r.' or lower-case(normalize-space(schede/*/CM/FUR))='nr (recupero pregresso)')">
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
            <xsl:if test="schede/*/CM/AGG/AGGF and not(lower-case(normalize-space(schede/*/CM/AGG/AGGF))='nr' or lower-case(normalize-space(schede/*/CM/AGG/AGGF))='n.r.' or lower-case(normalize-space(schede/*/CM/AGG/AGGF))='nr (recupero pregresso)')">
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
                <!-- has number of components -->
                <xsl:if test="schede/*/OG/QNT/QNTN or schede/*/OG/QNT/QNTI or schede/*/OG/QNT/QNTS">
                	<arco:hasNumberOfComponents>
                		<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'NumberOfComponents/', $itemURI, '-quantity')" />
                        </xsl:attribute>
                	</arco:hasNumberOfComponents>                
                </xsl:if>
                <!-- cultural property description -->
                <xsl:if test="schede/*/DA/DES">
                	<xsl:choose>
                		<xsl:when test="schede/*/DA/DES/*">
                			<xsl:if test="not(lower-case(normalize-space(schede/*/DA/DES/DESO))='nr' or lower-case(normalize-space(schede/*/DA/DES/DESO))='n.r.' or lower-case(normalize-space(schede/*/DA/DES/DESO))='nr (recupero pregresso)')">
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
                				<xsl:value-of select="concat($NS, 'Fruition/', $itemURI, '-', position())" />
                			</xsl:attribute>
                		</culturaldefinition:hasFruition>
                	</xsl:for-each>
                </xsl:if>
                <!-- alternative identifier (AC/ACC) -->
                <xsl:if test="schede/*/AC/ACC">
                	<xsl:for-each select="schede/*/AC/ACC">
                		<cataloguerecord:hasAlternativeIdentifier>
                			<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'AlternativeIdentifier/', $itemURI, '-', position())" />
                			</xsl:attribute>
                		</cataloguerecord:hasAlternativeIdentifier>
                	</xsl:for-each>
                </xsl:if>
                <!-- authorship attribution -->
                <xsl:for-each select="schede/*/AU/ATB">
                    <culturaldefinition:hasAuthorshipAttribution>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'CulturalScopeAttribution/', $itemURI, '-cultural-scope-attribution-', position())" />
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
                <xsl:for-each select="schede/*/AU/AUT | schede/F/AU/AUF">
                    <culturaldefinition:hasAuthorshipAttribution>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'PreferredAuthorshipAttribution/', $itemURI, '-', position())" />
                        </xsl:attribute>
                    </culturaldefinition:hasAuthorshipAttribution>
                    <arco:hasAuthor>
                    	<xsl:attribute name="rdf:resource">
                    		<xsl:variable name="author">
		                            <xsl:choose>
		                                <xsl:when test="./AUTA">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTN)), '-', arco-fn:urify(normalize-space(./AUTA)))" />
		                                </xsl:when>
		                                <xsl:when test="../AUF/AUFA and ../AUF/AUFN">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFN)), '-', arco-fn:urify(normalize-space(../AUF/AUFA)))" />
		                                </xsl:when>
		                                <xsl:when test="../AUF/AUFA and ../AUF/AUFB">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFB)), '-', arco-fn:urify(normalize-space(../AUF/AUFA)))" />
		                                </xsl:when>
		                                <xsl:when test="../AUF/AUFB">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFB)))" />
		                                </xsl:when>
		                                <xsl:when test="../AUF/AUFN">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFN)))" />
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
	                                <xsl:when test="../AUF/AUFS">
	                                    <xsl:value-of select="concat($author, '-', arco-fn:urify(normalize-space(../AUF/AUFS)))" />
	                                </xsl:when>
	                                <xsl:otherwise>
	                                    <xsl:value-of select="$author" />
	                                </xsl:otherwise>
	                            </xsl:choose>
                    	</xsl:attribute>
                    </arco:hasAuthor>
                </xsl:for-each>
                <!-- inventory -->
	            <xsl:for-each select="schede/*/UB/INV">
	                <xsl:if test="./*">
	                	<culturaldefinition:hasInventory>
	                		<xsl:attribute name="rdf:resource">
	                			<xsl:value-of select="concat($NS, 'Inventory/', $itemURI, '-', position())" />
	                		</xsl:attribute>
	                	</culturaldefinition:hasInventory>
	                	</xsl:if>
	            </xsl:for-each>
                <!-- commission -->
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
                <!-- member of collection -->
                <xsl:for-each select="schede/*/UB/COL">
	                <xsl:if test="./*">
	                    <culturaldefinition:isMemberOfCollection>
	                        <xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, '-collection-membership-', position())" />
	                        </xsl:attribute>
	                    </culturaldefinition:isMemberOfCollection>
	                </xsl:if>
                </xsl:for-each>
                <xsl:for-each select="schede/*/CO/STC">
	                <xsl:if test="./*">
	                    <cpdescription:hasConservationStatus>
	                        <xsl:attribute name="rdf:resource">
	                            <xsl:value-of select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
	                        </xsl:attribute>
	                    </cpdescription:hasConservationStatus>
	                </xsl:if>
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
                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
                        </xsl:attribute>
                    </arco:hasAgentRole>
                    <arco:hasHeritageProtectionAgency>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(schede/*/CD/ECP)))" />
                        </xsl:attribute>
                    </arco:hasHeritageProtectionAgency>
                </xsl:if>
                <!-- cataloguing agency -->
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
                <!-- Type of context for LC -->
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
                                    <xsl:value-of select="concat($NS, 'TypeOfContext/', arco-fn:urify(normalize-space(.)))" />
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
                                    <xsl:value-of select="concat($NS, 'TypeOfContext/', arco-fn:urify(normalize-space(.)))" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </locgeoamm:hasTypeOfContext>
                </xsl:for-each>
                <!-- Acquisition of cultural property -->
                <xsl:for-each select="schede/*/TU/ACQ">
                	<culturaldefinition:hasAcquisition>
                		<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-acquisition-', position())" />
                		</xsl:attribute>
                	</culturaldefinition:hasAcquisition>
                </xsl:for-each>
                <!-- Change of availability of cultural property -->
                <xsl:for-each select="schede/*/TU/ALN">
                	<culturaldefinition:hasChangeOfAvailability>
                		<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-change-of-availability')" />
                		</xsl:attribute>
                	</culturaldefinition:hasChangeOfAvailability>
                </xsl:for-each>
                <!-- Photographic Documentation of cultural property -->
                 <xsl:for-each select="schede/*/DO/FTA">
                	<culturaldefinition:hasDocumentation>
                		<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-photographic-documentation-', position())" />
                		</xsl:attribute>
                	</culturaldefinition:hasDocumentation>
                </xsl:for-each>
                <!-- Graphic or cartographic Documentation of cultural property -->
                 <xsl:for-each select="schede/*/DO/DRA">
                	<culturaldefinition:hasDocumentation>
                		<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'GraphicOrCartographicDocumentation/', $itemURI, '-graphic-cartographic-documentation-', position())" />
                		</xsl:attribute>
                	</culturaldefinition:hasDocumentation>
                </xsl:for-each>
                <!-- Film Documentation of cultural property -->
                 <xsl:for-each select="schede/*/DO/VDC">
                	<culturaldefinition:hasDocumentation>
                		<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'FilmDocumentation/', $itemURI, '-film-documentation-', position())" />
                		</xsl:attribute>
                	</culturaldefinition:hasDocumentation>
                </xsl:for-each>
                <!-- Audio Documentation of cultural property -->
                 <xsl:for-each select="schede/*/DO/REG">
                	<culturaldefinition:hasDocumentation>
                		<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'AudioDocumentation/', $itemURI, '-audio-documentation-', position())" />
                		</xsl:attribute>
                	</culturaldefinition:hasDocumentation>
                </xsl:for-each>
                <!-- Sources and Documents of cultural property -->
                 <xsl:for-each select="schede/*/DO/FNT">
                	<culturaldefinition:hasDocumentation>
                		<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'SourceAndDocument/', $itemURI, '-source-document-', position())" />
                		</xsl:attribute>
                	</culturaldefinition:hasDocumentation>
                </xsl:for-each>
                <!-- Bibliography of cultural property -->
                 <xsl:for-each select="schede/*/DO/BIB">
                	<culturaldefinition:hasBibliography>
                		<xsl:attribute name="rdf:resource">
                			<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-bibliography-', position())" />
                		</xsl:attribute>
                	</culturaldefinition:hasBibliography>
                </xsl:for-each>
                <!-- Geometry of cultural property -->
                	<xsl:for-each select="schede/*/GP">
                		<clvapit:hasGeometry>
                			<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-point-', position())" />
                			</xsl:attribute>
                		</clvapit:hasGeometry>
                	</xsl:for-each>
                	<xsl:for-each select="schede/*/GA">
                		<clvapit:hasGeometry>
                			<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-polygon-', position())" />
                			</xsl:attribute>
                		</clvapit:hasGeometry>
                	</xsl:for-each>
                	<xsl:for-each select="schede/*/GL">
                		<clvapit:hasGeometry>
                			<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-line-', position())" />
                			</xsl:attribute>
                		</clvapit:hasGeometry>
                	</xsl:for-each>
                	<xsl:for-each select="schede/*/GE">
                		<clvapit:hasGeometry>
                			<xsl:attribute name="rdf:resource">
                				<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-', position())" />
                			</xsl:attribute>
                		</clvapit:hasGeometry>
                	</xsl:for-each>
                <!-- rdf:type of cultural property -->
                <rdf:type>
                    <xsl:attribute name="rdf:resource">
                        <xsl:value-of select="arco-fn:getSpecificPropertyType($sheetType)" />
                    </xsl:attribute>
                </rdf:type>
                <!-- rdfs:label of cultural property -->
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
                	<xsl:if test="not(lower-case(normalize-space(.))='nr' or lower-case(normalize-space(.))='n.r.' or lower-case(normalize-space(.))='nr (recupero pregresso)')">
	                    <culturaldefinition:subject>
	                        <xsl:value-of select="normalize-space(.)" />
	                    </culturaldefinition:subject>
	                    <culturaldefinition:hasSubject>
	                    	<xsl:attribute name="rdf:resource">
	                    		<xsl:value-of select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(.)))" />
	                    	</xsl:attribute>
	                    </culturaldefinition:hasSubject>
                    </xsl:if>
                </xsl:for-each>
                <xsl:for-each select="schede/*/DA/AID/AIDI">
                	<xsl:if test="not(lower-case(normalize-space(.))='nr' or lower-case(normalize-space(.))='n.r.' or lower-case(normalize-space(.))='nr (recupero pregresso)')">
	                    <culturaldefinition:subject>
	                        <xsl:value-of select="normalize-space(.)" />
	                    </culturaldefinition:subject>
	                    <culturaldefinition:hasSubject>
	                    	<xsl:attribute name="rdf:resource">
	                    		<xsl:value-of select="concat($NS, 'Subject/', arco-fn:urify(normalize-space(.)))" />
	                    	</xsl:attribute>
	                    </culturaldefinition:hasSubject>
                    </xsl:if>
                </xsl:for-each>
                <xsl:if test="schede/*/DA/DES/DESI and not(lower-case(normalize-space(schede/*/DA/DES/DESI))='nr' or lower-case(normalize-space(schede/*/DA/DES/DESI))='n.r.' or lower-case(normalize-space(schede/*/DA/DES/DESI))='nr (recupero pregresso)')">
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
                        	<xsl:value-of select="concat('https://w3id.org/arco/resource/DesignationInTime/', arco-fn:urify(normalize-space(./OGDN)))" />                      	                            
                        </xsl:attribute>
                    </cpdescription:hasDesignationInTime>
                </xsl:for-each>
                <!-- name in time (OG/OGT/OGTN) -->
                <xsl:for-each select="schede/*/OG/OGT/OGTN">
                    <cpdescription:hasDesignationInTime>
                        <xsl:attribute name="rdf:resource">
                        			<xsl:value-of select="concat('https://w3id.org/arco/resource/DesignationInTime/', arco-fn:urify(normalize-space(.)))" />   	                            
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
            	<xsl:if test="not(lower-case(normalize-space(.))='nr' or lower-case(normalize-space(.))='n.r.' or lower-case(normalize-space(.))='nr (recupero pregresso)')">
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
            	</xsl:if>
            </xsl:for-each>
            <!-- Subject as an individual (aidi) -->
            <xsl:for-each select="schede/*/DA/AID/AIDI">
            	<xsl:if test="not(lower-case(normalize-space(.))='nr' or lower-case(normalize-space(.))='n.r.' or lower-case(normalize-space(.))='nr (recupero pregresso)')">
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
            	</xsl:if>
            </xsl:for-each>
            <!-- Number of components as an individual -->
            <xsl:if test="schede/*/OG/QNT/QNTN or schede/*/OG/QNT/QNTI or schede/*/OG/QNT/QNTS">
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'NumberOfComponents/', $itemURI, '-quantity')" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
                          <xsl:value-of select="'https://w3id.org/arco/core/NumberOfComponents'" />
                        </xsl:attribute>
            		</rdf:type>
            		<rdfs:label xml:lang="it">
            			<xsl:if test="schede/*/OG/QNT/QNTN">
                        	<xsl:value-of select="concat('Quantità degli esemplari del bene ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTN))" />
                    	</xsl:if>
                    	<xsl:if test="schede/*/OG/QNT/QNTI">
                        	<xsl:value-of select="concat('Quantità degli elementi del bene ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTI))" />
                    	</xsl:if>
                    	<xsl:if test="schede/*/OG/QNT/QNTS">
                        	<xsl:value-of select="concat('Quantità non rilevata: ', normalize-space(schede/*/OG/QNT/QNTS))" />
                    	</xsl:if>
                    </rdfs:label>
                    <l0:name xml:lang="it">
                        <xsl:if test="schede/*/OG/QNT/QNTN">
                        	<xsl:value-of select="concat('Quantità degli esemplari del bene ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTN))" />
                    	</xsl:if>
                    	<xsl:if test="schede/*/OG/QNT/QNTI">
                        	<xsl:value-of select="concat('Quantità degli elementi del bene ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTI))" />
                    	</xsl:if>
                    	<xsl:if test="schede/*/OG/QNT/QNTS">
                        	<xsl:value-of select="concat('Quantità non rilevata: ', normalize-space(schede/*/OG/QNT/QNTS))" />
                    	</xsl:if>
                    </l0:name>
                    <rdfs:label xml:lang="en">
            			<xsl:if test="schede/*/OG/QNT/QNTN">
                        	<xsl:value-of select="concat('Number of components of cultural property ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTN))" />
                    	</xsl:if>
                    	<xsl:if test="schede/*/OG/QNT/QNTI">
                        	<xsl:value-of select="concat('Number of components of cultural property ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTI))" />
                    	</xsl:if>
                    	<xsl:if test="schede/*/OG/QNT/QNTS">
                        	<xsl:value-of select="concat('Undetected quantity: ', normalize-space(schede/*/OG/QNT/QNTS))" />
                    	</xsl:if>
                    </rdfs:label>
                    <l0:name xml:lang="en">
                        <xsl:if test="schede/*/OG/QNT/QNTN">
                        	<xsl:value-of select="concat('Number of components of cultural property ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTN))" />
                    	</xsl:if>
                    	<xsl:if test="schede/*/OG/QNT/QNTI">
                        	<xsl:value-of select="concat('Number of components of cultural property ', $itemURI, ': ', normalize-space(schede/*/OG/QNT/QNTI))" />
                    	</xsl:if>
                    	<xsl:if test="schede/*/OG/QNT/QNTS">
                        	<xsl:value-of select="concat('Undetected quantity: ', normalize-space(schede/*/OG/QNT/QNTS))" />
                    	</xsl:if>
                    </l0:name>
                    <arco:isNumberOfComponentsOf>
                    	<xsl:attribute name="rdf:resource">
                    		<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                    	</xsl:attribute>
                    </arco:isNumberOfComponentsOf>
                    <arco:numberOfComponents>
                    	 <xsl:if test="schede/*/OG/QNT/QNTN">
                        	<xsl:value-of select="normalize-space(schede/*/OG/QNT/QNTN)" />
                    	</xsl:if>
                    	<xsl:if test="schede/*/OG/QNT/QNTI">
                        	<xsl:value-of select="normalize-space(schede/*/OG/QNT/QNTI)" />
                    	</xsl:if>
                    	<xsl:if test="schede/*/OG/QNT/QNTS">
                        	<xsl:value-of select="normalize-space(schede/*/OG/QNT/QNTS)" />
                    	</xsl:if>                    
                    </arco:numberOfComponents>
                    <xsl:if test="schede/*/OG/QNT/QNTE">
                    	<arco:note>
                    		<xsl:value-of select="normalize-space(schede/*/OG/QNT/QNTE)" />
                    	</arco:note>
                    </xsl:if>
            	</rdf:Description>
            </xsl:if>
            <!-- ERROR, this element has already been created in another section of the sheet
             <xsl:for-each select="schede/*/OG/OGD">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat('https://w3id.org/arco/resource/DesignationInTime/', arco-fn:urify(normalize-space(./OGDN)))" />
                    </xsl:attribute>
                    <rdfs:label>
                        <xsl:value-of select="normalize-space(./OGDN)" />
                    </rdfs:label>
                    <l0:name>
                        <xsl:value-of select="normalize-space(./ODGN)" />
                    </l0:name>
                </rdf:Description>
            </xsl:for-each>  -->
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
                        <rdfs:label xml:lang="it">
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
                        <l0:name xml:lang="it">
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
                        <rdfs:label xml:lang="en">
                            <xsl:choose>
                                <xsl:when test="./EDTE and ./EDTL">
                                    <xsl:value-of select="concat('Edition ', normalize-space(./EDTE), '-', normalize-space(./EDTL), ' of cultural property ', $itemURI)" />
                                </xsl:when>
                                <xsl:when test="./EDTE">
                                    <xsl:value-of select="concat('Edition ', normalize-space(./EDTE), ' of cultural property ', $itemURI)" />
                                </xsl:when>
                                <xsl:when test="./EDTL">
                                    <xsl:value-of select="concat('Edition ', normalize-space(./EDTL), ' of cultural property ', $itemURI)" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat('Edition ', position(), ' of cultural property ', $itemURI)" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </rdfs:label>
                        <l0:name xml:lang="en">
                            <xsl:choose>
                                <xsl:when test="./EDTE and ./EDTL">
                                    <xsl:value-of select="concat('Edition ', normalize-space(./EDTE), '-', normalize-space(./EDTL), ' of cultural property ', $itemURI)" />
                                </xsl:when>
                                <xsl:when test="./EDTE">
                                    <xsl:value-of select="concat('Edition ', normalize-space(./EDTE), ' of cultural property ', $itemURI)" />
                                </xsl:when>
                                <xsl:when test="./EDTL">
                                    <xsl:value-of select="concat('Edition ', normalize-space(./EDTL), ' of cultural property ', $itemURI)" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat('Edition ', position(), ' of cultural property ', $itemURI)" />
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
                        <rdfs:label xml:lang="it">
                            <xsl:choose>
                                <xsl:when test="./EDTR">
                                    <xsl:value-of select="concat(normalize-space(./EDTR), ' del bene ', $itemURI)" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat('Ruolo nel tempo del bene ', $itemURI)" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </rdfs:label>
                        <rdfs:label xml:lang="en">
                            <xsl:choose>
                                <xsl:when test="./EDTR">
                                    <xsl:value-of select="concat(normalize-space(./EDTR), ' of cultural property ', $itemURI)" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat('Time indexed role of cultural property ', $itemURI)" />
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
                    <rdfs:label xml:lang="it">
                        <xsl:value-of select="concat('Cronologia ', position(), ' del bene ', $itemURI)" />
                    </rdfs:label>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="concat('Dating ', position(), ' of cultural property ', $itemURI)" />
                    </rdfs:label>
                    <l0:name xml:lang="it">
                        <xsl:value-of select="concat('Cronologia ', position(), ' del bene ', $itemURI)" />
                    </l0:name>
                    <rdfs:label xml:lang="en">
                        <xsl:value-of select="concat('Dating ', position(), ' of cultural property ', $itemURI)" />
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
                                <xsl:when test="./DTM/DTMS">
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
                                <xsl:value-of select="concat('Cultural property type: ', ./OGTD, ' ', ./OGTT)" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat('Cultural property type: ', ./OGTD)" />
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
                    <xsl:if test="./OGTT and not(lower-case(normalize-space(./OGTT))='nr' or lower-case(normalize-space(./OGTT))='n.r.' or lower-case(normalize-space(./OGTT))='nr (recupero pregresso)')">
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
            <xsl:if test="schede/*/OG/OGT/OGTT and not(lower-case(normalize-space(schede/*/OG/OGT/OGTT))='nr' or lower-case(normalize-space(schede/*/OG/OGT/OGTT))='n.r.' or lower-case(normalize-space(schede/*/OG/OGT/OGTT))='nr (recupero pregresso)')">
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
                        <xsl:value-of select="arco-fn:cataloguing-entity(normalize-space(.))" />
                    </rdfs:label>
                    <l0:name>
                        <xsl:value-of select="arco-fn:cataloguing-entity(normalize-space(.))" />
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
                        <xsl:value-of select="arco-fn:cataloguing-entity(normalize-space(schede/*/CD/ECP))" />
                    </rdfs:label>
                    <l0:name>
                        <xsl:value-of select="arco-fn:cataloguing-entity(normalize-space(schede/*/CD/ECP))" />
                    </l0:name>
                    <arco:isAgentOf>
                    	<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-heritage-protection-agency')" />
                        </xsl:attribute>
                    </arco:isAgentOf>
                </rdf:Description>
            </xsl:if>
            <!-- Acquisition of cultural property as an individual -->
            <xsl:for-each select="schede/*/TU/ACQ">
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Acquisition/', $itemURI, '-acquisition-', position())" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/subjective/Acquisition'" />
            			</xsl:attribute>
            		</rdf:type>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Acquisizione ', position(), ' del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="it">
            			<xsl:value-of select="concat('Acquisizione ', position(), ' del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Acquisition ', position(), ' of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Acquisition ', position(), ' of cultural property: ', $itemURI)" />
            		</l0:name>
            		<xsl:if test="./ACQT">
            			<culturaldefinition:hasAcquisitionType>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(./ACQT)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasAcquisitionType>            		
            		</xsl:if>
            		<xsl:if test="./ACQN">
            			<culturaldefinition:hasPreviousOwner>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ACQN)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasPreviousOwner>
            		</xsl:if>
            		<xsl:if test="./ACQD">
            			<tiapit:date>
            				<xsl:value-of select="./ACQD" />
            			</tiapit:date>
            		</xsl:if>
            		<xsl:if test="./ACQE">
            			<arco:note>
            				<xsl:value-of select="./ACQE" />
            			</arco:note>
            		</xsl:if>
            		<xsl:if test="./ACQL">
            			<culturaldefinition:acquisitionLocation>
            				<xsl:value-of select="./ACQL" />
            			</culturaldefinition:acquisitionLocation>
            		</xsl:if>
            	</rdf:Description>
            	<!-- acquisition type as an individual -->
            	<xsl:if test="./ACQT">
            		<rdf:Description>
            			<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'AcquisitionType/', arco-fn:urify(normalize-space(./ACQT)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/AcquisitionType'" />
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
            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ACQN)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
            			<xsl:value-of select="concat($NS, 'ChangeOfAvailability/', $itemURI, '-change-of-availability')" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/subjective/ChangeOfAvailability'" />
            			</xsl:attribute>
            		</rdf:type>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Mutamento condizione materiale del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="it">
            			<xsl:value-of select="concat('Mutamento condizione materiale del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Change of availability of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Change of availability of cultural property: ', $itemURI)" />
            		</l0:name>
            		<xsl:if test="./ALNT">
            			<culturaldefinition:hasChangeOfAvailabilityType>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./ALNT)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasChangeOfAvailabilityType>            		
            		</xsl:if>
            		<xsl:if test="./ALND">
            			<tiapit:date>
            				<xsl:value-of select="./ALND" />
            			</tiapit:date>
            		</xsl:if>
            		<xsl:if test="./ALNN">
            			<arco:note>
            				<xsl:value-of select="./ALNN" />
            			</arco:note>
            		</xsl:if>
            	</rdf:Description>
            	<!-- acquisition type as an individual -->
            	<xsl:if test="./ALNT">
            		<rdf:Description>
            			<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'ChangeOfAvailabilityType/', arco-fn:urify(normalize-space(./ALNT)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/ChangeOfAvailabilityType'" />
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
            			<xsl:value-of select="concat($NS, 'PhotographicDocumentation/', $itemURI, '-photographic-documentation-', position())" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/subjective/PhotographicDocumentation'" />
            			</xsl:attribute>
            		</rdf:type>
            		<rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Photographic documentation ', position(), ' of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Photographic documentation ', position(), ' of cultural property: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Documentazione fotografica ', position(), ' del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Documentazione fotografica ', position(), ' del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<xsl:if test="FTAM">
            			<culturaldefinition:documentationTitle>
            				<xsl:value-of select="./FTAM" />
            			</culturaldefinition:documentationTitle>
            		</xsl:if>
            		<xsl:if test="FTAM">
            			<culturaldefinition:caption>
            				<xsl:value-of select="./FTAM" />
            			</culturaldefinition:caption>
            		</xsl:if>
            		<xsl:if test="./FTAN">
            			<culturaldefinition:documentationIdentifier>
            				<xsl:value-of select="./FTAN" />
            			</culturaldefinition:documentationIdentifier>
            		</xsl:if>
            		<xsl:if test="./FTAD">
            			<tiapit:date>
            				<xsl:value-of select="./FTAD" />
            			</tiapit:date>
            		</xsl:if>
            		<xsl:if test="./FTAC">
            			<culturaldefinition:documentationLocation>
            				<xsl:value-of select="./FTAC" />
            			</culturaldefinition:documentationLocation>
            		</xsl:if>
            		<xsl:if test="./FTAS">
            			<arco:specifications>
            				<xsl:value-of select="./FTAS" />
            			</arco:specifications>
            		</xsl:if>
            		<xsl:if test="./FTAK">
            			<culturaldefinition:digitalFileName>
            				<xsl:value-of select="./FTAK" />
            			</culturaldefinition:digitalFileName>
            		</xsl:if>
            		<xsl:if test="./FTAT">
            			<arco:note>
            				<xsl:value-of select="./FTAT" />
            			</arco:note>
            		</xsl:if>
            		<xsl:if test="./FTAW">
            			<smapit:URL>
            				<xsl:value-of select="./FTAW" />
            			</smapit:URL>
            		</xsl:if>
            		<xsl:if test="./FTAY">
            			<culturaldefinition:rights>
            				<xsl:value-of select="./FTAY" />
            			</culturaldefinition:rights>
            		</xsl:if>
            		<xsl:if test="./FTAR">
            			<culturaldefinition:stripRunAndFrameNumber>
            				<xsl:value-of select="./FTAR" />
            			</culturaldefinition:stripRunAndFrameNumber>
            		</xsl:if>
            		<xsl:if test="./FTAX and not(lower-case(normalize-space(./FTAX))='nr' or lower-case(normalize-space(./FTAX))='n.r.' or lower-case(normalize-space(./FTAX))='nr (recupero pregresso)')">
                        <arco:hasCategory>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="lower-case(normalize-space(./FTAX))='documentazione esistente'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/ExistingDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./FTAX))='documentazione allegata'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/AttachedDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="./FTAX">
                                        <xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FTAX)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </arco:hasCategory>          		            		
            		</xsl:if>
            		<xsl:if test="./FTAP">
            			<culturaldefinition:hasDocumentationType>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FTAP)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasDocumentationType>            		            		
            		</xsl:if>
            		<xsl:if test="./FTAF">
            			<culturaldefinition:hasFormat>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./FTAF)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasFormat>            		            		
            		</xsl:if>
            		<xsl:if test="./FTAA">
            			<culturaldefinition:hasAuthor>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FTAA)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasAuthor>            		            		
            		</xsl:if>
            		<xsl:if test="./FTAE">
            			<arco:hasAgentRole>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-photographic-documentation-', $photodocu-position, '-photographic-documentation-owner')" />
            				</xsl:attribute>
            			</arco:hasAgentRole>
            		</xsl:if>
            	</rdf:Description>
            	<!-- documentation category of photographic documentation as an individual -->
            	<xsl:if test="./FTAX and not(lower-case(normalize-space(./FTAX))='nr' or lower-case(normalize-space(./FTAX))='n.r.' or lower-case(normalize-space(./FTAX))='nr (recupero pregresso)')">
                    <xsl:choose>
                        <xsl:when test="lower-case(normalize-space(./FTAX))='documentazione esistente'" />
                        <xsl:when test="lower-case(normalize-space(./FTAX))='documentazione allegata'" />
                        <xsl:when test="./FTAX">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FTAX)))" />
                                </xsl:attribute>
                                <rdf:type rdf:resource="https://w3id.org/arco/subjective/DocumentationCategory" />
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
            				<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FTAP)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/DocumentationType'" />
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
            				<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./FTAF)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/Format'" />
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
            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FTAA)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
		                        		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-photographic-documentation-', $photodocu-position, '-photographic-documentation-owner')" />
		                    		</xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label xml:lang="it">
				                        <xsl:value-of select="concat('Ente proprietario della documentazione fotografica ', $photodocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./FTAE))" />
				                    </rdfs:label>
				                    <rdfs:label xml:lang="en">
				                        <xsl:value-of select="concat('Owner agency of photographic documentation ', $photodocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./FTAE))" />
				                    </rdfs:label>
				                    <l0:name xml:lang="it">
				                        <xsl:value-of select="concat('Ente proprietario della documentazione fotografica ', $photodocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./FTAE))" />
				                    </l0:name>
				                    <l0:name xml:lang="en">
				                        <xsl:value-of select="concat('Owner agency of photographic documentation ', $photodocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./FTAE))" />
				                    </l0:name>
				                    <arco:hasRole>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                        </xsl:attribute>
				                    </arco:hasRole>
				                    <arco:hasAgent>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FTAE)))" />
				                        </xsl:attribute>
				                    </arco:hasAgent>
				                </rdf:Description>
				                <rdf:Description>
				                    <xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                    </xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label xml:lang="it">
				                        <xsl:value-of select="'Ente proprietario della documentazione'" />
				                    </rdfs:label>
				                    <rdfs:label xml:lang="en">
				                        <xsl:value-of select="'Owner of documentation'" />
				                    </rdfs:label>
				                    <arco:isRoleOf>
				                    	<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-photographic-documentation-', $photodocu-position, '-photographic-documentation-owner')" />
				                        </xsl:attribute>
				                    </arco:isRoleOf>
				                </rdf:Description>
				                <rdf:Description>
				                    <xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FTAE)))" />
				                    </xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label>
				                        <xsl:value-of select="normalize-space(./FTAE)" />
				                    </rdfs:label>
				                    <l0:name>
				                        <xsl:value-of select="normalize-space(./FTAE)" />
				                    </l0:name>
				                    <arco:isAgentOf>
				                    	<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-photographic-documentation-', $photodocu-position, '-photographic-documentation-owner')" />
				                        </xsl:attribute>
				                    </arco:isAgentOf>
				                </rdf:Description>
				             </xsl:if>
            </xsl:for-each>
            <!-- Graphic or cartographic documentation of cultural property as an individual -->
            <xsl:for-each select="schede/*/DO/DRA">
            <xsl:variable name="cartodocu-position">
            		<xsl:value-of select="position()" />
            	</xsl:variable>
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'GraphicOrCartographicDocumentation/', $itemURI, '-graphic-cartographic-documentation-', position())" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/subjective/GraphicOrCartographicDocumentation'" />
            			</xsl:attribute>
            		</rdf:type>
            		<rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Graphic or cartographic documentation ', position(), ' of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Graphic or cartographic documentation ', position(), ' of cultural property: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Documentazione grafica o cartografica ', position(), ' del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Documentazione grafica o cartografica ', position(), ' del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<xsl:if test="./DRAN">
            			<culturaldefinition:documentationIdentifier>
            				<xsl:value-of select="./DRAN" />
            			</culturaldefinition:documentationIdentifier>
            		</xsl:if>
            		<xsl:if test="./DRAD">
            			<tiapit:date>
            				<xsl:value-of select="./DRAD" />
            			</tiapit:date>
            		</xsl:if>
            		<xsl:if test="./DRAC">
            			<culturaldefinition:documentationLocation>
            				<xsl:value-of select="./DRAC" />
            			</culturaldefinition:documentationLocation>
            		</xsl:if>
            		<xsl:if test="./DRAP">
            			<arco:specifications>
            				<xsl:value-of select="./DRAP" />
            			</arco:specifications>
            		</xsl:if>
            		<xsl:if test="./DRAK">
            			<culturaldefinition:digitalFileName>
            				<xsl:value-of select="./DRAK" />
            			</culturaldefinition:digitalFileName>
            		</xsl:if>
            		<xsl:if test="./DRAO">
            			<arco:note>
            				<xsl:value-of select="./DRAO" />
            			</arco:note>
            		</xsl:if>
            		<xsl:if test="./DRAW">
            			<smapit:URL>
            				<xsl:value-of select="./DRAW" />
            			</smapit:URL>
            		</xsl:if>
            		<xsl:if test="./DRAY">
            			<culturaldefinition:rights>
            				<xsl:value-of select="./DRAY" />
            			</culturaldefinition:rights>
            		</xsl:if>
            		<xsl:if test="./DRAM">
            			<culturaldefinition:documentationTitle>
            				<xsl:value-of select="./DRAM" />
            			</culturaldefinition:documentationTitle>
            		</xsl:if>
            		<xsl:if test="./DRAS">
            			<culturaldefinition:hasScale>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Scale/', arco-fn:urify(normalize-space(./DRAS)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasScale> 
            		</xsl:if>
            		<xsl:if test="./DRAX and not(lower-case(normalize-space(./DRAX))='nr' or lower-case(normalize-space(./DRAX))='n.r.' or lower-case(normalize-space(./DRAX))='nr (recupero pregresso)')">
                        <arco:hasCategory>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="lower-case(normalize-space(./DRAX))='documentazione esistente'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/ExistingDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./DRAX))='documentazione allegata'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/AttachedDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="./DRAX">
                                        <xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./DRAX)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </arco:hasCategory>          		            		
            		</xsl:if>
            		<xsl:if test="./DRAT">
            			<culturaldefinition:hasDocumentationType>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./DRAT)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasDocumentationType>            		            		
            		</xsl:if>
            		<xsl:if test="./DRAF">
            			<culturaldefinition:hasFormat>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./DRAF)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasFormat>            		            		
            		</xsl:if>
            		<xsl:if test="./DRAA">
            			<culturaldefinition:hasAuthor>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./DRAA)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasAuthor>            		            		
            		</xsl:if>
            		<xsl:if test="./DRAE">
            			<arco:hasAgentRole>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-carto-graphic-documentation-', $cartodocu-position, '-carto-graphic-documentation-owner')" />
            				</xsl:attribute>
            			</arco:hasAgentRole>
            		</xsl:if>
            	</rdf:Description>
            	<!-- documentation scale of graphic or cartographic documentation as an individual -->
            	<xsl:if test="./DRAS">
            		<rdf:Description>
            			<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'Scale/', arco-fn:urify(normalize-space(./DRAS)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/Scale'" />
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
            	<!-- documentation category of graphic or cartographic documentation as an individual -->
            	<xsl:if test="./DRAX and not(lower-case(normalize-space(./DRAX))='nr' or lower-case(normalize-space(./DRAX))='n.r.' or lower-case(normalize-space(./DRAX))='nr (recupero pregresso)')">
                    <xsl:choose>
                        <xsl:when test="lower-case(normalize-space(./DRAX))='documentazione esistente'" />
                        <xsl:when test="lower-case(normalize-space(./DRAX))='documentazione allegata'" />
                        <xsl:when test="./DRAX">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./DRAX)))" />
                                </xsl:attribute>
                                <rdf:type rdf:resource="https://w3id.org/arco/subjective/DocumentationCategory" />
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
            	<!-- documentation type of graphic and cartographic documentation as an individual -->
            	<xsl:if test="./DRAT">
            		<rdf:Description>
            			<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./DRAT)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/DocumentationType'" />
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
            	<!-- documentation format of graphic or cartographic documentation as an individual -->
            	<xsl:if test="./DRAF">
            		<rdf:Description>
            			<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./DRAF)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/Format'" />
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
            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./DRAA)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
		                        		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-carto-graphic-documentation-', $cartodocu-position, '-carto-graphic-documentation-owner')" />
		                    		</xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label xml:lang="it">
				                        <xsl:value-of select="concat('Ente proprietario della documentazione grafica o cartografica ', $cartodocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./DRAE))" />
				                    </rdfs:label>
				                    <rdfs:label xml:lang="en">
				                        <xsl:value-of select="concat('Owner agency of graphic or cartographic documentation ', $cartodocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./DRAE))" />
				                    </rdfs:label>
				                    <l0:name xml:lang="it">
				                        <xsl:value-of select="concat('Ente proprietario della documentazione grafica o cartografica ', $cartodocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./DRAE))" />
				                    </l0:name>
				                    <l0:name xml:lang="en">
				                        <xsl:value-of select="concat('Owner agency of graphic or cartographic documentation ', $cartodocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./DRAE))" />
				                    </l0:name>
				                    <arco:hasRole>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                        </xsl:attribute>
				                    </arco:hasRole>
				                    <arco:hasAgent>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./DRAE)))" />
				                        </xsl:attribute>
				                    </arco:hasAgent>
				                </rdf:Description>
				                <rdf:Description>
				                    <xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                    </xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label xml:lang="it">
				                        <xsl:value-of select="'Ente proprietario della documentazione'" />
				                    </rdfs:label>
				                    <rdfs:label xml:lang="en">
				                        <xsl:value-of select="'Owner of documentation'" />
				                    </rdfs:label>
				                    <arco:isRoleOf>
				                    	<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-carto-graphic-documentation-', $cartodocu-position, '-carto-graphic-documentation-owner')" />
				                        </xsl:attribute>
				                    </arco:isRoleOf>
				                </rdf:Description>
				                <rdf:Description>
				                    <xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./DRAE)))" />
				                    </xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label>
				                        <xsl:value-of select="normalize-space(./DRAE)" />
				                    </rdfs:label>
				                    <l0:name>
				                        <xsl:value-of select="normalize-space(./DRAE)" />
				                    </l0:name>
				                    <arco:isAgentOf>
				                    	<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-carto-graphic-documentation-', $cartodocu-position, '-carto-graphic-documentation-owner')" />
				                        </xsl:attribute>
				                    </arco:isAgentOf>
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
            			<xsl:value-of select="concat($NS, 'FilmDocumentation/', $itemURI, '-film-documentation-', position())" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/subjective/FilmDocumentation'" />
            			</xsl:attribute>
            		</rdf:type>
            		<rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Film documentation ', position(), ' of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Film documentation ', position(), ' of cultural property: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Documentazione video-cinematografica ', position(), ' del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Documentazione video-cinematografica ', position(), ' del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<xsl:if test="./VDCN">
            			<culturaldefinition:documentationIdentifier>
            				<xsl:value-of select="./VDCN" />
            			</culturaldefinition:documentationIdentifier>
            		</xsl:if>
            		<xsl:if test="./VDCD">
            			<tiapit:date>
            				<xsl:value-of select="./VDCD" />
            			</tiapit:date>
            		</xsl:if>
            		<xsl:if test="./VDCC">
            			<culturaldefinition:documentationLocation>
            				<xsl:value-of select="./VDCC" />
            			</culturaldefinition:documentationLocation>
            		</xsl:if>
            		<xsl:if test="./VDCS">
            			<arco:specifications>
            				<xsl:value-of select="./VDCS" />
            			</arco:specifications>
            		</xsl:if>
            		<xsl:if test="./VDCK">
            			<culturaldefinition:digitalFileName>
            				<xsl:value-of select="./VDCK" />
            			</culturaldefinition:digitalFileName>
            		</xsl:if>
            		<xsl:if test="./VDCT">
            			<arco:note>
            				<xsl:value-of select="./VDCT" />
            			</arco:note>
            		</xsl:if>
            		<xsl:if test="./VDCW">
            			<smapit:URL>
            				<xsl:value-of select="./VDCW" />
            			</smapit:URL>
            		</xsl:if>
            		<xsl:if test="./VDCY">
            			<culturaldefinition:rights>
            				<xsl:value-of select="./VDCY" />
            			</culturaldefinition:rights>
            		</xsl:if>
            		<xsl:if test="./VDCA">
            			<culturaldefinition:documentationTitle>
            				<xsl:value-of select="./VDCA" />
            			</culturaldefinition:documentationTitle>
            		</xsl:if>
            		<xsl:if test="./VDCX and not(lower-case(normalize-space(./VDCX))='nr' or lower-case(normalize-space(./VDCX))='n.r.' or lower-case(normalize-space(./VDCX))='nr (recupero pregresso)')">
                        <arco:hasCategory>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="lower-case(normalize-space(./VDCX))='documentazione esistente'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/ExistingDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./VDCX))='documentazione allegata'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/AttachedDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="./VDCX">
                                        <xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./VDCX)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </arco:hasCategory>          		            		
            		</xsl:if>
            		<xsl:if test="./VDCP">
            			<culturaldefinition:hasDocumentationType>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./VDCP)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasDocumentationType>            		            		
            		</xsl:if>
            		<xsl:if test="./VDCP">
            			<culturaldefinition:hasFormat>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./VDCP)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasFormat>            		            		
            		</xsl:if>
            		<xsl:if test="./VDCR">
            			<culturaldefinition:hasAuthor>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./VDCR)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasAuthor>            		            		
            		</xsl:if>
            		<xsl:if test="./VDCE">
            			<arco:hasAgentRole>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-film-documentation-', $filmdocu-position, '-film-documentation-owner')" />
            				</xsl:attribute>
            			</arco:hasAgentRole>
            		</xsl:if>
            	</rdf:Description>
            	<!-- documentation category of graphic or cartographic documentation as an individual -->
            	<xsl:if test="./VDCX and not(lower-case(normalize-space(./VDCX))='nr' or lower-case(normalize-space(./VDCX))='n.r.' or lower-case(normalize-space(./VDCX))='nr (recupero pregresso)')">
                    <xsl:choose>
                        <xsl:when test="lower-case(normalize-space(./VDCX))='documentazione esistente'" />
                        <xsl:when test="lower-case(normalize-space(./VDCX))='documentazione allegata'" />
                        <xsl:when test="./VDCX">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./VDCX)))" />
                                </xsl:attribute>
                                <rdf:type rdf:resource="https://w3id.org/arco/subjective/DocumentationCategory" />
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
            	<!-- documentation type of film documentation as an individual - for film documentation type and format are the same resource -->
            	<xsl:if test="./VDCP">
            		<rdf:Description>
            			<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./VDCP)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/DocumentationType'" />
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
            	<!-- documentation format of film documentation as an individual - for film documentation type and format are the same resource -->
            	<xsl:if test="./VDCP">
            		<rdf:Description>
            			<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./VDCP)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/Format'" />
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
            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./VDCR)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
		                        		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-film-documentation-', $filmdocu-position, '-film-documentation-owner')" />
		                    		</xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label xml:lang="it">
				                        <xsl:value-of select="concat('Ente proprietario della documentazione video-cinematografica ', $filmdocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./VDCE))" />
				                    </rdfs:label>
				                    <rdfs:label xml:lang="en">
				                        <xsl:value-of select="concat('Owner agency of film documentation ', $filmdocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./VDCE))" />
				                    </rdfs:label>
				                    <l0:name xml:lang="it">
				                        <xsl:value-of select="concat('Ente proprietario della documentazione video-cinematografica ', $filmdocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./VDCE))" />
				                    </l0:name>
				                    <l0:name xml:lang="en">
				                        <xsl:value-of select="concat('Owner agency of film documentation ', $filmdocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./VDCE))" />
				                    </l0:name>
				                    <arco:hasRole>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                        </xsl:attribute>
				                    </arco:hasRole>
				                    <arco:hasAgent>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./VDCE)))" />
				                        </xsl:attribute>
				                    </arco:hasAgent>
				                </rdf:Description>
				                <rdf:Description>
				                    <xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                    </xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label xml:lang="it">
				                        <xsl:value-of select="'Ente proprietario della documentazione'" />
				                    </rdfs:label>
				                    <rdfs:label xml:lang="en">
				                        <xsl:value-of select="'Owner of documentation'" />
				                    </rdfs:label>
				                    <arco:isRoleOf>
				                    	<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-film-documentation-', $filmdocu-position, '-film-documentation-owner')" />
				                        </xsl:attribute>
				                    </arco:isRoleOf>
				                </rdf:Description>
				                <rdf:Description>
				                    <xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./DRAE)))" />
				                    </xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label>
				                        <xsl:value-of select="normalize-space(./DRAE)" />
				                    </rdfs:label>
				                    <l0:name>
				                        <xsl:value-of select="normalize-space(./DRAE)" />
				                    </l0:name>
				                    <arco:isAgentOf>
				                    	<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-film-documentation-', $filmdocu-position, '-film-documentation-owner')" />
				                        </xsl:attribute>
				                    </arco:isAgentOf>
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
            			<xsl:value-of select="concat($NS, 'AudioDocumentation/', $itemURI, '-audio-documentation-', position())" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/subjective/AudioDocumentation'" />
            			</xsl:attribute>
            		</rdf:type>
            		<rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Audio documentation ', position(), ' of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Audio documentation ', position(), ' of cultural property: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Documentazione audio ', position(), ' del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Documentazione audio ', position(), ' del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<xsl:if test="./REGN">
            			<culturaldefinition:documentationIdentifier>
            				<xsl:value-of select="./REGN" />
            			</culturaldefinition:documentationIdentifier>
            		</xsl:if>
            		<xsl:if test="./REGD">
            			<tiapit:date>
            				<xsl:value-of select="./REGD" />
            			</tiapit:date>
            		</xsl:if>
            		<xsl:if test="./REGC">
            			<culturaldefinition:documentationLocation>
            				<xsl:value-of select="./REGC" />
            			</culturaldefinition:documentationLocation>
            		</xsl:if>
            		<xsl:if test="./REGS">
            			<arco:specifications>
            				<xsl:value-of select="./REGS" />
            			</arco:specifications>
            		</xsl:if>
            		<xsl:if test="./REGK">
            			<culturaldefinition:digitalFileName>
            				<xsl:value-of select="./REGK" />
            			</culturaldefinition:digitalFileName>
            		</xsl:if>
            		<xsl:if test="./REGT">
            			<arco:note>
            				<xsl:value-of select="./REGT" />
            			</arco:note>
            		</xsl:if>
            		<xsl:if test="./REGW">
            			<smapit:URL>
            				<xsl:value-of select="./REGW" />
            			</smapit:URL>
            		</xsl:if>
            		<xsl:if test="./REGZ">
            			<culturaldefinition:documentationTitle>
            				<xsl:value-of select="./REGZ" />
            			</culturaldefinition:documentationTitle>
            		</xsl:if>
            		<xsl:if test="./REGX and not(lower-case(normalize-space(./REGX))='nr' or lower-case(normalize-space(./REGX))='n.r.' or lower-case(normalize-space(./REGX))='nr (recupero pregresso)')">
                        <arco:hasCategory>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="lower-case(normalize-space(./REGX))='documentazione esistente'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/ExistingDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./REGX))='documentazione allegata'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/AttachedDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="./REGX">
                                        <xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./REGX)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </arco:hasCategory>          		            		
            		</xsl:if>
            		<xsl:if test="./REGP">
            			<culturaldefinition:hasDocumentationType>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./REGP)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasDocumentationType>            		            		
            		</xsl:if>
            		<xsl:if test="./REGP">
            			<culturaldefinition:hasFormat>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./REGP)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasFormat>            		            		
            		</xsl:if>
            		<xsl:if test="./REGA">
            			<culturaldefinition:hasAuthor>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./REGA)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasAuthor>            		            		
            		</xsl:if>
            		<xsl:if test="./REGE">
            			<arco:hasAgentRole>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-audio-documentation-', $audiodocu-position, '-audio-documentation-owner')" />
            				</xsl:attribute>
            			</arco:hasAgentRole>
            		</xsl:if>
            	</rdf:Description>
            	<!-- documentation category of audio documentation as an individual -->
            	<xsl:if test="./REGX and not(lower-case(normalize-space(./REGX))='nr' or lower-case(normalize-space(./REGX))='n.r.' or lower-case(normalize-space(./REGX))='nr (recupero pregresso)')">
                    <xsl:choose>
                        <xsl:when test="lower-case(normalize-space(./REGX))='documentazione esistente'" />
                        <xsl:when test="lower-case(normalize-space(./REGX))='documentazione allegata'" />
                        <xsl:when test="./REGX">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./REGX)))" />
                                </xsl:attribute>
                                <rdf:type rdf:resource="https://w3id.org/arco/subjective/DocumentationCategory" />
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
            	<!-- documentation type of audio documentation as an individual - for audio documentation type and format are the same resource -->
            	<xsl:if test="./REGP">
            		<rdf:Description>
            			<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./REGP)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/DocumentationType'" />
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
            	<!-- documentation format of audio documentation as an individual - for audio documentation type and format are the same resource -->
            	<xsl:if test="./REGP">
            		<rdf:Description>
            			<xsl:attribute name="rdf:about">
            				<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./REGP)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/Format'" />
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
            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./REGA)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
		                        		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-audio-documentation-', $audiodocu-position, '-audio-documentation-owner')" />
		                    		</xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label xml:lang="it">
				                        <xsl:value-of select="concat('Ente proprietario della documentazione audio ', $audiodocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./REGE))" />
				                    </rdfs:label>
				                    <rdfs:label xml:lang="en">
				                        <xsl:value-of select="concat('Owner agency of audio documentation ', $audiodocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./REGE))" />
				                    </rdfs:label>
				                    <l0:name xml:lang="it">
				                        <xsl:value-of select="concat('Ente proprietario della documentazione audio ', $audiodocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./REGE))" />
				                    </l0:name>
				                    <l0:name xml:lang="en">
				                        <xsl:value-of select="concat('Owner agency of audio documentation ', $audiodocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./REGE))" />
				                    </l0:name>
				                    <arco:hasRole>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                        </xsl:attribute>
				                    </arco:hasRole>
				                    <arco:hasAgent>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./REGE)))" />
				                        </xsl:attribute>
				                    </arco:hasAgent>
				                </rdf:Description>
				                <rdf:Description>
				                    <xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                    </xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label xml:lang="it">
				                        <xsl:value-of select="'Ente proprietario della documentazione'" />
				                    </rdfs:label>
				                    <rdfs:label xml:lang="en">
				                        <xsl:value-of select="'Owner of documentation'" />
				                    </rdfs:label>
				                    <arco:isRoleOf>
				                    	<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-audio-documentation-', $audiodocu-position, '-audio-documentation-owner')" />
				                        </xsl:attribute>
				                    </arco:isRoleOf>
				                </rdf:Description>
				                <rdf:Description>
				                    <xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./REGE)))" />
				                    </xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label>
				                        <xsl:value-of select="normalize-space(./REGE)" />
				                    </rdfs:label>
				                    <l0:name>
				                        <xsl:value-of select="normalize-space(./REGE)" />
				                    </l0:name>
				                    <arco:isAgentOf>
				                    	<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-audio-documentation-', $audiodocu-position, '-audio-documentation-owner')" />
				                        </xsl:attribute>
				                    </arco:isAgentOf>
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
            			<xsl:value-of select="concat($NS, 'SourceAndDocument/', $itemURI, '-source-document-', position())" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/subjective/SourceAndDocument'" />
            			</xsl:attribute>
            		</rdf:type>
            		<rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Sources and documents ', position(), ' of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Sources and documents ', position(), ' of cultural property: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Fonti e documenti ', position(), ' del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Fonti e documenti ', position(), ' del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<xsl:if test="./FNTI">
            			<culturaldefinition:documentationIdentifier>
            				<xsl:value-of select="./FNTI" />
            			</culturaldefinition:documentationIdentifier>
            		</xsl:if>
            		<xsl:if test="./FNTD">
            			<tiapit:date>
            				<xsl:value-of select="./FNTD" />
            			</tiapit:date>
            		</xsl:if>
            		<xsl:if test="./FNTS and not(./FNTS='-' or ./FNTS='.')">
            			<culturaldefinition:documentationLocation>
            				<xsl:value-of select="./FNTS" />
            			</culturaldefinition:documentationLocation>
            		</xsl:if>
            		<xsl:if test="./FNTF">
            			<culturaldefinition:folio>
            				<xsl:value-of select="./FNTF" />
            			</culturaldefinition:folio>
            		</xsl:if>
            		<xsl:if test="./FNTY">
            			<culturaldefinition:rights>
            				<xsl:value-of select="./FNTY" />
            			</culturaldefinition:rights>
            		</xsl:if>
            		<xsl:if test="./FNTK">
            			<culturaldefinition:digitalFileName>
            				<xsl:value-of select="./FNTK" />
            			</culturaldefinition:digitalFileName>
            		</xsl:if>
            		<xsl:if test="./FNTO">
            			<arco:note>
            				<xsl:value-of select="./FNTO" />
            			</arco:note>
            		</xsl:if>
            		<xsl:if test="./FNTW">
            			<smapit:URL>
            				<xsl:value-of select="./FNTW" />
            			</smapit:URL>
            		</xsl:if>
            		<xsl:if test="./FNTT">
            			<culturaldefinition:documentationTitle>
            				<xsl:value-of select="./FNTT" />
            			</culturaldefinition:documentationTitle>
            		</xsl:if>
            		<xsl:if test="./FNTX and not(lower-case(normalize-space(./FNTX))='nr' or lower-case(normalize-space(./FNTX))='n.r.' or lower-case(normalize-space(./FNTX))='nr (recupero pregresso)')">
                        <arco:hasCategory>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="lower-case(normalize-space(./FNTX))='documentazione esistente'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/ExistingDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./FNTX))='documentazione allegata'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/AttachedDocumentation'" />
                                    </xsl:when>
                                    <xsl:when test="./FNTX">
                                        <xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FNTX)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </arco:hasCategory>          		            		
            		</xsl:if>
            		<xsl:if test="./FNTP">
            			<culturaldefinition:hasDocumentationType>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FNTP)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasDocumentationType>            		            		
            		</xsl:if>
            		<xsl:if test="./FNTR">
            			<culturaldefinition:hasFormat>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./FNTR)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasFormat>            		            		
            		</xsl:if>
            		<xsl:if test="./FNTA">
            			<culturaldefinition:hasAuthor>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FNTA)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasAuthor>            		            		
            		</xsl:if>
            		<xsl:if test="./FNTN">
            			<culturaldefinition:hasArchive>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FNTN)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasArchive>            		            		
            		</xsl:if>
            		<xsl:if test="./FNTE">
            			<arco:hasAgentRole>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-source-document-', $sourcedocu-position, '-source-document-owner')" />
            				</xsl:attribute>
            			</arco:hasAgentRole>
            		</xsl:if>
            	</rdf:Description>
            	<!-- documentation category of sources and documents as an individual -->
            	<xsl:if test="./FNTX and not(lower-case(normalize-space(./FNTX))='nr' or lower-case(normalize-space(./FNTX))='n.r.' or lower-case(normalize-space(./FNTX))='nr (recupero pregresso)')">
                    <xsl:choose>
                        <xsl:when test="lower-case(normalize-space(./FNTX))='documentazione esistente'" />
                        <xsl:when test="lower-case(normalize-space(./FNTX))='documentazione allegata'" />
                        <xsl:when test="./FNTX">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'DocumentationCategory/', arco-fn:urify(normalize-space(./FNTX)))" />
                                </xsl:attribute>
                                <rdf:type rdf:resource="https://w3id.org/arco/subjective/DocumentationCategory" />
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
            				<xsl:value-of select="concat($NS, 'DocumentationType/', arco-fn:urify(normalize-space(./FNTP)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/DocumentationType'" />
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
            				<xsl:value-of select="concat($NS, 'Format/', arco-fn:urify(normalize-space(./FNTR)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/Format'" />
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
            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FNTA)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
            				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FNTN)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
		                        		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-source-document-', $sourcedocu-position, '-source-document-owner')" />
		                    		</xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label xml:lang="it">
				                        <xsl:value-of select="concat('Ente proprietario di fonti e documenti ', $sourcedocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./FNTE))" />
				                    </rdfs:label>
				                    <rdfs:label xml:lang="en">
				                        <xsl:value-of select="concat('Owner agency of sources and documents ', $sourcedocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./FNTE))" />
				                    </rdfs:label>
				                    <l0:name xml:lang="it">
				                        <xsl:value-of select="concat('Ente proprietario di fonti e documenti ', $sourcedocu-position, ' del bene culturale ', $itemURI, ': ', normalize-space(./FNTE))" />
				                    </l0:name>
				                    <l0:name xml:lang="en">
				                        <xsl:value-of select="concat('Owner agency of sources and documents ', $sourcedocu-position, ' of cultural property ', $itemURI, ': ', normalize-space(./FNTE))" />
				                    </l0:name>
				                    <arco:hasRole>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                        </xsl:attribute>
				                    </arco:hasRole>
				                    <arco:hasAgent>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FNTE)))" />
				                        </xsl:attribute>
				                    </arco:hasAgent>
				                </rdf:Description>
				                <rdf:Description>
				                    <xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Role/Owner')" />
				                    </xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label xml:lang="it">
				                        <xsl:value-of select="'Ente proprietario della documentazione'" />
				                    </rdfs:label>
				                    <rdfs:label xml:lang="en">
				                        <xsl:value-of select="'Owner of documentation'" />
				                    </rdfs:label>
				                    <arco:isRoleOf>
				                    	<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-source-document-', $sourcedocu-position, '-source-document-owner')" />
				                        </xsl:attribute>
				                    </arco:isRoleOf>
				                </rdf:Description>
				                <rdf:Description>
				                    <xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FNTE)))" />
				                    </xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label>
				                        <xsl:value-of select="normalize-space(./FNTE)" />
				                    </rdfs:label>
				                    <l0:name>
				                        <xsl:value-of select="normalize-space(./FNTE)" />
				                    </l0:name>
				                    <arco:isAgentOf>
				                    	<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-source-document-', $sourcedocu-position, '-source-document-owner')" />
				                        </xsl:attribute>
				                    </arco:isAgentOf>
				                </rdf:Description>
				             </xsl:if>
            </xsl:for-each>
            <!-- Bibliography of cultural property as an individual -->
            <xsl:for-each select="schede/*/DO/BIB">
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-bibliography-', position())" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/subjective/Bibliography'" />
            			</xsl:attribute>
            		</rdf:type>
            		<rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Bibliography ', position(), ' of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Bibliography ', position(), ' of cultural property: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Bibliografia ', position(), ' del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Bibliografia ', position(), ' del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<xsl:if test="./BIBH">
            			<culturaldefinition:bibliographyIdentifier>
            				<xsl:value-of select="normalize-space(./BIBH)" />
            			</culturaldefinition:bibliographyIdentifier>
            		</xsl:if>
            		<xsl:if test="./BIBK or ./NCUN">
            			<culturaldefinition:bibliographyICCDIdentifier>
            				<xsl:choose>
            					<xsl:when test="./BIBK">
            						<xsl:value-of select="normalize-space(./BIBK)" />
            					</xsl:when>
            					<xsl:when test="./NCUN">
            						<xsl:value-of select="normalize-space(./NCUN)" />
            					</xsl:when>
            				</xsl:choose>
            			</culturaldefinition:bibliographyICCDIdentifier>
            		</xsl:if>
            		<xsl:if test="./BIBM or ../BIL">
            			<culturaldefinition:completeBibliographicReference>
            				<xsl:choose>
            					<xsl:when test="./BIBM">
            						<xsl:value-of select="normalize-space(./BIBM)" />
            					</xsl:when>
            					<xsl:when test="../BIL">
            						<xsl:value-of select="normalize-space(../BIL)" />
            					</xsl:when>
            				</xsl:choose>
            			</culturaldefinition:completeBibliographicReference>
            		</xsl:if>
            		<xsl:if test="./BIBR">
            			<culturaldefinition:abbreviation>
            				<xsl:value-of select="normalize-space(./BIBR)" />
            			</culturaldefinition:abbreviation>
            		</xsl:if>
            		<xsl:if test="./BIBY">
            			<culturaldefinition:rights>
            				<xsl:value-of select="normalize-space(./BIBY)" />
            			</culturaldefinition:rights>
            		</xsl:if>
            		<xsl:if test="./BIBN or ./BIBI">
            			<arco:note>
            				<xsl:choose>
            					<xsl:when test="./BIBI">
            						<xsl:value-of select="concat(normalize-space(./BIBM), normalize-space(./BIBI))" />
            					</xsl:when>
            					<xsl:otherwise>
            						<xsl:value-of select="normalize-space(./BIBN)" />
            					</xsl:otherwise>
            				</xsl:choose>
            			</arco:note>
            		</xsl:if>
            		<xsl:if test="./BIBW">
            			<smapit:URL>
            				<xsl:value-of select="normalize-space(./BIBW)" />
            			</smapit:URL>
            		</xsl:if>
            		<xsl:if test="./BIBJ">
            			<cataloguerecord:hasCataloguingAgent>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./BIBJ)))" />
            				</xsl:attribute>
            			</cataloguerecord:hasCataloguingAgent>
            		</xsl:if>
            		<xsl:if test="./BIBX and not(lower-case(normalize-space(./BIBX))='nr' or lower-case(normalize-space(./BIBX))='n.r.' or lower-case(normalize-space(./BIBX))='nr (recupero pregresso)')">
                        <arco:hasCategory>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="lower-case(normalize-space(./BIBX))='bibliografia di corredo'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/AccompanyingBibliography'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./BIBX))='bibliografia di confronto'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/ComparativeBibliography'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./BIBX))='bibliografia specifica'">
                                        <xsl:value-of select="'https://w3id.org/arco/subjective/SpecificBibliography'" />
                                    </xsl:when>
                                    <xsl:when test="./BIBX">
                                        <xsl:value-of select="concat($NS, 'BibliographyCategory/', arco-fn:urify(normalize-space(./BIBX)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </arco:hasCategory>          		            		
            		</xsl:if>
            		<xsl:if test="./BIBF">
            			<culturaldefinition:hasBibliographyType>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'BibliographyType/', arco-fn:urify(normalize-space(./BIBF)))" />
            				</xsl:attribute>
            			</culturaldefinition:hasBibliographyType>            		            		
            		</xsl:if>
            	</rdf:Description>
            	<!--  bibliography category as an individual -->
            	<xsl:if test="./BIBX and not(lower-case(normalize-space(./BIBX))='nr' or lower-case(normalize-space(./BIBX))='n.r.' or lower-case(normalize-space(./BIBX))='nr (recupero pregresso)')">
                    <xsl:choose>
                        <xsl:when test="lower-case(normalize-space(./BIBX))='bibliografia di corredo'" />
                        <xsl:when test="lower-case(normalize-space(./BIBX))='bibliografia di confronto'" />
                        <xsl:when test="lower-case(normalize-space(./BIBX))='bibliografia specifica'" />
                        <xsl:when test="./BIBX">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'BibliographyCategory/', arco-fn:urify(normalize-space(./BIBX)))" />
                                </xsl:attribute>
                                <rdf:type rdf:resource="https://w3id.org/arco/subjective/BibliographyCategory" />
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
                				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./BIBJ)))" />
                			</xsl:attribute>      
                			<rdf:type>
                				<xsl:attribute name="rdf:resource">
                            		<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
            				<xsl:value-of select="concat($NS, 'BibliographyType/', arco-fn:urify(normalize-space(./BIBF)))" />
            			</xsl:attribute>
            			<rdf:type>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="'https://w3id.org/arco/subjective/BibliographyType'" />
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
            <!-- Geometry of cultural property as an individual for GE (version 4.00)-->
            <xsl:for-each select="schede/*/GE | schede/*/MT/MTA/MTAR | schede/*/MT/MTA/MTAX / schede/*/MT/MTA/MTAM">
            <xsl:variable name="geometry-position" select="position()" />
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-', position())" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Geometry'" />
            			</xsl:attribute>
            		</rdf:type>
            		<clvapit:isGeometryFor>
            			<xsl:attribute name="rdf:resource">
				           <xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
				        </xsl:attribute>
            		</clvapit:isGeometryFor>
            		<rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Geometry ', position(), ' of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Geometry ', position(), ' of cultural property: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Georeferenziazione ', position(), ' del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Georeferenziazione ', position(), ' del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<clvapit:hasGeometryType>
            			<xsl:attribute name="rdf:resource">
                            <xsl:choose>
                                <xsl:when test="./GET='georeferenziazione puntuale'">
                                    <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Point'" />
                                </xsl:when>
                                <xsl:when test="./GET='georeferenziazione areale'">
                                    <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Polygon'" />
                                </xsl:when>
                                <xsl:when test="./GET='georeferenziazione lineare'">
                                    <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Line'" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat($NS, 'GeometryType/', arco-fn:urify(normalize-space(./GET)))" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
            		</clvapit:hasGeometryType>
            		<xsl:for-each select="./GEC">
            			<locgeoamm:hasCoordinates>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Coordinates/', $itemURI, '-geometry-', $geometry-position, '-coordinates', '-', position())" />
            				</xsl:attribute>
            			</locgeoamm:hasCoordinates>
            		</xsl:for-each>
            		<xsl:if test="./GEP">
            			<locgeoamm:spacialReferenceSystem>
            				<xsl:value-of select="./GEP" />
            			</locgeoamm:spacialReferenceSystem>
            		</xsl:if>
            		<xsl:if test="./GPT">
            			<locgeoamm:hasGeometryTechnique>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GPT)))" />
            				</xsl:attribute>
            			</locgeoamm:hasGeometryTechnique>
            		</xsl:if>
            		<xsl:if test="./GPM">
            			<locgeoamm:hasGeometryMethod>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GPM)))" />
            				</xsl:attribute>
            			</locgeoamm:hasGeometryMethod>
            		</xsl:if>
            		<xsl:if test="./GPB">
            			<locgeoamm:hasBaseMap>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
            				</xsl:attribute>
            			</locgeoamm:hasBaseMap>
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
                                    <xsl:value-of select="concat($NS, 'GeometryType/', arco-fn:urify(normalize-space(./GET)))" />
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
            			<xsl:value-of select="concat($NS, 'Coordinates/', $itemURI, '-geometry-', $geometry-position, '-coordinates', '-', position())" />
            		</xsl:attribute>
            		<rdf:type rdf:resource="https://w3id.org/arco/location/Coordinates" />
                    <rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<xsl:if test="./GECX">
            			<locgeoamm:long>
            				<xsl:value-of select="./GECX" />
            			</locgeoamm:long>
            		</xsl:if> 
            		<xsl:if test="./GECY">
            			<locgeoamm:lat>
            				<xsl:value-of select="./GECY" />
            			</locgeoamm:lat>
            		</xsl:if>
            		<xsl:if test="./GECZ | ../../MT/MTA/MTAR | ../../MT/MTA/MTAX / ../../MT/MTA/MTAM">
            			<locgeoamm:hasAltitude>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
            				</xsl:attribute>
            			</locgeoamm:hasAltitude>
            		</xsl:if>
            	</rdf:Description>            
            </xsl:for-each>
            <!-- geometry technique for GE as an individual -->
            <xsl:if test="./GPT">
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GPT)))" />
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
            			<xsl:value-of select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GPM)))" />
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
            			<xsl:value-of select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
            		</xsl:attribute>
            		<rdf:type rdf:resource="https://w3id.org/arco/location/BaseMap" />
                    <rdfs:label xml:lang="it">
	                       <xsl:value-of select="concat('Base cartografica del bene culturale: ', $itemURI)" />
	                    </rdfs:label>
	                    <l0:name xml:lang="it">
	                       <xsl:value-of select="concat('Base cartografica del bene culturale: ', $itemURI)" />
	                    </l0:name>
	                    <rdfs:label xml:lang="en">
	                       <xsl:value-of select="concat('Base map of cultural property: ', $itemURI)" />
	                    </rdfs:label>
	                    <l0:name xml:lang="en">
	                       <xsl:value-of select="concat('Base map of cultural property: ', $itemURI)" />
	                    </l0:name>
                    <xsl:if test="./GPB/GPBB">
                    	<arco:description>
                    		<xsl:value-of select="./GPB/GPBB" />
                    	</arco:description>
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
                    	<arco:note>
                    		<xsl:value-of select="./GPB/GPBO" />
                    	</arco:note>
                    </xsl:if>
            	</rdf:Description>            
            </xsl:if>
             <!-- altitude for GE as an individual -->
            <xsl:if test="./GEC/GECZ | ../MT/MTA/MTAR | ../MT/MTA/MTAX / ../MT/MTA/MTAM">
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
            		</xsl:attribute>
            		<rdf:type rdf:resource="https://w3id.org/arco/location/Altitude" />
                    	<rdfs:label xml:lang="it">
	                       <xsl:value-of select="concat('Altitudine del bene culturale: ', $itemURI)" />
	                    </rdfs:label>
	                    <l0:name xml:lang="it">
	                       <xsl:value-of select="concat('Altitudine del bene culturale: ', $itemURI)" />
	                    </l0:name>
	                    <rdfs:label xml:lang="en">
	                       <xsl:value-of select="concat('Altitude of cultural property: ', $itemURI)" />
	                    </rdfs:label>
	                    <l0:name xml:lang="en">
	                       <xsl:value-of select="concat('Altitude of cultural property: ', $itemURI)" />
	                    </l0:name>
	                    <xsl:if test="./GEC/GECZ">
		                    <locgeoamm:alt>
		                    	<xsl:value-of select="./GEC/GECZ" />
		                    </locgeoamm:alt>
	                    </xsl:if>
	                    <xsl:if test="../MT/MTA/MTAR">
		                    <locgeoamm:relativeAlt>
		                    	<xsl:value-of select="../MT/MTA/MTAR" />
		                    </locgeoamm:relativeAlt>
	                    </xsl:if>
	                    <xsl:if test="../MT/MTA/MTAX">
		                    <locgeoamm:maxAlt>
		                    	<xsl:value-of select="../MT/MTA/MTAX" />
		                    </locgeoamm:maxAlt>
	                    </xsl:if>
	                    <xsl:if test="../MT/MTA/MTAM">
		                    <locgeoamm:minAlt>
		                    	<xsl:value-of select="../MT/MTA/MTAM" />
		                    </locgeoamm:minAlt>
	                    </xsl:if>
	                    <xsl:if test="../MT/MTA/MTAS">
	                    	<arco:note>
	                    		<xsl:value-of select="../MT/MTA/MTAS" />
	                    	</arco:note>
	                    </xsl:if>
            	</rdf:Description>            
            </xsl:if>
            </xsl:for-each>  
            <!-- Geometry of cultural property as an individual for GP (Point)-->
            <xsl:for-each select="schede/*/GP">
            	<xsl:variable name="geometry-position" select="position()" />
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-point-', position())" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Geometry'" />
            			</xsl:attribute>
            		</rdf:type>
            		<rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Geometry (point) ', position(), ' of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Geometry (point) ', position(), ' of cultural property: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Georeferenziazione (puntuale) ', position(), ' del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Georeferenziazione (puntuale) ', position(), ' del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<clvapit:isGeometryFor>
            			<xsl:attribute name="rdf:resource">
				           <xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
				        </xsl:attribute>
            		</clvapit:isGeometryFor>
            		<clvapit:hasGeometryType>
            			<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Point'" />
                        </xsl:attribute>
            		</clvapit:hasGeometryType>
            		<xsl:for-each select="./GPD/GPDP">
            			<locgeoamm:hasCoordinates>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Coordinates/', $itemURI, '-geometry-point-', $geometry-position, '-coordinates', '-', position())" />
            				</xsl:attribute>
            			</locgeoamm:hasCoordinates>
            		</xsl:for-each>
            		<xsl:if test="./GPP">
            			<locgeoamm:spacialReferenceSystem>
            				<xsl:value-of select="./GPP" />
            			</locgeoamm:spacialReferenceSystem>
            		</xsl:if>
            		<xsl:if test="./GPC/GPCT">
            			<locgeoamm:pointType>
            				<xsl:value-of select="./GPP" />
            			</locgeoamm:pointType>
            		</xsl:if>
            		<xsl:if test="./GPT">
            			<locgeoamm:hasGeometryTechnique>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GPT)))" />
            				</xsl:attribute>
            			</locgeoamm:hasGeometryTechnique>
            		</xsl:if>
            		<xsl:if test="./GPM">
            			<locgeoamm:hasGeometryMethod>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GPM)))" />
            				</xsl:attribute>
            			</locgeoamm:hasGeometryMethod>
            		</xsl:if>
            		<xsl:if test="./GPB">
            			<locgeoamm:hasBaseMap>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
            				</xsl:attribute>
            			</locgeoamm:hasBaseMap>
            		</xsl:if>
            	</rdf:Description>
            	<!-- geometry coordinates for GP as an individual -->
	            <xsl:for-each select="./GPD/GPDP">
	            	<rdf:Description>
	            		<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'Coordinates/', $itemURI, '-geometry-point-', $geometry-position, '-coordinates', '-', position())" />
	            		</xsl:attribute>
	            		<rdf:type rdf:resource="https://w3id.org/arco/location/Coordinates" />
	                    <rdfs:label xml:lang="en">
	            			<xsl:value-of select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
	            		</rdfs:label>
	            		<l0:name xml:lang="en">
	            			<xsl:value-of select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
	            		</l0:name>
	            		<rdfs:label xml:lang="it">
	            			<xsl:value-of select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
	            		</rdfs:label>
	            		<l0:name xml:lang="en">
	            			<xsl:value-of select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
	            		</l0:name>
	            		<xsl:if test="./GPDPX">
	            			<locgeoamm:long>
	            				<xsl:value-of select="./GPDPX" />
	            			</locgeoamm:long>
	            		</xsl:if> 
	            		<xsl:if test="./GPDPY">
	            			<locgeoamm:lat>
	            				<xsl:value-of select="./GPDPY" />
	            			</locgeoamm:lat>
	            		</xsl:if>
	            		<xsl:if test="../../GPC/GPCL | ../../GPC/GPCI | ../../GPC/GPCS">
	            			<locgeoamm:hasAltitude>
	            				<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
	            				</xsl:attribute>
	            			</locgeoamm:hasAltitude>
	            		</xsl:if>
	            	</rdf:Description>            
	            </xsl:for-each>
            	<!-- geometry technique for GP as an individual -->
	            <xsl:if test="./GPT">
	            	<rdf:Description>
	            		<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GPT)))" />
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
	            			<xsl:value-of select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GPM)))" />
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
	            			<xsl:value-of select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
	            		</xsl:attribute>
	            		<rdf:type rdf:resource="https://w3id.org/arco/location/BaseMap" />
	                    <rdfs:label xml:lang="it">
		                       <xsl:value-of select="concat('Base cartografica del bene culturale: ', $itemURI)" />
		                    </rdfs:label>
		                    <l0:name xml:lang="it">
		                       <xsl:value-of select="concat('Base cartografica del bene culturale: ', $itemURI)" />
		                    </l0:name>
		                    <rdfs:label xml:lang="en">
		                       <xsl:value-of select="concat('Base map of cultural property: ', $itemURI)" />
		                    </rdfs:label>
		                    <l0:name xml:lang="en">
		                       <xsl:value-of select="concat('Base map of cultural property: ', $itemURI)" />
		                    </l0:name>
	                    <xsl:if test="./GPB/GPBB">
	                    	<arco:description>
	                    		<xsl:value-of select="./GPB/GPBB" />
	                    	</arco:description>
	                    </xsl:if>
	                    <xsl:if test="./GPB/GPBT">
	                    	<tiapit:date>
	                    		<xsl:value-of select="./GPB/GPBT" />
	                    	</tiapit:date>
	                    </xsl:if>
	                    <xsl:if test="./GPB/GPBO">
	                    	<arco:note>
	                    		<xsl:value-of select="./GPB/GPBO" />
	                    	</arco:note>
	                    </xsl:if>
	            	</rdf:Description>            
	            </xsl:if>
            <!-- altitude for GP as an individual -->
            <xsl:if test="./GPC/GPCL | ./GPC/GPCI | ./GPC/GPCS">
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
            		</xsl:attribute>
            		<rdf:type rdf:resource="https://w3id.org/arco/location/Altitude" />
                    	<rdfs:label xml:lang="it">
	                       <xsl:value-of select="concat('Altitudine del bene culturale: ', $itemURI)" />
	                    </rdfs:label>
	                    <l0:name xml:lang="it">
	                       <xsl:value-of select="concat('Altitudine del bene culturale: ', $itemURI)" />
	                    </l0:name>
	                    <rdfs:label xml:lang="en">
	                       <xsl:value-of select="concat('Altitude of cultural property: ', $itemURI)" />
	                    </rdfs:label>
	                    <l0:name xml:lang="en">
	                       <xsl:value-of select="concat('Altitude of cultural property: ', $itemURI)" />
	                    </l0:name>
	                    <xsl:if test="./GPC/GPCL">
		                    <locgeoamm:alt>
		                    	<xsl:value-of select="./GPC/GPCL" />
		                    </locgeoamm:alt>
	                    </xsl:if>
	                    <xsl:if test="./GPC/GPCS">
		                    <locgeoamm:maxAlt>
		                    	<xsl:value-of select="./GPC/GPCS" />
		                    </locgeoamm:maxAlt>
	                    </xsl:if>
	                    <xsl:if test="./GPC/GPCI">
		                    <locgeoamm:minAlt>
		                    	<xsl:value-of select="./GPC/GPCI" />
		                    </locgeoamm:minAlt>
	                    </xsl:if>
            	</rdf:Description>            
            </xsl:if>
            </xsl:for-each> 
            <!-- Geometry of cultural property as an individual for GL (Line)-->
            <xsl:if test="schede/*/GL">
            <xsl:for-each select="schede/*/GL">
            <xsl:variable name="geometry-position" select="position()" />
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-line-', position())" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Geometry'" />
            			</xsl:attribute>
            		</rdf:type>
            		<rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Geometry (line) ', position(), ' of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Geometry (line) ', position(), ' of cultural property: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Georeferenziazione (lineare) ', position(), ' del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Georeferenziazione (lineare) ', position(), ' del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<clvapit:isGeometryFor>
            			<xsl:attribute name="rdf:resource">
				           <xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
				        </xsl:attribute>
            		</clvapit:isGeometryFor>
            		<clvapit:hasGeometryType>
            			<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Line'" />
                        </xsl:attribute>
            		</clvapit:hasGeometryType>
            		<xsl:for-each select="./GLD/GLDP">
            			<locgeoamm:hasCoordinates>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Coordinates/', $itemURI, '-geometry-line-', $geometry-position, '-coordinates', '-', position())" />
            				</xsl:attribute>
            			</locgeoamm:hasCoordinates>
            		</xsl:for-each>
            		<xsl:if test="./GLP">
            			<locgeoamm:spacialReferenceSystem>
            				<xsl:value-of select="./GLP" />
            			</locgeoamm:spacialReferenceSystem>
            		</xsl:if>
            		<xsl:if test="./GLT">
            			<locgeoamm:hasGeometryTechnique>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GLT)))" />
            				</xsl:attribute>
            			</locgeoamm:hasGeometryTechnique>
            		</xsl:if>
            		<xsl:if test="./GLM">
            			<locgeoamm:hasGeometryMethod>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GLM)))" />
            				</xsl:attribute>
            			</locgeoamm:hasGeometryMethod>
            		</xsl:if>
            		<xsl:if test="./GLB">
            			<locgeoamm:hasBaseMap>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
            				</xsl:attribute>
            			</locgeoamm:hasBaseMap>
            		</xsl:if>
            	</rdf:Description>
            	<!-- geometry coordinates for GL as an individual -->
	            <xsl:for-each select="./GLD/GLDP">
	            	<rdf:Description>
	            		<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'Coordinates/', $itemURI, '-geometry-line-', $geometry-position, '-coordinates', '-', position())" />
	            		</xsl:attribute>
	            		<rdf:type rdf:resource="https://w3id.org/arco/location/Coordinates" />
	                    <rdfs:label xml:lang="en">
	            			<xsl:value-of select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
	            		</rdfs:label>
	            		<l0:name xml:lang="en">
	            			<xsl:value-of select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
	            		</l0:name>
	            		<rdfs:label xml:lang="it">
	            			<xsl:value-of select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
	            		</rdfs:label>
	            		<l0:name xml:lang="en">
	            			<xsl:value-of select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
	            		</l0:name>
	            		<xsl:if test="./GLDPX">
	            			<locgeoamm:long>
	            				<xsl:value-of select="./GLDPX" />
	            			</locgeoamm:long>
	            		</xsl:if> 
	            		<xsl:if test="./GLDPY">
	            			<locgeoamm:lat>
	            				<xsl:value-of select="./GLDPY" />
	            			</locgeoamm:lat>
	            		</xsl:if>
	            		<xsl:if test="../../GLQ/GLQI | ../../GLQ/GLQS">
	            			<locgeoamm:hasAltitude>
	            				<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
	            				</xsl:attribute>
	            			</locgeoamm:hasAltitude>
	            		</xsl:if>
	            	</rdf:Description>            
	            </xsl:for-each>
            	<!-- geometry technique for GL as an individual -->
	            <xsl:if test="./GLT">
	            	<rdf:Description>
	            		<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GLT)))" />
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
	            			<xsl:value-of select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GLM)))" />
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
	            			<xsl:value-of select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
	            		</xsl:attribute>
	            		<rdf:type rdf:resource="https://w3id.org/arco/location/BaseMap" />
	                    <rdfs:label xml:lang="it">
	                       <xsl:value-of select="concat('Base cartografica del bene culturale: ', $itemURI)" />
	                    </rdfs:label>
	                    <l0:name xml:lang="it">
	                       <xsl:value-of select="concat('Base cartografica del bene culturale: ', $itemURI)" />
	                    </l0:name>
	                    <rdfs:label xml:lang="en">
	                       <xsl:value-of select="concat('Base map of cultural property: ', $itemURI)" />
	                    </rdfs:label>
	                    <l0:name xml:lang="en">
	                       <xsl:value-of select="concat('Base map of cultural property: ', $itemURI)" />
	                    </l0:name>
	                    <xsl:if test="./GLB/GLBB">
	                    	<arco:description>
	                    		<xsl:value-of select="./GLB/GLBB" />
	                    	</arco:description>
	                    </xsl:if>
	                    <xsl:if test="./GLB/GLBT">
	                    	<tiapit:date>
	                    		<xsl:value-of select="./GLB/GLBT" />
	                    	</tiapit:date>
	                    </xsl:if>
	                    <xsl:if test="./GLB/GLBO">
	                    	<arco:note>
	                    		<xsl:value-of select="./GPB/GPBO" />
	                    	</arco:note>
	                    </xsl:if>
	            	</rdf:Description>            
	            </xsl:if>
	            <!-- altitude for GL as an individual -->
	            <xsl:if test="./GLQ/GLQI | ./GLQ/GLQS">
	            	<rdf:Description>
	            		<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
	            		</xsl:attribute>
	            		<rdf:type rdf:resource="https://w3id.org/arco/location/Altitude" />
	                    	<rdfs:label xml:lang="it">
		                       <xsl:value-of select="concat('Altitudine del bene culturale: ', $itemURI)" />
		                    </rdfs:label>
		                    <l0:name xml:lang="it">
		                       <xsl:value-of select="concat('Altitudine del bene culturale: ', $itemURI)" />
		                    </l0:name>
		                    <rdfs:label xml:lang="en">
		                       <xsl:value-of select="concat('Altitude of cultural property: ', $itemURI)" />
		                    </rdfs:label>
		                    <l0:name xml:lang="en">
		                       <xsl:value-of select="concat('Altitude of cultural property: ', $itemURI)" />
		                    </l0:name>
		                    <xsl:if test="./GLQ/GLQS">
			                    <locgeoamm:maxAlt>
			                    	<xsl:value-of select="./GLQ/GLQS" />
			                    </locgeoamm:maxAlt>
		                    </xsl:if>
		                    <xsl:if test="./GLQ/GLQI">
			                    <locgeoamm:minAlt>
			                    	<xsl:value-of select="./GLQ/GLQI" />
			                    </locgeoamm:minAlt>
		                    </xsl:if>
	            	</rdf:Description>            
	            </xsl:if>
            </xsl:for-each>  
            </xsl:if>
            <!-- Geometry of cultural property as an individual for GA (Area)-->
            <xsl:if test="schede/*/GA">
            <xsl:variable name="geometry-position" select="position()" />
            <xsl:for-each select="schede/*/GA">
            	<rdf:Description>
            		<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'Geometry/', $itemURI, '-geometry-polygon-', position())" />
            		</xsl:attribute>
            		<rdf:type>
            			<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Geometry'" />
            			</xsl:attribute>
            		</rdf:type>
            		<rdfs:label xml:lang="en">
            			<xsl:value-of select="concat('Geometry (area) ', position(), ' of cultural property: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Geometry (area) ', position(), ' of cultural property: ', $itemURI)" />
            		</l0:name>
            		<rdfs:label xml:lang="it">
            			<xsl:value-of select="concat('Georeferenziazione (areale) ', position(), ' del bene culturale: ', $itemURI)" />
            		</rdfs:label>
            		<l0:name xml:lang="en">
            			<xsl:value-of select="concat('Georeferenziazione (areale) ', position(), ' del bene culturale: ', $itemURI)" />
            		</l0:name>
            		<clvapit:isGeometryFor>
            			<xsl:attribute name="rdf:resource">
				           <xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
				        </xsl:attribute>
            		</clvapit:isGeometryFor>
            		<clvapit:hasGeometryType>
            			<xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Polygon'" />
                        </xsl:attribute>
            		</clvapit:hasGeometryType>
            		<xsl:for-each select="./GAD/GADP">
            			<locgeoamm:hasCoordinates>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'Coordinates/', $itemURI, '-geometry-polygon-', $geometry-position, '-coordinates', '-', position())" />
            				</xsl:attribute>
            			</locgeoamm:hasCoordinates>
            		</xsl:for-each>
            		<xsl:if test="./GAP">
            			<locgeoamm:spacialReferenceSystem>
            				<xsl:value-of select="./GAP" />
            			</locgeoamm:spacialReferenceSystem>
            		</xsl:if>
            		<xsl:if test="./GAT">
            			<locgeoamm:hasGeometryTechnique>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GAT)))" />
            				</xsl:attribute>
            			</locgeoamm:hasGeometryTechnique>
            		</xsl:if>
            		<xsl:if test="./GAM">
            			<locgeoamm:hasGeometryMethod>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GAM)))" />
            				</xsl:attribute>
            			</locgeoamm:hasGeometryMethod>
            		</xsl:if>
            		<xsl:if test="./GAB">
            			<locgeoamm:hasBaseMap>
            				<xsl:attribute name="rdf:resource">
            					<xsl:value-of select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
            				</xsl:attribute>
            			</locgeoamm:hasBaseMap>
            		</xsl:if>
            	</rdf:Description>
            	<!-- geometry coordinates for GL as an individual -->
	            <xsl:for-each select="./GAD/GADP">
	            	<rdf:Description>
	            		<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'Coordinates/', $itemURI, '-geometry-polygon-', $geometry-position, '-coordinates', '-', position())" />
	            		</xsl:attribute>
	            		<rdf:type rdf:resource="https://w3id.org/arco/location/Coordinates" />
	                    <rdfs:label xml:lang="en">
	            			<xsl:value-of select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
	            		</rdfs:label>
	            		<l0:name xml:lang="en">
	            			<xsl:value-of select="concat('Coordinates ', position(), ' of cultural property: ', $itemURI)" />
	            		</l0:name>
	            		<rdfs:label xml:lang="it">
	            			<xsl:value-of select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
	            		</rdfs:label>
	            		<l0:name xml:lang="en">
	            			<xsl:value-of select="concat('Coordinate ', position(), ' del bene culturale: ', $itemURI)" />
	            		</l0:name>
	            		<xsl:if test="./GADPX">
	            			<locgeoamm:long>
	            				<xsl:value-of select="./GADPX" />
	            			</locgeoamm:long>
	            		</xsl:if> 
	            		<xsl:if test="./GADPY">
	            			<locgeoamm:lat>
	            				<xsl:value-of select="./GADPY" />
	            			</locgeoamm:lat>
	            		</xsl:if>
	            		<xsl:if test="../../GAQ/GAQI | ../../GAQ/GAQS">
	            			<locgeoamm:hasAltitude>
	            				<xsl:attribute name="rdf:resource">
	            					<xsl:value-of select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
	            				</xsl:attribute>
	            			</locgeoamm:hasAltitude>
	            		</xsl:if>
	            	</rdf:Description>            
	            </xsl:for-each>
            	<!-- geometry technique for GA as an individual -->
	            <xsl:if test="./GAT">
	            	<rdf:Description>
	            		<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'GeometryTechnique/', arco-fn:urify(normalize-space(./GAT)))" />
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
	            			<xsl:value-of select="concat($NS, 'GeometryMethod/', arco-fn:urify(normalize-space(./GAM)))" />
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
	            			<xsl:value-of select="concat($NS, 'BaseMap/', $itemURI, '-base-map')" />
	            		</xsl:attribute>
	            		<rdf:type rdf:resource="https://w3id.org/arco/location/BaseMap" />
	                    <rdfs:label xml:lang="it">
	                       <xsl:value-of select="concat('Base cartografica del bene culturale: ', $itemURI)" />
	                    </rdfs:label>
	                    <l0:name xml:lang="it">
	                       <xsl:value-of select="concat('Base cartografica del bene culturale: ', $itemURI)" />
	                    </l0:name>
	                    <rdfs:label xml:lang="en">
	                       <xsl:value-of select="concat('Base map of cultural property: ', $itemURI)" />
	                    </rdfs:label>
	                    <l0:name xml:lang="en">
	                       <xsl:value-of select="concat('Base map of cultural property: ', $itemURI)" />
	                    </l0:name>
	                    <xsl:if test="./GAB/GABB">
	                    	<arco:description>
	                    		<xsl:value-of select="./GAB/GABB" />
	                    	</arco:description>
	                    </xsl:if>
	                    <xsl:if test="./GAB/GABT">
	                    	<tiapit:date>
	                    		<xsl:value-of select="./GAB/GABT" />
	                    	</tiapit:date>
	                    </xsl:if>
	                    <xsl:if test="./GAB/GABO">
	                    	<arco:note>
	                    		<xsl:value-of select="./GAB/GABO" />
	                    	</arco:note>
	                    </xsl:if>
	            	</rdf:Description>            
	            </xsl:if>
	            <!-- altitude for GA as an individual -->
	            <xsl:if test="./GAQ/GAQI | ./GAQ/GAQS">
	            	<rdf:Description>
	            		<xsl:attribute name="rdf:about">
	            			<xsl:value-of select="concat($NS, 'Altitude/', $itemURI, '-altitude')" />
	            		</xsl:attribute>
	            		<rdf:type rdf:resource="https://w3id.org/arco/location/Altitude" />
	                    	<rdfs:label xml:lang="it">
		                       <xsl:value-of select="concat('Altitudine del bene culturale: ', $itemURI)" />
		                    </rdfs:label>
		                    <l0:name xml:lang="it">
		                       <xsl:value-of select="concat('Altitudine del bene culturale: ', $itemURI)" />
		                    </l0:name>
		                    <rdfs:label xml:lang="en">
		                       <xsl:value-of select="concat('Altitude of cultural property: ', $itemURI)" />
		                    </rdfs:label>
		                    <l0:name xml:lang="en">
		                       <xsl:value-of select="concat('Altitude of cultural property: ', $itemURI)" />
		                    </l0:name>
		                    <xsl:if test="./GAQ/GAQS">
			                    <locgeoamm:maxAlt>
			                    	<xsl:value-of select="./GLQ/GLQS" />
			                    </locgeoamm:maxAlt>
		                    </xsl:if>
		                    <xsl:if test="./GAQ/GAQI">
			                    <locgeoamm:minAlt>
			                    	<xsl:value-of select="./GLQ/GLQI" />
			                    </locgeoamm:minAlt>
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
                        	<xsl:value-of select="concat('https://w3id.org/arco/resource/DesignationInTime/', arco-fn:urify(normalize-space(schede/*/OG/OGD/OGDN)))" />
                        </xsl:when>
                        <xsl:when test="schede/*/OG/OGT/OGTN">
                        	<xsl:value-of select="concat('https://w3id.org/arco/resource/DesignationInTime/', arco-fn:urify(normalize-space(schede/*/OG/OGT/OGTN)))" />
                        </xsl:when>
                    </xsl:choose>
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/arco/objective/DesignationInTime'" />
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
                        <arco:note>
                           <xsl:value-of select="schede/*/OG/OGD/OGDS" />
                        </arco:note>
                    </xsl:if>
                    <xsl:if test="schede/*/OG/OGD/OGDT">
                        <cpdescription:hasDesignationType>
                        	<xsl:attribute name="rdf:resource">
                        		<xsl:value-of select="concat('https://w3id.org/arco/resource/DesignationType/', arco-fn:urify(normalize-space(schede/*/OG/OGD/OGDT)))"/>
                        	</xsl:attribute>
                        </cpdescription:hasDesignationType>
                    </xsl:if>
                </rdf:Description>
                </xsl:if>
                <xsl:if test="schede/*/OG/OGD/OGDT">
                    <rdf:Description>
                       <xsl:attribute name="rdf:about">
                        	<xsl:value-of select="concat('https://w3id.org/arco/resource/DesignationType/', arco-fn:urify(normalize-space(schede/*/OG/OGD/OGDT)))"/>
                       </xsl:attribute>
                       <rdf:type>
                       		<xsl:value-of select="'https://w3id.org/arco/objective/DesignationType'" />
                       </rdf:type>
                       <rdfs:label>
                       		<xsl:value-of select="normalize-space(schede/*/OG/OGD/OGDT)" />
                       </rdfs:label>
                       <l0:name>
                       		<xsl:value-of select="normalize-space(schede/*/OG/OGD/OGDT)" />
                       </l0:name>
                     </rdf:Description>
                 </xsl:if>
                <!-- Name in time - Time interval - rules for previous model
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
                </xsl:if> -->
            
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
            <!-- fruition (VeAC) as an individual -->
                <xsl:if test="schede/*/AU/FRU">
                	<xsl:for-each select="schede/*/AU/FRU">
                		<rdf:Description>
	                		<xsl:attribute name="rdf:about">
	                            <xsl:value-of select="concat($NS, 'Fruition/', $itemURI, '-', position())" />
	                        </xsl:attribute>
	                        <rdf:type>
	                            <xsl:attribute name="rdf:resource">
	                                <xsl:value-of select="'https://w3id.org/arco/subjective/Fruition'" />
	                            </xsl:attribute>
	                        </rdf:type>
	                        <rdfs:label xml:lang="it">
	                        	<xsl:value-of select="concat('Fruizione ', position(), ' del bene: ', $itemURI)" />
	                        </rdfs:label>
	                        <rdfs:label xml:lang="en">
	                        	<xsl:value-of select="concat('Fruition ', position(), ' of cultural property: ', $itemURI)" />
	                        </rdfs:label>
	                        <l0:name xml:lang="it">
	                        	<xsl:value-of select="concat('Fruizione ', position(), ' del bene: ', $itemURI)" />
	                        </l0:name>
	                        <l0:name xml:lang="en">
	                        	<xsl:value-of select="concat('Fruition ', position(), ' of cultural property: ', $itemURI)" />
	                        </l0:name>
	                        <xsl:if test="./FRUD">
	                        	<tiapit:date>
	                        		<xsl:value-of select="./FRUD" />
	                        	</tiapit:date>
	                        </xsl:if>
	                        <xsl:if test="./FRUN">
	                        	<culturaldefinition:hasUser>
	                        		<xsl:attribute name="rdf:resource">
	                        			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FRUN)))" />
	                        		</xsl:attribute>
	                        	</culturaldefinition:hasUser>
	                        </xsl:if>
	                        <xsl:if test="./FRUC">
	                        	<culturaldefinition:hasCircumstance>
	                        		<xsl:attribute name="rdf:resource">
	                        			<xsl:value-of select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./FRUC)))" />
	                        		</xsl:attribute>
	                        	</culturaldefinition:hasCircumstance>
	                        </xsl:if>
	                        <xsl:if test="./FRUF">
	                        	<culturaldefinition:hasSource>
	                        		<xsl:attribute name="rdf:resource">
	                        			<xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./FRUF)))" />
	                        		</xsl:attribute>
	                        	</culturaldefinition:hasSource>
	                        </xsl:if>
                		</rdf:Description>
                		<xsl:if test="./FRUN">
                		<rdf:Description>
                			<xsl:attribute name="rdf:about">
                				<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./FRUN)))" />
                			</xsl:attribute>      
                			<rdf:type>
                				<xsl:attribute name="rdf:resource">
                            		<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
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
                				<xsl:value-of select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(./FRUC)))" />
                			</xsl:attribute>      
                			<rdf:type>
                				<xsl:attribute name="rdf:resource">
                            		<xsl:value-of select="'https://w3id.org/arco/subjective/Circumstance'" />
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
                				<xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./FRUF)))" />
                			</xsl:attribute>      
                			<rdf:type>
                				<xsl:attribute name="rdf:resource">
                            		<xsl:value-of select="'https://w3id.org/arco/subjective/Source'" />
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
                        		<xsl:value-of select="concat($NS, 'AlternativeIdentifier/', $itemURI, '-', position())" />
                    		</xsl:attribute>
                    		<rdf:type>
                        		<xsl:attribute name="rdf:resource">
                            		<xsl:value-of select="'https://w3id.org/arco/catalogue/AlternativeIdentifier'" />
                        		</xsl:attribute>
                    		</rdf:type>
		                    <rdfs:label xml:lang="it">
		                    	<xsl:choose>
		                    		<xsl:when test="./*">
		                    			<xsl:value-of select="concat('Codice alternativo ', normalize-space(./ACCC), ' del bene culturale: ', $itemURI)" />
		                    		</xsl:when>
		                    		<xsl:otherwise>
		                    			<xsl:value-of select="concat('Codice alternativo ', normalize-space(.), ' del bene culturale: ', $itemURI)" />
		                    		</xsl:otherwise>
		                    	</xsl:choose>
		                    </rdfs:label>
		                    <l0:name xml:lang="it">
		                    	<xsl:choose>
		                    		<xsl:when test="./*">
		                    			<xsl:value-of select="concat('Codice alternativo ', normalize-space(./ACCC), ' del bene culturale: ', $itemURI)" />
		                    		</xsl:when>
		                    		<xsl:otherwise>
		                    			<xsl:value-of select="concat('Codice alternativo ', normalize-space(.), ' del bene culturale: ', $itemURI)" />
		                    		</xsl:otherwise>
		                    	</xsl:choose>
		                    </l0:name>
		                    <rdfs:label xml:lang="en">
		                    	<xsl:choose>
		                    		<xsl:when test="./*">
		                    			<xsl:value-of select="concat('Alternative identifier ', normalize-space(./ACCC), ' of cultural property: ', $itemURI)" />
		                    		</xsl:when>
		                    		<xsl:otherwise>
		                    			<xsl:value-of select="concat('Alternative identifier ', normalize-space(.), ' of cultural property: ', $itemURI)" />
		                    		</xsl:otherwise>
		                    	</xsl:choose>
		                    </rdfs:label>
		                    <l0:name xml:lang="en">
		                    	<xsl:choose>
		                    		<xsl:when test="./*">
		                    			<xsl:value-of select="concat('Alternative identifier ', normalize-space(./ACCC), ' of cultural property: ', $itemURI)" />
		                    		</xsl:when>
		                    		<xsl:otherwise>
		                    			<xsl:value-of select="concat('Alternative identifier ', normalize-space(.), ' of cultural property: ', $itemURI)" />
		                    		</xsl:otherwise>
		                    	</xsl:choose>
		                    </l0:name>
		                    <xsl:if test="./ACCS">
		                    	<arco:note>
		                    		<xsl:value-of select="normalize-space(./ACCS)" />
		                    	</arco:note>
		                    </xsl:if>
		                    <xsl:if test="./ACCP">
		                    	<cataloguerecord:referenceProject>
		                    		<xsl:value-of select="normalize-space(./ACCP)" />
		                    	</cataloguerecord:referenceProject>
		                    </xsl:if>
		                    <xsl:if test="./ACCW">
		                    	<smapit:URL>
		                    		<xsl:value-of select="normalize-space(./ACCW)" />
		                    	</smapit:URL>
		                    </xsl:if>
		                    <xsl:if test="./ACCE">
		                    	<arco:hasAgentRole>
		                    		<xsl:attribute name="rdf:resource">
                            			<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-catalogue-record-responsible')" />
                        			</xsl:attribute>
		                    	</arco:hasAgentRole>
		                    </xsl:if>
		                   </rdf:Description>
		                   <!-- agent role for catalogue record responsible for alternative identifier as an individual -->
		                   <xsl:if test="./ACCE">
		                		<rdf:Description>
		                    		<xsl:attribute name="rdf:about">
		                        		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-catalogue-record-responsible')" />
		                    		</xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/arco/core/AgentRole'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label xml:lang="it">
				                        <xsl:value-of select="concat('Ente responsabile della scheda del bene ', $itemURI, ': ', normalize-space(./ACCE))" />
				                    </rdfs:label>
				                    <rdfs:label xml:lang="en">
				                        <xsl:value-of select="concat('Responsible agency for catalogue record of cultural property ', $itemURI, ': ', normalize-space(./ACCE))" />
				                    </rdfs:label>
				                    <l0:name xml:lang="it">
				                        <xsl:value-of select="concat('Ente responsabile della scheda del bene ', $itemURI, ': ', normalize-space(./ACCE))" />
				                    </l0:name>
				                    <l0:name xml:lang="en">
				                        <xsl:value-of select="concat('Responsible agency for catalogue record of cultural property ', $itemURI, ': ', normalize-space(./ACCE))" />
				                    </l0:name>
				                    <arco:hasRole>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'Role/CatalogueRecordResponsible')" />
				                        </xsl:attribute>
				                    </arco:hasRole>
				                    <arco:hasAgent>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ACCE)))" />
				                        </xsl:attribute>
				                    </arco:hasAgent>
				                </rdf:Description>
				                <rdf:Description>
				                    <xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Role/CatalogueRecordResponsible')" />
				                    </xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label xml:lang="it">
				                        <xsl:value-of select="'Ente responsabile della scheda catalografica'" />
				                    </rdfs:label>
				                    <rdfs:label xml:lang="en">
				                        <xsl:value-of select="'Responsible agency for catalogue record'" />
				                    </rdfs:label>
				                    <arco:isRoleOf>
				                    	<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-catalogue-record-responsible')" />
				                        </xsl:attribute>
				                    </arco:isRoleOf>
				                </rdf:Description>
				                <rdf:Description>
				                    <xsl:attribute name="rdf:about">
				                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./ACCE)))" />
				                    </xsl:attribute>
				                    <rdf:type>
				                        <xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
				                        </xsl:attribute>
				                    </rdf:type>
				                    <rdfs:label>
				                        <xsl:value-of select="normalize-space(./ACCE)" />
				                    </rdfs:label>
				                    <l0:name>
				                        <xsl:value-of select="normalize-space(./ACCE)" />
				                    </l0:name>
				                    <arco:isAgentOf>
				                    	<xsl:attribute name="rdf:resource">
				                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-catalogue-record-responsible')" />
				                        </xsl:attribute>
				                    </arco:isAgentOf>
				                </rdf:Description>
				             </xsl:if>
		                 </xsl:for-each>
		              </xsl:if>
            <!-- We add the cultural scope attribution as an individual. -->
            <xsl:for-each select="schede/*/AU/ATB">
                <rdf:Description>
                    <xsl:attribute name="rdf:about">
                        <xsl:value-of select="concat($NS, 'CulturalScopeAttribution/', $itemURI, '-cultural-scope-attribution-', position())" />
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
                    <xsl:if test="./ATBD and not(lower-case(normalize-space(./ATBD))='nr' or lower-case(normalize-space(./ATBD))='n.r.' or lower-case(normalize-space(./ATBD))='nr (recupero pregresso)')">
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
                <xsl:if test="./ATBD and not(lower-case(normalize-space(./ATBD))='nr' or lower-case(normalize-space(./ATBD))='n.r.' or lower-case(normalize-space(./ATBD))='nr (recupero pregresso)')">
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
            <xsl:for-each select="schede/*/AU/AUT | schede/F/AU/AUF">
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
                    <xsl:if test="../AUF/AUFK">
                    	<arco:specifications>
                    		<xsl:value-of select="../AUF/AUFK" />
                    	</arco:specifications>
                    </xsl:if>
                    <xsl:if test="./AUTN or ../AUF/AUFN or ../AUF/AUFB">
                        <culturaldefinition:hasAttributedAuthor>
                            <xsl:attribute name="rdf:resource">
                            	<xsl:variable name="author">
		                            <xsl:choose>
		                                <xsl:when test="./AUTA">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTN)), '-', arco-fn:urify(normalize-space(./AUTA)))" />
		                                </xsl:when>
		                                <xsl:when test="../AUF/AUFA and ../AUF/AUFN">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFN)), '-', arco-fn:urify(normalize-space(../AUF/AUFA)))" />
		                                </xsl:when>
		                                <xsl:when test="../AUF/AUFA and ../AUF/AUFB">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFB)), '-', arco-fn:urify(normalize-space(../AUF/AUFA)))" />
		                                </xsl:when>
		                                <xsl:when test="../AUF/AUFB">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFB)))" />
		                                </xsl:when>
		                                <xsl:when test="../AUF/AUFN">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFN)))" />
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
	                                <xsl:when test="../AUF/AUFS">
	                                    <xsl:value-of select="concat($author, '-', arco-fn:urify(normalize-space(../AUF/AUFS)))" />
	                                </xsl:when>
	                                <xsl:otherwise>
	                                    <xsl:value-of select="$author" />
	                                </xsl:otherwise>
	                            </xsl:choose>
                            </xsl:attribute>
                        </culturaldefinition:hasAttributedAuthor>
                    </xsl:if>
                    <xsl:if test="./AUTR or ../AUF/AUFR and not(lower-case(normalize-space(./AUTR))='nr' or lower-case(normalize-space(./AUTR))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTR))='n.r.' or lower-case(normalize-space(./AUTR))='nr [non rilevabile]' or lower-case(normalize-space(./AUTR))='n.r. (non rilevabile)' or lower-case(normalize-space(../AUF/AUFR))='nr' or lower-case(normalize-space(../AUF/AUFR))='nr (recupero pregresso)' or lower-case(normalize-space(../AUF/AUFR))='n.r.' or lower-case(normalize-space(../AUF/AUFR))='nr [non rilevabile]' or lower-case(normalize-space(../AUF/AUFR))='n.r. (non rilevabile)')">
                        <culturaldefinition:hasInterventionRole>
                           <xsl:attribute name="rdf:resource">
                            <xsl:choose>
                            	<xsl:when test="./AUTR">
                            		<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./AUTR)))" />
                            	</xsl:when>
                            	<xsl:otherwise>
                            		<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(../AUF/AUFR)))" />
                           		</xsl:otherwise>
                            </xsl:choose>
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
                    <xsl:if test="./AUTM or ../AUF/AUFM and not(lower-case(normalize-space(./AUTM))='nr' or lower-case(normalize-space(./AUTM))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTM))='n.r.' or lower-case(normalize-space(./AUTM))='n.r. [non rilevabile]' or lower-case(normalize-space(./AUTM))='n.r. (non rilevabile)' or lower-case(normalize-space(../AUF/AUFM))='nr' or lower-case(normalize-space(../AUF/AUFM))='nr (recupero pregresso)' or lower-case(normalize-space(../AUF/AUFM))='n.r.' or lower-case(normalize-space(../AUF/AUFM))='n.r. [non rilevabile]' or lower-case(normalize-space(../AUF/AUFM))='n.r. (non rilevabile)')">
                        <culturaldefinition:hasSource>
                            <xsl:attribute name="rdf:resource">
                            	<xsl:choose>
                            		<xsl:when test="./AUTM">
                            			<xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./AUTM)))" />
                            		</xsl:when>
                                	<xsl:otherwise>
                                		<xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../AUF/AUFM)))" />                         	
                                	</xsl:otherwise>
                            	</xsl:choose>
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
                <xsl:if test="./AUTM or ../AUF/AUFM and not(lower-case(normalize-space(./AUTM))='nr' or lower-case(normalize-space(./AUTM))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTM))='n.r.' or lower-case(normalize-space(./AUTM))='n.r. [non rilevabile]' or lower-case(normalize-space(./AUTM))='n.r. (non rilevabile)' or lower-case(normalize-space(../AUF/AUFM))='nr' or lower-case(normalize-space(../AUF/AUFM))='nr (recupero pregresso)' or lower-case(normalize-space(../AUF/AUFM))='n.r.' or lower-case(normalize-space(../AUF/AUFM))='n.r. [non rilevabile]' or lower-case(normalize-space(../AUF/AUFM))='n.r. (non rilevabile)')">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:choose>
                            		<xsl:when test="./AUTM">
                            			<xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./AUTM)))" />
                            		</xsl:when>
                                	<xsl:otherwise>
                                		<xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../AUF/AUFM)))" />                         	
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
                <xsl:if test="./AUTR or ../AUF/AUFR and not(lower-case(normalize-space(./AUTR))='nr' or lower-case(normalize-space(./AUTR))='nr (recupero pregresso)' or lower-case(normalize-space(./AUTR))='n.r.' or lower-case(normalize-space(./AUTR))='nr [non rilevabile]' or lower-case(normalize-space(./AUTR))='n.r. (non rilevabile)' or lower-case(normalize-space(../AUF/AUFR))='nr' or lower-case(normalize-space(../AUF/AUFR))='nr (recupero pregresso)' or lower-case(normalize-space(../AUF/AUFR))='n.r.' or lower-case(normalize-space(../AUF/AUFR))='nr [non rilevabile]' or lower-case(normalize-space(../AUF/AUFR))='n.r. (non rilevabile)')">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:choose>
                            	<xsl:when test="./AUTR">
                            		<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./AUTR)))" />
                            	</xsl:when>
                            	<xsl:otherwise>
                            		<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(../AUF/AUFR)))" />
                           		</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
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
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AUTN)), '-', arco-fn:urify(normalize-space(./AUTA)))" />
		                                </xsl:when>
		                                <xsl:when test="../AUF/AUFA and ../AUF/AUFN">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFN)), '-', arco-fn:urify(normalize-space(../AUF/AUFA)))" />
		                                </xsl:when>
		                                <xsl:when test="../AUF/AUFA and ../AUF/AUFB">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFB)), '-', arco-fn:urify(normalize-space(../AUF/AUFA)))" />
		                                </xsl:when>
		                                <xsl:when test="../AUF/AUFB">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFB)))" />
		                                </xsl:when>
		                                <xsl:when test="../AUF/AUFN">
		                                    <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(../AUF/AUFN)))" />
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
	                                <xsl:when test="../AUF/AUFS">
	                                    <xsl:value-of select="concat($author, '-', arco-fn:urify(normalize-space(../AUF/AUFS)))" />
	                                </xsl:when>
	                                <xsl:otherwise>
	                                    <xsl:value-of select="$author" />
	                                </xsl:otherwise>
	                            </xsl:choose>
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
                                    <xsl:when test="lower-case(normalize-space(./AUTP))='p'">
                                        <xsl:value-of select="'https://w3id.org/italia/onto/CPV/Person'" />
                                    </xsl:when>
                                    <xsl:when test="lower-case(normalize-space(./AUTP))='e'">
                                        <xsl:value-of select="'https://w3id.org/italia/onto/COV/Organization'" />
                                    </xsl:when>
                                    <xsl:when test="../AUF/AUFN">
                                        <xsl:value-of select="'https://w3id.org/italia/onto/CPV/Person'" />
                                    </xsl:when>
                                    <xsl:when test="../AUF/AUFB">
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
                        		<xsl:when test="./AUTN">
	                        		<xsl:choose>
		                                <xsl:when test="./AUTS">
		                                    <xsl:value-of select="concat(normalize-space(./AUTN), ' (', normalize-space(./AUTS), ')')" />
		                                </xsl:when>
		                                <xsl:otherwise>
		                                    <xsl:value-of select="normalize-space(./AUTN)" />
		                                </xsl:otherwise>
		                            </xsl:choose>
                        		</xsl:when>
                        		<xsl:when test="../AUF/AUFN">
	                        		<xsl:choose>
		                                <xsl:when test="../AUF/AUFS">
		                                	<xsl:value-of select="concat(normalize-space(./AUFN), ' (', normalize-space(./AUFS), ')')" />
		                                </xsl:when>
		                                <xsl:otherwise>
		                                    <xsl:value-of select="normalize-space(./AUFN)" />
		                                </xsl:otherwise>
		                            </xsl:choose>
                        		</xsl:when>
                        		<xsl:when test="../AUF/AUFB">
	                        		<xsl:choose>
		                                <xsl:when test="../AUF/AUFS">
		                                	<xsl:value-of select="concat(normalize-space(./AUFB), ' (', normalize-space(./AUFS), ')')" />
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
		                                    <xsl:value-of select="concat(normalize-space(./AUTN), ' (', normalize-space(./AUTS), ')')" />
		                                </xsl:when>
		                                <xsl:otherwise>
		                                    <xsl:value-of select="normalize-space(./AUTN)" />
		                                </xsl:otherwise>
		                            </xsl:choose>
                        		</xsl:when>
                        		<xsl:when test="../AUF/AUFN">
	                        		<xsl:choose>
		                                <xsl:when test="../AUF/AUFS">
		                                	<xsl:value-of select="concat(normalize-space(./AUFN), ' (', normalize-space(./AUFS), ')')" />
		                                </xsl:when>
		                                <xsl:otherwise>
		                                    <xsl:value-of select="normalize-space(./AUFN)" />
		                                </xsl:otherwise>
		                            </xsl:choose>
                        		</xsl:when>
                        		<xsl:when test="../AUF/AUFB">
	                        		<xsl:choose>
		                                <xsl:when test="../AUF/AUFS">
		                                	<xsl:value-of select="concat(normalize-space(./AUFB), ' (', normalize-space(./AUFS), ')')" />
		                                </xsl:when>
		                                <xsl:otherwise>
		                                    <xsl:value-of select="normalize-space(./AUFB)" />
		                                </xsl:otherwise>
	                           	 	</xsl:choose> 
                        		</xsl:when>
                        	</xsl:choose>
                        </l0:name>
                        <xsl:if test="./AUTA">
                            <culturaldefinition:authorDate>
                                <xsl:value-of select="normalize-space(./AUTA)" />
                            </culturaldefinition:authorDate>
                        </xsl:if>
                        <xsl:if test="../AUF/AUFA">
                            <culturaldefinition:authorDate>
                                <xsl:value-of select="normalize-space(../AUF/AUFA)" />
                            </culturaldefinition:authorDate>
                        </xsl:if>
                        <xsl:if test="./AUTH">
                            <culturaldefinition:authorLocalIdentifier>
                                <xsl:value-of select="normalize-space(./AUTH)" />
                            </culturaldefinition:authorLocalIdentifier>
                        </xsl:if>
                        <xsl:if test="../AUF/AUFH">
                            <culturaldefinition:authorLocalIdentifier>
                                <xsl:value-of select="normalize-space(../AUF/AUFH)" />
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
            <!-- inventory as an individual -->
            	<xsl:for-each select="schede/*/UB/INV">
            		<xsl:if test="./*">
            		<rdf:Description>
		            	<xsl:attribute name="rdf:about">
		            		<xsl:value-of select="concat($NS, 'Inventory/', $itemURI, '-', position())" />
		            	</xsl:attribute>
		            	<rdf:type>
                       		<xsl:attribute name="rdf:resource">
                            	<xsl:value-of select="'https://w3id.org/arco/subjective/Inventory'" />
                        	</xsl:attribute>
                   	 	</rdf:type>
                    	<rdfs:label xml:lang="en">
                    		<xsl:choose>
                    		<xsl:when test="./INVA">
                    			<xsl:value-of select="normalize-space(./INVA)" />
                    		</xsl:when>
                    		<xsl:otherwise>
                    			<xsl:value-of select="concat('Inventory ', normalize-space(./INVN), 'of cultural property: ', $itemURI)" />
                    		</xsl:otherwise>
                    			</xsl:choose>
                    	</rdfs:label>
                    	<rdfs:label xml:lang="it">
                    		<xsl:choose>
                    		<xsl:when test="./INVA">
                    			<xsl:value-of select="normalize-space(./INVA)" />
                    		</xsl:when>
                    		<xsl:otherwise>
                    			<xsl:value-of select="concat('Inventario ', normalize-space(./INVN), 'del bene culturale: ', $itemURI)" />
                    		</xsl:otherwise>
                    			</xsl:choose>
                    	</rdfs:label>
                    	<l0:name xml:lang="en">
                    		<xsl:choose>
                    		<xsl:when test="./INVA">
                    			<xsl:value-of select="normalize-space(./INVA)" />
                    		</xsl:when>
                    		<xsl:otherwise>
                    			<xsl:value-of select="concat('Inventory ', normalize-space(./INVN), ' of cultural property: ', $itemURI)" />
                    		</xsl:otherwise>
                    			</xsl:choose>
                    	</l0:name>
                    	<l0:name xml:lang="it">
                    		<xsl:choose>
                    		<xsl:when test="./INVA">
                    			<xsl:value-of select="normalize-space(./INVA)" />
                    		</xsl:when>
                    		<xsl:otherwise>
                    			<xsl:value-of select="concat('Inventario ', normalize-space(./INVN), ' del bene culturale: ', $itemURI)" />
                    		</xsl:otherwise>
                    			</xsl:choose>
                    	</l0:name>
                    	<xsl:if test="./INVC">
	                    	<culturaldefinition:inventoryLocation>
	                    		<xsl:value-of select="./INVC" />
	                    	</culturaldefinition:inventoryLocation>
	                    </xsl:if>
	                    <xsl:if test="./INVD">
	                    	<tiapit:date>
	                    		<xsl:value-of select="./INVD" />
	                    	</tiapit:date>
	                    </xsl:if>
	                    <xsl:if test="./INVS">
	                    	<arco:note>
	                    		<xsl:value-of select="./INVS" />
	                    	</arco:note>
	                    </xsl:if>
                    	<culturaldefinition:inventoryIdentifier>
                    		<xsl:value-of select="./INVN" />
                    	</culturaldefinition:inventoryIdentifier>
                    	<!-- responsible of inventory identifier -->
                    	<xsl:if test="./INVG">
                    		<arco:hasAgentRole>
                        		<xsl:attribute name="rdf:resource">
                            		<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-inventory-identifier-responsible')" />
                        		</xsl:attribute>
                    		</arco:hasAgentRole>
                    		<culturaldefinition:hasInventoryIdentifierResponsible>
                        		<xsl:attribute name="rdf:resource">
                            		<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./INVG)))" />
                        		</xsl:attribute>
                    		</culturaldefinition:hasInventoryIdentifierResponsible>
                		</xsl:if>
            		</rdf:Description>
            		<!-- agent role for responsible of inventory identifier -->
	            	<xsl:if test="./INVG">
		                <rdf:Description>
		                    <xsl:attribute name="rdf:about">
		                        <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-inventory-identifier-responsible')" />
		                    </xsl:attribute>
		                    <rdf:type>
		                        <xsl:attribute name="rdf:resource">
		                            <xsl:value-of select="'https://w3id.org/arco/core/AgentRole'" />
		                        </xsl:attribute>
		                    </rdf:type>
		                    <rdfs:label xml:lang="it">
		                        <xsl:value-of select="concat('Responsabile del numero di inventario del bene ', $itemURI, ': ', normalize-space(./INVG))" />
		                    </rdfs:label>
		                    <rdfs:label xml:lang="en">
		                        <xsl:value-of select="concat('Responsible for inventory identifier of cultural property ', $itemURI, ': ', normalize-space(./INVG))" />
		                    </rdfs:label>
		                    <arco:hasRole>
		                        <xsl:attribute name="rdf:resource">
		                            <xsl:value-of select="concat($NS, 'Role/InventoryIdentifierResponsible')" />
		                        </xsl:attribute>
		                    </arco:hasRole>
		                    <arco:hasAgent>
		                        <xsl:attribute name="rdf:resource">
		                            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./INVG)))" />
		                        </xsl:attribute>
		                    </arco:hasAgent>
		                </rdf:Description>
		                <rdf:Description>
		                    <xsl:attribute name="rdf:about">
		                        <xsl:value-of select="concat($NS, 'Role/InventoryIdentifierResponsible')" />
		                    </xsl:attribute>
		                    <rdf:type>
		                        <xsl:attribute name="rdf:resource">
		                            <xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
		                        </xsl:attribute>
		                    </rdf:type>
		                    <rdfs:label xml:lang="it">
		                        <xsl:value-of select="'Responsabile del numero di inventario'" />
		                    </rdfs:label>
		                    <rdfs:label xml:lang="en">
		                        <xsl:value-of select="'Inventory Identifier Responsible'" />
		                    </rdfs:label>
		                    <arco:isRoleOf>
		                    	<xsl:attribute name="rdf:resource">
		                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-inventory-identifier-responsible')" />
		                        </xsl:attribute>
		                    </arco:isRoleOf>
		                </rdf:Description>
		                <rdf:Description>
		                    <xsl:attribute name="rdf:about">
		                        <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./INVG)))" />
		                    </xsl:attribute>
		                    <rdf:type>
		                        <xsl:attribute name="rdf:resource">
		                            <xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
		                        </xsl:attribute>
		                    </rdf:type>
		                    <rdfs:label>
		                        <xsl:value-of select="normalize-space(./INVG)" />
		                    </rdfs:label>
		                    <l0:name>
		                        <xsl:value-of select="normalize-space(./INVG)" />
		                    </l0:name>
		                    <arco:isAgentOf>
		                    	<xsl:attribute name="rdf:resource">
		                            <xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, '-inventory-identifier-responsible')" />
		                        </xsl:attribute>
		                    </arco:isAgentOf>
		                </rdf:Description>
		             </xsl:if>
            		</xsl:if>
            	</xsl:for-each>
            	<!-- commission as an individual -->
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
            <xsl:for-each select="schede/*/AU/AAT | schede/F/AU/AAF">
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
		                            <!-- alternative authorship attribution in F 3.00 -->
		                            <xsl:when test="../AAF/AAFN">
		                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AAFN)))" />
		                            </xsl:when>
		                            <!-- alternative authorship attribution in F 3.00 -->
		                            <xsl:when test="../AAF/AAFB">
		                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AAFB)))" />
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
                    <xsl:if test="./AATM or ../AAF/AAFM and not(lower-case(normalize-space(./AATM))='nr' or lower-case(normalize-space(./AATM))='nr (recupero pregresso)' or lower-case(normalize-space(./AATM))='n.r.' or lower-case(normalize-space(./AATM))='n.r. (non rilevabile)' or lower-case(normalize-space(./AATM))='n.r. [non rilevabile]' or lower-case(normalize-space(../AAF/AAFM))='nr' or lower-case(normalize-space(../AAF/AAFM))='nr (recupero pregresso)' or lower-case(normalize-space(../AAF/AAFM))='n.r.' or lower-case(normalize-space(../AAF/AAFM))='n.r. (non rilevabile)' or lower-case(normalize-space(../AAF/AAFM))='n.r. [non rilevabile]')">
                        <culturaldefinition:hasSource>
                            <xsl:attribute name="rdf:resource">
                            <xsl:choose>
                            	<xsl:when test="./AATM">
                            		<xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./AATM)))" />
                            	</xsl:when>
                            	<xsl:otherwise>
                            		<xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../AAF/AAFM)))" />
                            	</xsl:otherwise>
                            </xsl:choose>
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
	                            <xsl:when test="../AAF/AAFN">
	                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AAFN)))" />
	                            </xsl:when>
	                            <xsl:when test="../AAF/AAFB">
		                                <xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./AAFB)))" />
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
                        <culturaldefinition:authorDate>
                            <xsl:value-of select="normalize-space(./AATA)" />
                        </culturaldefinition:authorDate>
                    </xsl:if>
                </rdf:Description>
                <xsl:if test="./AATM or ../AAF/AAFM and not(lower-case(normalize-space(./AATM))='nr' or lower-case(normalize-space(./AATM))='nr (recupero pregresso)' or lower-case(normalize-space(./AATM))='n.r.' or lower-case(normalize-space(./AATM))='n.r. (non rilevabile)' or lower-case(normalize-space(./AATM))='n.r. [non rilevabile]' or lower-case(normalize-space(../AAF/AAFM))='nr' or lower-case(normalize-space(../AAF/AAFM))='nr (recupero pregresso)' or lower-case(normalize-space(../AAF/AAFM))='n.r.' or lower-case(normalize-space(../AAF/AAFM))='n.r. (non rilevabile)' or lower-case(normalize-space(../AAF/AAFM))='n.r. [non rilevabile]')">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                       	 <xsl:choose>
                        	<xsl:when test="./AATM">
                            	<xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(./AATM)))" />
                            </xsl:when>
                            <xsl:otherwise>
                            	<xsl:value-of select="concat($NS, 'Source/', arco-fn:urify(normalize-space(../AAF/AAFM)))" />                      
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
                            <xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, '-collection-membership-', position())" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/subjective/CollectionMembership'" />
                            </xsl:attribute>
                        </rdf:type>
                        <culturaldefinition:hasCulturalProperty>
                        	<xsl:attribute name="rdf:resource">
                        		<xsl:value-of select="concat($NS, arco-fn:local-name(arco-fn:getSpecificPropertyType($sheetType)), '/', $itemURI)" />
                        	</xsl:attribute>
                        </culturaldefinition:hasCulturalProperty>
                        <culturaldefinition:hasCollection>
                        	<xsl:attribute name="rdf:resource">
                        		<xsl:value-of select="concat($NS, 'CollectionOfCulturalEntities/', arco-fn:urify(normalize-space(./COLD)))" />
                        	</xsl:attribute>
                        </culturaldefinition:hasCollection>
                        <xsl:if test="./COLM">
                        	<culturaldefinition:leavingReason>
                        		<xsl:value-of select="./COLM" />
                        	</culturaldefinition:leavingReason>
                        </xsl:if>
                        <xsl:if test="./COLI">
                        	<culturaldefinition:collectionUnitIdentifier>
                        		<xsl:value-of select="./COLI" />
                        	</culturaldefinition:collectionUnitIdentifier>
                        </xsl:if>
                        <xsl:if test="./COLV">
                        	<culturaldefinition:culturalPropertyValue>
                        		<xsl:value-of select="./COLV" />
                        	</culturaldefinition:culturalPropertyValue>
                        </xsl:if>
                        <xsl:if test="./COLU or ./COLA">
                        	<tiapit:atTime>
                        		<xsl:attribute name="rdf:resource">
                        		<xsl:choose>
                        			<xsl:when test="./COLU and ./COLA">
                        				<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLA)), '-', arco-fn:urify(normalize-space(./COLU)))" />
                        			</xsl:when>
                        			<xsl:when test="./COLU">
                        				<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLU)))" />
                        			</xsl:when>
                        			<xsl:when test="./COLA">
                        				<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLA)))" />
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
                        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLA)), '-', arco-fn:urify(normalize-space(./COLU)))" />
                        	</xsl:when>
                        	<xsl:when test="./COLU">
                        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLU)))" />
                        	</xsl:when>
                        	<xsl:when test="./COLA">
                        		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(./COLA)))" />
                        	</xsl:when>
                        	</xsl:choose>
                    </xsl:attribute>
                    <rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInteval'" />
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
                		<xsl:value-of select="concat($NS, 'CollectionOfCulturalEntities/', arco-fn:urify(normalize-space(./COLD)))" />
                	</xsl:attribute>
                	<rdf:type>
                        <xsl:attribute name="rdf:resource">
                            <xsl:value-of select="'http://dati.beniculturali.it/cis/CollectionOfCulturalEntities'" />
                        </xsl:attribute>
                    </rdf:type>
                    <rdfs:label xml:lang="it">
                    	<xsl:choose>
                    	<xsl:when test="./COLD">
                    		<xsl:value-of select="./COLD" />
                    	</xsl:when>
                    	<xsl:otherwise>
                    		<xsl:value-of select="concat('Collezione contenente il bene: ', $itemURI)" />
                    	</xsl:otherwise>
                    	</xsl:choose>
                    </rdfs:label>
                    <l0:name xml:lang="it">
                    	<xsl:choose>
                    	<xsl:when test="./COLD">
                    		<xsl:value-of select="./COLD" />
                    	</xsl:when>
                    	<xsl:otherwise>
                    		<xsl:value-of select="concat('Collezione contenente il bene: ', $itemURI)" />
                    	</xsl:otherwise>
                    	</xsl:choose>
                    </l0:name>
                    <rdfs:label xml:lang="en">
                    	<xsl:choose>
                    	<xsl:when test="./COLD">
                    		<xsl:value-of select="./COLD" />
                    	</xsl:when>
                    	<xsl:otherwise>
                    		<xsl:value-of select="concat('Collection with cultural property: ', $itemURI)" />
                    	</xsl:otherwise>
                    	</xsl:choose>
                    </rdfs:label>
                    <l0:name xml:lang="en">
                    	<xsl:choose>
                    	<xsl:when test="./COLD">
                    		<xsl:value-of select="./COLD" />
                    	</xsl:when>
                    	<xsl:otherwise>
                    		<xsl:value-of select="concat('Collection with cultural property: ', $itemURI)" />
                    	</xsl:otherwise>
                    	</xsl:choose>
                    </l0:name>
                    <culturaldefinition:isCollectionIn>
                    	<xsl:attribute name="rdf:resource">
                    		<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI, '-collection-membership-', position())" />
                    	</xsl:attribute>
                    </culturaldefinition:isCollectionIn>
                    <xsl:if test="./COLS">
                    	<arco:note>
                    		<xsl:value-of select="normalize-space(./COLS)" />
                    	</arco:note>
                    </xsl:if>
                    <xsl:if test="./COLC or ./COLN">
                    	<culturaldefinition:hasCollector>
                    		<xsl:attribute name="rdf:resource">
                    			<xsl:choose>
                    				<xsl:when test="./COLC">
                    					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./COLC)))" />
                    				</xsl:when>
                    				<xsl:otherwise>
                    					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./COLN)))" />
                    				</xsl:otherwise>
                    			</xsl:choose>
                    		</xsl:attribute>
                    	</culturaldefinition:hasCollector>
                    </xsl:if>
                </rdf:Description>
                <!-- collector of collection of cultural entities -->
                <xsl:if test="./COLC or ./COLN">
                <rdf:Description>	
                	<xsl:attribute name="rdf:about">
                		<xsl:choose>
                    		<xsl:when test="./COLC">
                    			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./COLC)))" />
                    		</xsl:when>
                    		<xsl:otherwise>
                    			<xsl:value-of select="concat($NS, 'Agent/', arco-fn:urify(normalize-space(./COLN)))" />
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
                        <culturaldefinition:isCollectorOf>
                        	<xsl:value-of select="concat($NS, 'CollectionOfCulturalEntities/', arco-fn:urify(normalize-space(./COLD)))" />
                        </culturaldefinition:isCollectorOf>                
                </rdf:Description>
                </xsl:if>
            </xsl:if>
	        </xsl:for-each>
            <!-- conservation status -->
            <xsl:for-each select="schede/*/CO/STC">
                <xsl:if test="./*">
                    <rdf:Description>
                        <xsl:attribute name="rdf:about">
                            <xsl:value-of select="concat($NS, 'ConservationStatus/', $itemURI, '-conservation-status-', position())" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/objective/ConservationStatus'" />
                            </xsl:attribute>
                        </rdf:type>
                        <xsl:if test="./STCC and not(lower-case(normalize-space(./STCC))='nr' or lower-case(normalize-space(./STCC))='n.r.' or lower-case(normalize-space(./STCC))='nr (recupero pregresso)')">
                        <cpdescription:hasConservationStatusType>
                            <xsl:attribute name="rdf:resource">
                                <xsl:choose>
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
                                    <xsl:when test="./STCC">
                                        <xsl:value-of select="concat($NS, 'ConservationStatusType/', arco-fn:urify(normalize-space(./STCC)))" />
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </cpdescription:hasConservationStatusType>
                        </xsl:if>
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
                    <xsl:if test="./STCC and not(lower-case(normalize-space(./STCC))='nr' or lower-case(normalize-space(./STCC))='n.r.' or lower-case(normalize-space(./STCC))='nr (recupero pregresso)')">
                    <xsl:choose>
                        <xsl:when test="lower-case(normalize-space(./STCC))='buono' or lower-case(normalize-space(./STCC))='buonoe' or lower-case(normalize-space(./STCC))='buona'" />
                        <xsl:when test="lower-case(normalize-space(./STCC))='mediocre'" />
                        <xsl:when test="lower-case(normalize-space(./STCC))='discreto' or lower-case(normalize-space(./STCC))='discreta'" />
                        <xsl:when test="lower-case(normalize-space(./STCC))='cattivo' or lower-case(normalize-space(./STCC))='cattiva'" />
                        <xsl:when test="lower-case(normalize-space(./STCC))='dato non disponibile'" />
                        <xsl:when test="./STCC">
                            <rdf:Description>
                                <xsl:attribute name="rdf:about">
                                    <xsl:value-of select="concat($NS, 'ConservationStatusType/', arco-fn:urify(normalize-space(./STCC)))" />
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
                    <xsl:if test="schede/*/LC/PVC/PVCV and not(lower-case(normalize-space(schede/*/LC/PVC/PVCV))='nr' or lower-case(normalize-space(schede/*/LC/PVC/PVCV))='n.r.' or lower-case(normalize-space(schede/*/LC/PVC/PVCV))='nr (recupero pregresso)' or lower-case(normalize-space(schede/*/LC/PVC/PVCV))='.' or lower-case(normalize-space(schede/*/LC/PVC/PVCV))='-')">
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
                                        <xsl:value-of select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./TLC)))" />
                                    </xsl:when>
                                    <xsl:when test="./TCL">
                                        <xsl:variable name="tcl" select="normalize-space(./TCL)" />
                                        <xsl:value-of select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./TCL)))" />
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
                    <!-- hasCircumstance for Shot Location (F) -->
                    <xsl:if test="../../F/LR/LRO">
                        <culturaldefinition:hasCircumstance>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(../../F/LR/LRO)))" />
                            </xsl:attribute>
                        </culturaldefinition:hasCircumstance>
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
                                    <xsl:value-of select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./TLC)))" />
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
                                    <xsl:value-of select="concat($NS, 'LocationType/', arco-fn:urify(normalize-space(./TCL)))" />
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
                            <xsl:value-of select="concat($NS, 'Circumstance/', arco-fn:urify(normalize-space(../../F/LR/LRO)))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/arco/subjective/Circumstance'" />
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
                <xsl:if test="./PRC/PRCC and not(lower-case(normalize-space(./PRC/PRCC))='nr' or lower-case(normalize-space(./PRC/PRCC))='n.r.' or lower-case(normalize-space(./PRC/PRCC))='nr (recupero pregresso)')">
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
                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
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
                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
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
                            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(schede/*/LC/PVC/PVCR))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
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
                            <xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(schede/*/LC/PVC/PVCP))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
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
                            <xsl:value-of select="concat($NS, 'City/', arco-fn:urify(schede/*/LC/PVC/PVCC))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
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
                            <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(schede/*/LC/PVC/PVCL))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
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
                            <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(schede/*/LC/PVC/PVCE))" />
                        </xsl:attribute>
                        <rdf:type>
                            <xsl:attribute name="rdf:resource">
                                <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
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
                            <xsl:if test="schede/*/LC/LDC/LDCC and not(lower-case(normalize-space(schede/*/LC/LDC/LDCC))='nr' or lower-case(normalize-space(schede/*/LC/LDC/LDCC))='n.r.' or lower-case(normalize-space(schede/*/LC/LDC/LDCC))='nr (recupero pregresso)')">
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
                                <rdfs:label xml:lang="it">
                                <xsl:choose>
                                	<xsl:when test="schede/*/LC/LDC/LDCQ">
                                    	<xsl:value-of select="concat('Tipo di contenitore fisico:', ' ', normalize-space(schede/*/LC/LDC/LDCT), ' ', normalize-space(schede/*/LC/LDC/LDCQ))" />
                                	</xsl:when>
                                	<xsl:otherwise>
                                		<xsl:value-of select="concat('Tipo di contenitore fisico:', ' ', normalize-space(schede/*/LC/LDC/LDCT))" />
                                	</xsl:otherwise>
                                </xsl:choose>
                                </rdfs:label>
                                <l0:name xml:lang="it">
                                    <xsl:choose>
                                	<xsl:when test="schede/*/LC/LDC/LDCQ">
                                    	<xsl:value-of select="concat('Tipo di contenitore fisico:', ' ', normalize-space(schede/*/LC/LDC/LDCT), ' ', normalize-space(schede/*/LC/LDC/LDCQ))" />
                                	</xsl:when>
                                	<xsl:otherwise>
                                		<xsl:value-of select="concat('Tipo di contenitore fisico:', ' ', normalize-space(schede/*/LC/LDC/LDCT))" />
                                	</xsl:otherwise>
                                </xsl:choose>
                                </l0:name>
                                <rdfs:label xml:lang="en">
                                <xsl:choose>
                                	<xsl:when test="schede/*/LC/LDC/LDCQ">
                                    	<xsl:value-of select="concat('Site type:', ' ', normalize-space(schede/*/LC/LDC/LDCT), ' ', normalize-space(schede/*/LC/LDC/LDCQ))" />
                                	</xsl:when>
                                	<xsl:otherwise>
                                		<xsl:value-of select="concat('Site type:', ' ', normalize-space(schede/*/LC/LDC/LDCT))" />
                                	</xsl:otherwise>
                                </xsl:choose>
                                </rdfs:label>
                                <l0:name xml:lang="en">
                                    <xsl:choose>
                                	<xsl:when test="schede/*/LC/LDC/LDCQ">
                                    	<xsl:value-of select="concat('Site type:', ' ', normalize-space(schede/*/LC/LDC/LDCT), ' ', normalize-space(schede/*/LC/LDC/LDCQ))" />
                                	</xsl:when>
                                	<xsl:otherwise>
                                		<xsl:value-of select="concat('Site type:', ' ', normalize-space(schede/*/LC/LDC/LDCT))" />
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
                        <xsl:if test="schede/*/LC/LDC/LDCC and not(lower-case(normalize-space(schede/*/LC/LDC/LDCC))='nr' or lower-case(normalize-space(schede/*/LC/LDC/LDCC))='n.r.' or lower-case(normalize-space(schede/*/LC/LDC/LDCC))='nr (recupero pregresso)')">
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
                                <rdfs:label xml:lang="it">
                                    <xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(schede/*/LC/LDC/LDCM))" />
                                </rdfs:label>
                                <l0:name xml:lang="it">
                                    <xsl:value-of select="concat('Denominazione nel tempo: ', normalize-space(schede/*/LC/LDC/LDCM))" />
                                </l0:name>
                                <rdfs:label xml:lang="en">
                                    <xsl:value-of select="concat('Name in time: ', normalize-space(schede/*/LC/LDC/LDCM))" />
                                </rdfs:label>
                                <l0:name xml:lang="en">
                                    <xsl:value-of select="concat('Name in time: ', normalize-space(schede/*/LC/LDC/LDCM))" />
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
                                        <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
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
                                <xsl:if test="./PRC/PRCC and not(lower-case(normalize-space(./PRC/PRCC))='nr' or lower-case(normalize-space(./PRC/PRCC))='n.r.' or lower-case(normalize-space(./PRC/PRCC))='nr (recupero pregresso)')">
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
                                    <rdfs:label xml:lang="it">
                                    	<xsl:choose>
                                            <xsl:when test="./PRC/PRCQ">
                                                <xsl:value-of select="concat('Tipo di contenitore fisico: ', normalize-space(./PRC/PRCT), ' ', normalize-space(./PRC/PRCQ))" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="concat('Tipo di contenitore fisico: ', normalize-space(./PRC/PRCT))" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </rdfs:label>
                                        <l0:name xml:lang="it">
                                            <xsl:choose>
                                            <xsl:when test="./PRC/PRCQ">
                                                <xsl:value-of select="concat('Tipo di contenitore fisico: ', normalize-space(./PRC/PRCT), ' ', normalize-space(./PRC/PRCQ))" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="concat('Tipo di contenitore fisico: ', normalize-space(./PRC/PRCT))" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        </l0:name>
                                        <rdfs:label xml:lang="en">
                                    	<xsl:choose>
                                            <xsl:when test="./PRC/PRCQ">
                                                <xsl:value-of select="concat('Site type: ', normalize-space(./PRC/PRCT), ' ', normalize-space(./PRC/PRCQ))" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="concat('Site type: ', normalize-space(./PRC/PRCT))" />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </rdfs:label>
                                        <l0:name xml:lang="en">
                                            <xsl:choose>
                                            <xsl:when test="./PRC/PRCQ">
                                                <xsl:value-of select="concat('Site type: ', normalize-space(./PRC/PRCT), ' ', normalize-space(./PRC/PRCQ))" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="concat('Site type: ', normalize-space(./PRC/PRCT))" />
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
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
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
                            <!-- Valentina - unfixed bug: it doesn't generate the resource ToponymInTime for LRL or LRCF (tested on ICCD8532322.xml -->
                            <xsl:if test="../../F/LR/LRL">
                                <rdf:Description>
                                    <xsl:attribute name="rdf:about">
                                       <xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(../../F/LR/LRL)))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/arco/location/ToponymInTime'" />
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
                                       <xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(../../F/LR/LRC/LRCF)))" />
                                    </xsl:attribute>
                                    <rdf:type>
                                        <xsl:attribute name="rdf:resource">
                                            <xsl:value-of select="'https://w3id.org/arco/location/ToponymInTime'" />
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
                                    </xsl:if> 
                            </rdf:Description>
                            <!-- Continent as individual -->
                            <xsl:if test="./PRT/PRTK">
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
                                            <xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
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
                        <!-- I tried this choose with test on variable $sheetVersion, but it doesn't work -->
                        	<xsl:choose>
                        		<xsl:when test="$sheetVersion='3.01_ICCD0' or $sheetVersion='3.01'">
		                           <culturalevent:eventTimeLocation>
	                            		<xsl:value-of select="normalize-space(.)" />
	                        		</culturalevent:eventTimeLocation>
                            	</xsl:when>
	                            <xsl:otherwise>
	                            <arco:hasLocation>
		                               <xsl:attribute name="rdf:resource">
		                                   <xsl:value-of select="concat($NS, 'GeographicalFeature/', arco-fn:urify(normalize-space(.)))" />
		                               </xsl:attribute>
		                           </arco:hasLocation>
	                            </xsl:otherwise>
                           	</xsl:choose>
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