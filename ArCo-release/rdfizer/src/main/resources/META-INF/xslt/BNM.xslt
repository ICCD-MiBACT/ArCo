<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-catalogue="https://w3id.org/arco/ontology/catalogue/"
	xmlns:arco-spe="https://w3id.org/arco/ontology/natural-specimen-description/"
	xmlns:cis="http://dati.beniculturali.it/cis/"
	xmlns:clvapit="https://w3id.org/italia/onto/CLV/"
	xmlns:smapit="https://w3id.org/italia/onto/SM/"
	xmlns:arco-dd="https://w3id.org/arco/ontology/denotative-description/"
	xmlns:arco-cd="https://w3id.org/arco/ontology/context-description/"
	xmlns:arco-ce="https://w3id.org/arco/ontology/cultural-event/"
	xmlns:dcterms="http://purl.org/dc/terms/creator"
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
	xmlns:ar-TechnicalStatus="https://w3id.org/arco/resource/TechnicalStatus/"
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

	xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="2.0"
	exclude-result-prefixes="xsl php">
	<xsl:output method="xml" encoding="utf-8" indent="yes" />

	<xsl:param name="NS" />
	<!-- xsl:variable name="NS"	select="$NS,''" /-->
	
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
	
	<xsl:variable name="sheetVersion" select="record/metadata/schede/*/@version" />
	<xsl:variable name="sheetType" select="name(record/metadata/schede/*[1])" />
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
	<xsl:template name="address-area">
		<xsl:param name="ctx" />
		<xsl:for-each select="record/metadata/schede/*/LR/LRV">
			<xsl:element name="rdf:Description">
				<xsl:choose>
					<xsl:when test="LRVS[not(lower-case(normalize-space())='italia')]">
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(LRVK), normalize-space(LRVS), normalize-space(LRVP), normalize-space(LRVR), normalize-space(LRVC), normalize-space(LRVL), normalize-space(LRVE))))" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:about">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(LRVP), normalize-space(LRVC), normalize-space(LRVL))))" />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
				<clvapit:hasAddressArea>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space($ctx)))" />
					</xsl:attribute>
				</clvapit:hasAddressArea>
			</xsl:element>
		</xsl:for-each>
		<xsl:element name="rdf:Description">
			<xsl:attribute name="rdf:about">
                <xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space($ctx)))" />
	            </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                    <xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text" select="normalize-space($ctx)" />
				</xsl:call-template>
			</rdfs:label>
			<l0:name>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text" select="normalize-space($ctx)" />
				</xsl:call-template>
			</l0:name>
		</xsl:element>
	</xsl:template>
	<xsl:variable name="aco">
		<xsl:if test="record/metadata/schede/*/AC/ACO">
			<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/AC/ACO)" />
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="acm">
		<xsl:if test="record/metadata/schede/*/AC/ACM">
			<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/AC/ACM)" />
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="ldcm" select="arco-fn:urify(record/metadata/schede/*/LC/LDC/LDCM)"></xsl:variable>
	<xsl:variable name="pvcc" select="arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCC)"></xsl:variable>
	<xsl:variable name="ecp" select="arco-fn:urify(record/metadata/schede/*/CD/ECP)"></xsl:variable>
	<xsl:variable name="ogtc">
		<xsl:if test="record/metadata/schede/*/OG/OGT/OGTC">				
			<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/OG/OGT/OGTC)" />
		</xsl:if>
	</xsl:variable>	
	<xsl:variable name="specimencollection">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/AC/ACO">				
				<xsl:value-of select="concat($NS, 'SpecimenCollection/', $acm, '-', $aco)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/LC/LDC/LDCM">
				<xsl:value-of select="concat($NS, 'SpecimenCollection/', $ldcm, '-', $pvcc)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($NS, 'SpecimenCollection/', $ecp, '-', $ogtc)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="chronostratigraphicClassBNM">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/IM/IMG/IMGC">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGC)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IM/IMG/IMGS">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGS)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IM/IMG/IMGT">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGT)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IM/IMG/IMGO">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGO)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IM/IMG/IMGP">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGP)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IM/IMG/IMGR">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGR)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGE)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="chronostratigraphicClassBNPE">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/IR/IRG/IRGC">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGC)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IR/IRG/IRGS">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGS)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IR/IRG/IRGT">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGT)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IR/IRG/IRGO">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGO)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IR/IRG/IRGP">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGP)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IR/IRG/IRGR">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGR)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGE)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="chronostratigraphicClassBNP">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/ET/ETG/ETGC">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGC)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/ET/ETG/ETGS">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGS)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/ET/ETG/ETGT">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGT)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/ET/ETG/ETGO">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGO)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/ET/ETG/ETGP">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGP)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/ET/ETG/ETGR">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGR)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGE)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lithostratigraphicClassBNM">
		<xsl:if test="record/metadata/schede/*/IM/IML/IMLO or record/metadata/schede/*/IM/IML/IMLL or record/metadata/schede/*/IM/IML/IMLM or record/metadata/schede/*/IM/IML/IMLF or record/metadata/schede/*/IM/IML/IMLG or record/metadata/schede/*/IM/IML/IMLS or record/metadata/schede/*/IM/IML/IMLC">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/IM/IML/IMLO">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IML/IMLO)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IM/IML/IMLL">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IML/IMLL)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IM/IML/IMLM">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IML/IMLM)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IM/IML/IMLF">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IML/IMLF)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IM/IML/IMLG">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IML/IMLG)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IM/IML/IMLS">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IML/IMLS)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IM/IML/IMLC">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IM/IML/IMLC)" />
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="lithostratigraphicClassBNPE">
		<xsl:if test="record/metadata/schede/*/IR/IRL/IRLO or record/metadata/schede/*/IR/IRL/IRLL or record/metadata/schede/*/IR/IRL/IRLM or record/metadata/schede/*/IR/IRL/IRLF or record/metadata/schede/*/IR/IRL/IRLG or record/metadata/schede/*/IR/IRL/IRLS or record/metadata/schede/*/IR/IRL/IRLC">
		<xsl:choose>
			<xsl:when test="record/metadata/schede/*/IR/IRL/IRLO">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLO)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IR/IRL/IRLL">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLL)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IR/IRL/IRLM">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLM)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IR/IRL/IRLF">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLF)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IR/IRL/IRLG">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLG)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IR/IRL/IRLS">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLS)" />
			</xsl:when>
			<xsl:when test="record/metadata/schede/*/IR/IRL/IRLC">				
				<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLC)" />
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
		</xsl:if>
	</xsl:variable>
	<xsl:variable name="lithostratigraphicClassBNP">
		<xsl:if test="record/metadata/schede/*/ET/ETL/ETLO or record/metadata/schede/*/ET/ETL/ETLL or record/metadata/schede/*/ET/ETL/ETLM or record/metadata/schede/*/ET/ETL/ETLF or record/metadata/schede/*/ET/ETL/ETLG or record/metadata/schede/*/ET/ETL/ETLS or record/metadata/schede/*/ET/ETL/ETLC">
			<xsl:choose>
				<xsl:when test="record/metadata/schede/*/ET/ETL/ETLO">				
					<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLO)" />
				</xsl:when>
				<xsl:when test="record/metadata/schede/*/ET/ETL/ETLL">				
					<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLL)" />
				</xsl:when>
				<xsl:when test="record/metadata/schede/*/ET/ETL/ETLM">				
					<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLM)" />
				</xsl:when>
				<xsl:when test="record/metadata/schede/*/ET/ETL/ETLF">				
					<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLF)" />
				</xsl:when>
				<xsl:when test="record/metadata/schede/*/ET/ETL/ETLG">				
					<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLG)" />
				</xsl:when>
				<xsl:when test="record/metadata/schede/*/ET/ETL/ETLS">				
					<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLS)" />
				</xsl:when>
				<xsl:when test="record/metadata/schede/*/ET/ETL/ETLC">				
					<xsl:value-of select="arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLC)" />
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:variable>
<xsl:template match="/">
	<rdf:RDF>
	<!-- Properties of MineralHeritage -->
	<rdf:Description>
		<xsl:attribute name="rdf:about">
        	<xsl:value-of select="$culturalProperty" />
		</xsl:attribute>
		<xsl:if test="$sheetType='BNM'">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MineralHeritage'" />
				</xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="not($sheetType='BNB')">
			<xsl:if test="record/metadata/schede/*/AC/ACK">
				<arco-lite:localIdentifier>
               		<xsl:value-of select="record/metadata/schede/*/AC/ACK" />
				</arco-lite:localIdentifier>
				<arco-core:hasIdentifier>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'SpecimenIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/*/AC/ACK))" />
					</xsl:attribute>
				</arco-core:hasIdentifier>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$sheetType='BNM' or $sheetType='BNPE' or $sheetType='BNPL' or $sheetType='BNZ'">
			<xsl:variable name="aco" select="arco-fn:urify(record/metadata/schede/*/AC/ACO)"></xsl:variable>
			<xsl:variable name="acm" select="arco-fn:urify(record/metadata/schede/*/AC/ACM)"></xsl:variable>
			<xsl:variable name="ldcm" select="arco-fn:urify(record/metadata/schede/*/LC/LDC/LDCM)"></xsl:variable>
			<xsl:variable name="pvcc" select="arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCC)"></xsl:variable>
			<xsl:variable name="ecp" select="record/metadata/schede/*/CD/ECP"></xsl:variable>
			<xsl:variable name="ogtc" select="record/metadata/schede/*/OG/OGT/OGTC"></xsl:variable>		
			<xsl:if test="record/metadata/schede/*/AC/ACO or record/metadata/schede/*/LC/LDC/LDCM or record/metadata/schede/*/OG/OGT/OGTC">
			<arco-cd:isMemberInvolvedIn>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI)" />
				</xsl:attribute>
			</arco-cd:isMemberInvolvedIn>
			</xsl:if>
			<arco-lite:isCollectionMemberOf>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="$specimencollection" />
				</xsl:attribute>
			</arco-lite:isCollectionMemberOf>
		</xsl:if>
		<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A' or $sheetType='BNB')">
			<xsl:if test="record/metadata/schede/*/LR or record/metadata/schede/*/IM or record/metadata/schede/*/IR or record/metadata/schede/*/ET">
				<arco-location:hasTimeIndexedTypedLocation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-collecting-location')" />
					</xsl:attribute>
				</arco-location:hasTimeIndexedTypedLocation>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IMG">
			<arco-location:hasFindingStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasFindingStratum>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IML">
			<arco-location:hasFindingStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasFindingStratum>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRG">
			<arco-location:hasFindingStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasFindingStratum>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRL">
			<arco-location:hasFindingStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasFindingStratum>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETG">
			<arco-location:hasFindingStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasFindingStratum>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETL">
			<arco-location:hasFindingStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasFindingStratum>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IMA/IMAS">
			<arco-location:hasFindingStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasFindingStratum>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRA/IRAS">
			<arco-location:hasFindingStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasFindingStratum>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMN/*">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Specimen'" />
		        </xsl:attribute>
			</rdf:type>
			<arco-lite:isClassifiedByCurrentTaxon>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-lite:isClassifiedByCurrentTaxon>
			<arco-lite:isIdentifiedByCurrentTaxon>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-lite:isIdentifiedByCurrentTaxon>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMN/*">
			<arco-core:isClassifiedBy>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-core:isClassifiedBy>
			<arco-spe:isIdentifiedBy>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-spe:isIdentifiedBy>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMN">
			<arco-core:isClassifiedBy>
				<xsl:choose>
					<xsl:when test="./RMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-core:isClassifiedBy>
			<arco-spe:isIdentifiedBy>
				<xsl:choose>
					<xsl:when test="./RMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-spe:isIdentifiedBy>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNM/SM/SMN/*">
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI)" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
			<arco-spe:hasIdentificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI)" />
				</xsl:attribute>
			</arco-spe:hasIdentificationInTime>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMN">
			<arco-core:hasClassificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-', position())" />
				</xsl:attribute>
			</arco-core:hasClassificationInTime>
			<arco-spe:hasIdentificationInTime>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="concat($NS,'IdentifcationInTime/',$itemURI, '-', position())" />
				</xsl:attribute>
			</arco-spe:hasIdentificationInTime>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNM/SM/SME">
			<arco-spe:hasLabel>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-spe:hasLabel>			
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RME">
			<arco-spe:hasLabel>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
				</xsl:attribute>
			</arco-spe:hasLabel>			
		</xsl:for-each>
		<xsl:if test="not($sheetType='F' or $sheetType='PG')">
			<xsl:if test="record/metadata/schede/*/LR or record/metadata/schede/*/IM  or record/metadata/schede/*/IR or record/metadata/schede/*/ET">
				<arco-spe:hasSpecimenHarvesting>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI)" />
					</xsl:attribute>
				</arco-spe:hasSpecimenHarvesting>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSF">
			<arco-spe:hasChemicalFormula>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'ChemicalFormula/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSF)))" />
				</xsl:attribute>
			</arco-spe:hasChemicalFormula>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSE">
			<arco-spe:hasChemicalFormula>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'ChemicalFormula/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSE)))" />
				</xsl:attribute>
			</arco-spe:hasChemicalFormula>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC">
			<arco-spe:hasUnitCell>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'UnitCell/',  $itemURI)" />
				</xsl:attribute>
			</arco-spe:hasUnitCell>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFA or record/metadata/schede/BNM/SM/SMF/SMFZ">
			<arco-spe:hasCleavage>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Cleavage/',  $itemURI)" />
				</xsl:attribute>
			</arco-spe:hasCleavage>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM">
			<xsl:if test="./RMC">
				<arco-spe:hasUnitCell>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'UnitCell/',  $itemURI)" />
					</xsl:attribute>
				</arco-spe:hasUnitCell>
			</xsl:if>
			<xsl:if test="./RMF/RMFA or ./RMF/RMFZ">
				<arco-spe:hasCleavage>
					<xsl:value-of select="concat($NS,'Cleavage/',  $itemURI, '-', position())" />
				</arco-spe:hasCleavage>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A')">
			<xsl:if test="record/metadata/schede/BNM/IM/IMA/IMAO">
				<arco-spe:hasHostRock>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'HostRock/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAO))" />
					</xsl:attribute>
				</arco-spe:hasHostRock>
			</xsl:if>
		</xsl:if>					
		<xsl:if test="record/metadata/schede/BNM/SM/SMT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMT/SMTT)), 'non tipo'))">
			<arco-spe:hasTypification>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Typification/', $itemURI)" />
				</xsl:attribute>
			</arco-spe:hasTypification>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMT"> 
			<xsl:if test="./RMTT and not(starts-with(lower-case(normalize-space(./RMTT)), 'non tipo'))">
				<arco-spe:hasTypification>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'TypeSpecimenIdentification/', $itemURI, '-', position())" />
					</xsl:attribute>
				</arco-spe:hasTypification>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/BNM/SM/SMA/SMAI">
			<arco-spe:hasInclusion>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Inclusion/', arco-fn:urify(.))" />
				</xsl:attribute>
			</arco-spe:hasInclusion>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA">
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAZ and starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAZ)), 'presente')">
			<arco-spe:zoning>
            	<xsl:value-of select="true()" />
			</arco-spe:zoning>
		</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFR and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFR)), 'non rilevata'))">
			<arco-spe:radioactivity>
            	<xsl:value-of select="true()" />
			</arco-spe:radioactivity>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAP and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAP)), 'non rilevata'))">
			<arco-spe:pseudomorph>
            	<xsl:value-of select="true()" />
			</arco-spe:pseudomorph>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAS and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAS)), 'non rilevata'))">
			<arco-spe:paramorph>
            	<xsl:value-of select="true()" />
			</arco-spe:paramorph>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAB" >
			<arco-spe:hasCrystalMorphology>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'CrystalMorphology/', $itemURI)" />
				</xsl:attribute>
			</arco-spe:hasCrystalMorphology>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAA" >
			<arco-spe:hasCrystalHabit>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'CrystalHabit/', $itemURI)" />
				</xsl:attribute>
			</arco-spe:hasCrystalHabit>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAP" >
			<arco-spe:hasPseudomorhosis>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Pseudomorhosis/', $itemURI)" />
				</xsl:attribute>
			</arco-spe:hasPseudomorhosis>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAS" >
			<arco-spe:hasParamorhosis>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Paramorhosis/', $itemURI)" />
				</xsl:attribute>
			</arco-spe:hasParamorhosis>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAG" >
			<arco-spe:hasCrystalTwinning>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'CrystalTwinning/', $itemURI)" />
				</xsl:attribute>
			</arco-spe:hasCrystalTwinning>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFC">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasColour>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)))" />
            	</xsl:attribute>
			</arco-lite:hasColour>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAF">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasShape>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAF)))" />
            	</xsl:attribute>
			</arco-lite:hasShape>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFT">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasStreak>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFT)))" />
            	</xsl:attribute>
			</arco-lite:hasStreak>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFB">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasLustre>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFB)))" />
            	</xsl:attribute>
			</arco-lite:hasLustre>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFP">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasDiaphaneity>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFP)))" />
            	</xsl:attribute>
			</arco-lite:hasDiaphaneity>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFU">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasFracture>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)))" />
            	</xsl:attribute>
			</arco-lite:hasFracture>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFE">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasTenacity>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFE)))" />
            	</xsl:attribute>
			</arco-lite:hasTenacity>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFO">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasOpticalPhenomena>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)))" />
            	</xsl:attribute>
			</arco-lite:hasOpticalPhenomena>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFM">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasMagnetism>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)))" />
            	</xsl:attribute>
			</arco-lite:hasMagnetism>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFL">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasFluorescence>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)))" />
            	</xsl:attribute>
			</arco-lite:hasFluorescence>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFS">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasPhosphorescence>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)))" />
            	</xsl:attribute>
			</arco-lite:hasPhosphorescence>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMC">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasColour>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)))" />
            	</xsl:attribute>
			</arco-lite:hasColour>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMP">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasPleochroism>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)))" />
            	</xsl:attribute>
			</arco-lite:hasPleochroism>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOP">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasPleochroism>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)))" />
            	</xsl:attribute>
			</arco-lite:hasPleochroism>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMA">
			<arco-dd:hasTechnicalStatus>
				<xsl:attribute name="rdf:resource">
	                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 				</xsl:attribute>
			</arco-dd:hasTechnicalStatus>
			<arco-lite:hasAnisotropy>
				<xsl:attribute name="rdf:resource">
            		<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)))" />
            	</xsl:attribute>
			</arco-lite:hasAnisotropy>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV or record/metadata/schede/BNM/SM/SMF/SMFG or record/metadata/schede/BNM/SM/SMF/SMFI or record/metadata/schede/BNM/SM/SMF/SMFD or record/metadata/schede/BNM/SM/SMF/SMFF or record/metadata/schede/BNM/SM/SMF/SMFH or record/metadata/schede/BNM/SM/SMF/SMFN">
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</xsl:if>
		<xsl:for-each select="record/metadata/schede/BNM/RM/RMF">
		<xsl:if test="./RMFV or ./RMFG or ./RMFI or ./RMFD or ./RMFF or ./RMFH or ./RMFN">
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</xsl:if>
		</xsl:for-each>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/NotMetallicSpecimen'" />
		        </xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOI or record/metadata/schede/BNM/SM/SMO/SMOR or record/metadata/schede/BNM/SM/SMO/SMOO or record/metadata/schede/BNM/SM/SMO/SMOE or record/metadata/schede/BNM/SM/SMO/SMOA or record/metadata/schede/BNM/SM/SMO/SMOB or record/metadata/schede/BNM/SM/SMO/SMOG or record/metadata/schede/BNM/SM/SMO/SMOV or record/metadata/schede/BNM/SM/SMO/SMOD">
				<arco-spe:hasRefraction>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Refraction/', $itemURI)" />
					</xsl:attribute>
				</arco-spe:hasRefraction>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/RM/RMO and not(record/metadata/schede/BNM/SM/SMO or record/metadata/schede/BNM/SM/SMM)">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/NotMetallicSpecimen'" />
		        </xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MetallicSpecimen'" />
		        </xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMF or record/metadata/schede/BNM/SM/SMM/SMMB">
				<arco-spe:hasReflectance>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Reflectance/', $itemURI)" />
					</xsl:attribute>
				</arco-spe:hasReflectance>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMR">
				<arco-spe:internalReflection>
            		<xsl:value-of select="true()" />
				</arco-spe:internalReflection>
			</xsl:if>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/RM/RMM and not(record/metadata/schede/BNM/SM/SMM or record/metadata/schede/BNM/SM/SMO)">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MetallicSpecimen'" />
		        </xsl:attribute>
			</rdf:type>
		</xsl:if>	
		<xsl:for-each select="record/metadata/schede/BNM/RM">
			<xsl:if test="./RMF or ./RMO or ./RMM">
				<xsl:if test="./RMF/RMFC or ./RMF/RMFT or ./RMF/RMFB or ./RMF/RMFP or ./RMF/RMFU or ./RMF/RMFE or ./RMF/RMFO or ./RMF/RMFM or ./RMF/RMFL or ./RMF/RMFS or ./RMM/RMMC or ./RMM/RMMA or ./RMM/RMMP or ./RMO/RMOP">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-', position())" />
	 					</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if>
			</xsl:if>
			<xsl:if test="./RMM/RMMF or ./RMM/RMMB">
				<arco-lite:hasReflectance>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Reflectance/', $itemURI)" />
					</xsl:attribute>
				</arco-lite:hasReflectance>
			</xsl:if>
			<xsl:if test="./RMO/RMOI or ./RMO/RMOR or ./RMO/RMOO or ./RMO/RMOE or ./RMO/RMOA or ./RMO/RMOB or ./RMO/RMOG or ./RMO/RMOV or ./RMO/RMOD">
				<arco-lite:hasRefraction>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS,'Refraction/', $itemURI)" />
					</xsl:attribute>
				</arco-lite:hasRefraction>
			</xsl:if>
		</xsl:for-each>
	</rdf:Description>
	<!-- identifier -->
	<xsl:if test="not($sheetType='BNB')">
		<xsl:if test="record/metadata/schede/*/AC/ACK">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'SpecimenIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/*/AC/ACK))" />
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
					<xsl:value-of select="record/metadata/schede/*/AC/ACK" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/*/AC/ACK" />
				</l0:name>
				<l0:identifier>
					<xsl:value-of select="record/metadata/schede/*/AC/ACK" />
				</l0:identifier>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<!-- Cultural entity technical status -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF or record/metadata/schede/BNM/SM/SMO or record/metadata/schede/BNM/SM/SMM">
		<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFC or record/metadata/schede/BNM/SM/SMF/SMFT or record/metadata/schede/BNM/SM/SMF/SMFB or record/metadata/schede/BNM/SM/SMF/SMFP or record/metadata/schede/BNM/SM/SMF/SMFE or record/metadata/schede/BNM/SM/SMF/SMFO or record/metadata/schede/BNM/SM/SMF/SMFM or record/metadata/schede/BNM/SM/SMF/SMFL or record/metadata/schede/BNM/SM/SMF/SMFS or record/metadata/schede/BNM/SM/SMF/SMFU or record/metadata/schede/BNM/SM/SMM/SMMC or record/metadata/schede/BNM/SM/SMM/SMMA or record/metadata/schede/BNM/SM/SMM/SMMP or record/metadata/schede/BNM/SM/SMO/SMOP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFT">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFT)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFB">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFB)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFU">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFE">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFE)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFO">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFM">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFL">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFS">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMA">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAF">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAF)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<!-- Cultural entity technical status -->
	<xsl:for-each select="record/metadata/schede/BNM/RM">
		<xsl:if test="./RMF/RMFC or ./RMF/RMFT or ./RMF/RMFB or ./RMF/RMFP or ./RMF/RMFU or ./RMF/RMFE or ./RMF/RMFO or ./RMF/RMFM or ./RMF/RMFL or ./RMF/RMFS or ./RMM/RMMC or ./RMM/RMMA or ./RMM/RMMP or ./RMO/RMOP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico del bene culturale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Technical status of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="./RMF/RMFC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFT">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFT)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFB">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFB)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFU">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFU)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFE">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFE)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFO">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFO)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFM">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFM)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFL">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFL)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMF/RMFS">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFS)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMM/RMMC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMM/RMMP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMM/RMMA">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMA)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMO/RMOP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMO/RMOP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<arco-core:current>
					<xsl:value-of select="false()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
		<!-- Physical characteristic as individual -->
		<xsl:if test="./RMF/RMFC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFC)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMF/RMFC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMF/RMFC)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMF/RMFT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFT)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMF/RMFT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMF/RMFT)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Streak'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMF/RMFB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFB)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMF/RMFB)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMF/RMFB)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
        	  			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Lustre'" />
          			</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMF/RMFP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFP)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMF/RMFP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMF/RMFP)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
        	  			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Diaphaneity'" />
          			</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMF/RMFU">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFU)))" />
    	     	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMF/RMFU)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMF/RMFU)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
        	  			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Fracture'" />
          			</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMF/RMFE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFE)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMF/RMFE)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMF/RMFE)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Tenacity'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMF/RMFO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFO)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMF/RMFO)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMF/RMFO)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/OpticalPhenomena'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMF/RMFM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFM)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMF/RMFM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMF/RMFM)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Magnetism'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMF/RMFL">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFL)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMF/RMFL)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMF/RMFL)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Fluorescence'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMF/RMFS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(./RMF/RMFS)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
					</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMF/RMFS)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMF/RMFS)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Phosphorescence'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMM/RMMC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMC)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMM/RMMC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMM/RMMC)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMM/RMMP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMP)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMM/RMMP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMM/RMMP)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Pleochroism'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMM/RMMA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMM/RMMA)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMM/RMMA)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMM/RMMA)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Anisotropy'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(./RMO/RMOP)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./RMO/RMOP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(./RMO/RMOP)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Pleochroism'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	
						<!-- Physical characteristic as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFC)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFT">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFT)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFT)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFT)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Streak'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFB)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFB)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFB)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Lustre'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Diaphaneity'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFU">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFU)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Fracture'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFE)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFE)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFE)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Tenacity'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFO">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFO)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/OpticalPhenomena'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFM">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFM)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Magnetism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFL)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Fluorescence'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'PhysicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMF/SMFS)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Phosphorescence'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMC)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Colour'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Pleochroism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMA">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMM/SMMA)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Anisotropy'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'OpticCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PhysicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMO/SMOP)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Pleochroism'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
            	<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMA/SMAF)))" />
         	</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAF)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAF)" />
			</l0:name>
			<arco-dd:isCharacteristicClassifiedBy>
				<xsl:attribute name="rdf:resource">
          			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Shape'" />
          		</xsl:attribute>
			</arco-dd:isCharacteristicClassifiedBy>
		</rdf:Description>
	</xsl:if>
	
	
						<!-- Measurement collection as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV or record/metadata/schede/BNM/SM/SMF/SMFG or record/metadata/schede/BNM/SM/SMF/SMFI or record/metadata/schede/BNM/SM/SMF/SMFD or record/metadata/schede/BNM/SM/SMF/SMFF or record/metadata/schede/BNM/SM/SMF/SMFH or record/metadata/schede/BNM/SM/SMF/SMFN">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of cultural property ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>

			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-radioactivity')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFG">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gladstone-dale-relation')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFI">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-compatibility-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFD">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-measured-density')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFF">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-calculated-density')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFH">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-mohs-hardness')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFN">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-vhn-hardness')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>			
		</rdf:Description>
	</xsl:if>
	
								<!-- measurement as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-radioactivity')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFV)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Radioactivity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFV)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gladstone-dale-relation')" />
			</xsl:attribute>
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFG)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFG)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFG)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFG)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Gladstone-DaleRelation')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFG)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-compatibility-index')" />
			</xsl:attribute>
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFI)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFI)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Gladstone-DaleRelation')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFI)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-measured-density')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFD)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'MeasuredDensity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFD)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFF">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-calculated-density')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFF)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'CalculatedDensity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFF)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFH">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-mohs-hardness')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFH)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'MohsHardness')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFH)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFN">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-vhn-hardness')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMF/SMFN)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'VhnHardness')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFN)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>

								<!-- Value as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFV">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/',  arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFV)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFV" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFV" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFG">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFG)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFG" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFG" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFI">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFI)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFI" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFI" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFD)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFD" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFD" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFF">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFF)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFF" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFF" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFH">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFH)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFH" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFH" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFN">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMF/SMFN)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFN" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFN" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	
	<xsl:for-each select="record/metadata/schede/BNM/RM/RMF">
					<!-- Measurement collection as individual -->
	<xsl:if test="./RMFV or ./RMFG or ./RMFI or ./RMFD or ./RMFF or ./RMFH or ./RMFN">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure del luogo di raccolta'" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure del luogo di raccolta'" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of collecting location'" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of collecting location'" />
			</l0:name>
			 <arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<xsl:if test="./RMFV">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-radioactivity-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFG">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gladstone-dale-relation-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFI">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-compatibility-index-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFD">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-measured-density-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFF">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-calculated-density-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFH">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-mohs-hardness-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMFN">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-vhn-hardness-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>			
		</rdf:Description>
	</xsl:if>
	
								<!-- measurement as individual -->	
	
	<xsl:if test="./RMFV">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-radioactivity-', position())" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFV)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFV)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFV)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFV)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Radioactivity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFV)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFG">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-gladstone-dale-relation')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFG)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFG)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFG)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFG)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Gladstone-DaleRelation')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFG)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFI">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-compatibility-index')" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFI)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFI)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Gladstone-DaleRelation')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFI)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-measured-density-', position())" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFD)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFD)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFD)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFD)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'MeasuredDensity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFD)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFF">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-calculated-density-', position())" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFF)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFF)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFF)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFF)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'CalculatedDensity')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFF)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFH">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-mohs-hardness-', position())" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFH)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFH)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFH)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFH)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'MohsHardness')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFH)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFN">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-vhn-hardness-', position())" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFN)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of cultural property ', $itemURI, ': ', ./RMFN)" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFN)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura del bene culturale ', $itemURI, ': ', ./RMFN)" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'VhnHardness')" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFN)))" />
			</arco-dd:hasValue>
		</rdf:Description>
	</xsl:if>

								<!-- Value as individual -->
	<xsl:if test="./RMFV">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFV)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFV" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFV" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFG">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFG)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFG" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFG" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFI">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFI)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFI" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFI" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFD">
		<rdf:Description>
			<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFD)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFD" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFD" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFF">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFF)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFF" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFF" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFH">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFH)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFH" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFH" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMFN">
		<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMFN)))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="./RMFN" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMFN" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>
						
						<!-- Taxon Specification of mineral property -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNV">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNV)))" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Variety'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNV" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNV" />
            </l0:name>           
  		</rdf:Description>
  	</xsl:if>
					<!-- Taxon as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMN/*">
		<rdf:Description>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
					<xsl:attribute name="rdf:about">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
			    	</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="rdf:about">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
			    	</xsl:attribute>
			   	</xsl:otherwise>
		  	</xsl:choose>	
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MineralSpecies'" />
            	</xsl:attribute>
			</rdf:type>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNI">
				<rdfs:label xml:lang="en">
	   				<xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNI" />
		   		</rdfs:label>
		   	</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNA">
				<rdfs:label xml:lang="it">
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNA" />
	   			</rdfs:label>
	    	</xsl:if>
		    <xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNI">
				<l0:name xml:lang="en">
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNI" />
	   			</l0:name>
		   	</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNA">
				<l0:name xml:lang="it">
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNA" />
		   		</l0:name>
		    </xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNS">
					<arco-cd:synonym>
						<xsl:value-of select="record/metadata/schede/BNM/SM/SMN/SMNS" />
					</arco-cd:synonym>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSK">
					<arco-spe:newDanaCode>
						<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSK" />
					</arco-spe:newDanaCode>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSX">
					<arco-spe:strunzCode>
						<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSX" />
					</arco-spe:strunzCode>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSG">
					<arco-spe:imaCode>
						<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSG" />
					</arco-spe:imaCode>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSD">
				<arco-spe:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSD)))" />
		    		</xsl:attribute>
            	</arco-spe:hasDirectHigherRank>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMN/SMNV">
				<arco-spe:hasTaxonSpecification>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNV)))" />
		    		</xsl:attribute>
            	</arco-spe:hasTaxonSpecification>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSC or record/metadata/schede/BNM/SM/SMS/SMSS">
				<arco-spe:hasDirectHigherRank>
					<xsl:choose>
						<xsl:when test="record/metadata/schede/BNM/SM/SMS/SMSS">
							<xsl:attribute name="rdf:resource">
		    					<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSS)))" />
		    				</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
		    					<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSC)))" />
		    				</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
            	</arco-spe:hasDirectHigherRank>
			</xsl:if>
	</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSS)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MineralSubclass'" />
            	</xsl:attribute>
			</rdf:type>
			<xsl:choose>
				<xsl:when test="record/metadata/schede/BNM/SM/SMS/SMSC" >
					<rdfs:label>
				   		<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMS/SMSC, ' ', record/metadata/schede/BNM/SM/SMS/SMSS)" />
				   	</rdfs:label>
					<l0:name>
						<xsl:value-of select="concat(record/metadata/schede/BNM/SM/SMS/SMSC, ' ', record/metadata/schede/BNM/SM/SMS/SMSS)" />
					</l0:name>
				</xsl:when>
				<xsl:otherwise>
					<rdfs:label>
				   		<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSS" />
				   	</rdfs:label>
					<l0:name>
						<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSS" />
					</l0:name>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSC">
				<arco-spe:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSC)))" />
		    		</xsl:attribute>
            	</arco-spe:hasDirectHigherRank>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSX">
				<arco-spe:strunzCode>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSX" />
				</arco-spe:strunzCode>
			</xsl:if>
			<arco-core:isDefinedByClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/StrunzClassificationSystem'" />
		    	</xsl:attribute>
			</arco-core:isDefinedByClassificationSystem>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSC">
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSC)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MineralClass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSC" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSC" />
			</l0:name>
			<arco-core:isDefinedByClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/StrunzClassificationSystem'" />
		    	</xsl:attribute>
			</arco-core:isDefinedByClassificationSystem>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSX">
				<xsl:if test="not(record/metadata/schede/BNM/SM/SMS/SMSS)">
					<arco-spe:strunzCode>
						<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSX" />
					</arco-spe:strunzCode>
				</xsl:if>
			</xsl:if>
	</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSD)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MineralClass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSD" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSD" />
			</l0:name>
			<arco-core:isDefinedByClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/NewDanaClassificationSystem'" />
		    	</xsl:attribute>
			</arco-core:isDefinedByClassificationSystem>
			<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSK">
				<arco-spe:newDanaCode>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSK" />
				</arco-spe:newDanaCode>
			</xsl:if>
		</rdf:Description>
	</xsl:if>						
						
	<xsl:for-each select="record/metadata/schede/BNM/RM">					
						<!-- Taxon Specification of mineral property -->	
	<xsl:if test="./RMN/RMNV">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
               <xsl:value-of select="concat($NS,'Variety/', arco-fn:urify(normalize-space(./RMN/RMNV)))" />
            </xsl:attribute>
            <rdf:type>
            <xsl:attribute name="rdf:resource">
            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Variety'" />      
            </xsl:attribute>
            </rdf:type>
            <rdfs:label>
            	 <xsl:value-of select="./RMN/RMNV" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="./RMN/RMNV" />
            </l0:name>           
  		</rdf:Description>
  	</xsl:if>
					<!-- Taxon as individual -->
	<xsl:if test="./RMN">
	<rdf:Description>
		<xsl:choose>
				<xsl:when test="./RMN/RMNI">
					<xsl:attribute name="rdf:about">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMNI)))" />
			    	</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="rdf:about">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMNA)))" />
			    	</xsl:attribute>
			   	</xsl:otherwise>
		  	</xsl:choose>	
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MineralSpecies'" />
            	</xsl:attribute>
			</rdf:type>
			<xsl:if test="./RMN/RMNI">
				<rdfs:label xml:lang="en">
	   				<xsl:value-of select="./RMN/RMNI" />
		   		</rdfs:label>
		   	</xsl:if>
			<xsl:if test="./RMN/RMNA">
				<rdfs:label xml:lang="it">
					<xsl:value-of select="./RMN/RMNA" />
	   			</rdfs:label>
	    	</xsl:if>
		    <xsl:if test="./RMN/RMNI">
				<l0:name xml:lang="en">
					<xsl:value-of select="./RMN/RMNI" />
	   			</l0:name>
		   	</xsl:if>
			<xsl:if test="./RMN/RMNA">
				<l0:name xml:lang="it">
					<xsl:value-of select="./RMN/RMNA" />
		   		</l0:name>
		    </xsl:if>
			<xsl:if test="./RMN/RMNS">
					<arco-cd:synonym>
						<xsl:value-of select="./RMN/RMNS" />
					</arco-cd:synonym>
			</xsl:if>
			<xsl:if test="./RMN/RMSK">
					<arco-spe:newDanaCode>
						<xsl:value-of select="./RMN/RMSK" />
					</arco-spe:newDanaCode>
			</xsl:if>
			<xsl:if test="./RMN/RMSX">
					<arco-spe:strunzCode>
						<xsl:value-of select="./RMN/RMSX" />
					</arco-spe:strunzCode>
			</xsl:if>
			<xsl:if test="./RMN/RMSG">
					<arco-spe:imaCode>
						<xsl:value-of select="./RMN/RMSG" />
					</arco-spe:imaCode>
			</xsl:if>
			<xsl:if test="./RMN/RMSD">
				<arco-spe:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMSD)))" />
		    		</xsl:attribute>
            	</arco-spe:hasDirectHigherRank>
			</xsl:if>
			<xsl:if test="./RMN/RMSC or ./RMN/RMSS">
				<arco-spe:hasDirectHigherRank>
					<xsl:choose>
						<xsl:when test="./RMN/RMSS">
							<xsl:attribute name="rdf:resource">
		    					<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMSS)))" />
		    				</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
		    					<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMSC)))" />
		    				</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
            	</arco-spe:hasDirectHigherRank>
			</xsl:if>
	</rdf:Description>
	</xsl:if>
	<rdf:Description>
		<xsl:if test="./RMS/RMSS">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMS/RMSS)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MineralSubclass'" />
            	</xsl:attribute>
			</rdf:type>
			<xsl:choose>
				<xsl:when test="./RMS/RMSC" >
					<rdfs:label>
				   		<xsl:value-of select="concat(./RMS/RMSC, ' ', ./RMS/RMSS)" />
				   	</rdfs:label>
					<l0:name>
						<xsl:value-of select="concat(./RMS/RMSC, ' ', ./RMS/RMSS)" />
					</l0:name>
				</xsl:when>
				<xsl:otherwise>
					<rdfs:label>
				   		<xsl:value-of select="./RMS/RMSS" />
				   	</rdfs:label>
					<l0:name>
						<xsl:value-of select="./RMS/RMSS" />
					</l0:name>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="./RMS/RMSC">
				<arco-spe:hasDirectHigherRank>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMS/RMSC)))" />
		    		</xsl:attribute>
            	</arco-spe:hasDirectHigherRank>
			</xsl:if>
			<xsl:if test="./RMS/RMSX">
				<arco-spe:strunzCode>
					<xsl:value-of select="./RMS/RMSX" />
				</arco-spe:strunzCode>
			</xsl:if>
			<arco-core:isDefinedByClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/StrunzClassificationSystem'" />
		    	</xsl:attribute>
			</arco-core:isDefinedByClassificationSystem>
		</xsl:if>
	</rdf:Description>
	<rdf:Description>
		<xsl:if test="./RMS/RMSC">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMS/RMSC)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MineralClass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="./RMS/RMSC" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMS/RMSC" />
			</l0:name>
			<xsl:if test="./RMS/RMSX">
				<xsl:if test="not(./RMS/RMSS)">
					<arco-spe:strunzCode>
						<xsl:value-of select="./RMS/RMSX" />
					</arco-spe:strunzCode>
				</xsl:if>
			</xsl:if>
			<arco-core:isDefinedByClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/StrunzClassificationSystem'" />
		    	</xsl:attribute>
			</arco-core:isDefinedByClassificationSystem>
		</xsl:if>
	</rdf:Description>
	<rdf:Description>
		<xsl:if test="./RMS/RMSD">
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMS/RMSD)))" />
		    </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
        	       	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/MineralClass'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
		   		<xsl:value-of select="./RMS/RMSD" />
		   	</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMS/RMSD" />
			</l0:name>
			<xsl:if test="./RMS/RMSK">
				<arco-spe:newDanaCode>
					<xsl:value-of select="./RMS/RMSK" />
				</arco-spe:newDanaCode>
			</xsl:if>
			<arco-core:refersToClassificationSystem>
				<xsl:attribute name="rdf:resource">
		    		<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/NewDanaClassificationSystem'" />
		    	</xsl:attribute>
			</arco-core:refersToClassificationSystem>
		</xsl:if>
	</rdf:Description>
	</xsl:for-each>

								<!-- Classification in time -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMN/*">
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	 <xsl:value-of select="concat('Classification of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-core:hasTaxon>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-core:hasTaxon>
		</rdf:Description>
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/IdentificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Identificazione del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Identificazione del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Identification of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	 <xsl:value-of select="concat('Identification of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<arco-core:hasTaxon>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-core:hasTaxon>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNM/RM/RMN">
	<xsl:variable name="rmnv">
		<xsl:choose>
			<xsl:when test="./RMNV and (not(starts-with(lower-case(normalize-space(./RMNV)), 'nr')) and not(starts-with(lower-case(normalize-space(./RMNV)), 'n.r')))">
				<xsl:value-of select="concat('-', normalize-space(arco-fn:urify(./RMNV)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'ClassificationInTime/',$itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Classificazione ', position(), ' del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Classificazione ', position(), ' del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	 <xsl:value-of select="concat('Classification ', position(), ' of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-core:hasTaxon>
				<xsl:choose>
					<xsl:when test="./RMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-core:hasTaxon>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'IdentificationInTime/',$itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/IdentificationInTime'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
            	 <xsl:value-of select="concat('Identificazione ', position(), ' del bene culturale ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="it">
            	<xsl:value-of select="concat('Identificazione ', position(), ' del bene culturale ', $itemURI)" />
            </l0:name>
			<rdfs:label xml:lang="en">
            	 <xsl:value-of select="concat('Identification ', position(), ' of cultural property ', $itemURI)" />
            </rdfs:label>
            <l0:name xml:lang="en">
            	 <xsl:value-of select="concat('Identification ', position(), ' of cultural property ', $itemURI)" />
            </l0:name>
            <arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<arco-core:hasTaxon>
				<xsl:choose>
					<xsl:when test="./RMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-core:hasTaxon>
		</rdf:Description>
	</xsl:for-each>
							<!-- Label as individual  -->
	<xsl:for-each select="record/metadata/schede/BNM/SM/SME">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Label'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Etichetta ',  position(), ' del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Etichetta ',  position(), ' del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Label ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of	select="concat('Label ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./SMET">
				<arco-spe:bodyTranscript>
					<xsl:value-of select="normalize-space(./SMET)" />
				</arco-spe:bodyTranscript>
			</xsl:if>
			<xsl:if test="./SMEI">
				<arco-spe:headingTranscript>
					<xsl:value-of select="normalize-space(./SMEI)" />
				</arco-spe:headingTranscript>
			</xsl:if>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>		
		</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/BNM/RM/RME">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Label/', $itemURI, '-revised-label-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Label'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Etichetta revisionata ',  position(), ' del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Etichetta revisionata ',  position(), ' del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Revised label ', position(), ' of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of	select="concat('Revised label ', position(), ' of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./RMET">
				<arco-spe:bodyTranscript>
					<xsl:value-of select="normalize-space(./RMET)" />
				</arco-spe:bodyTranscript>
			</xsl:if>
			<xsl:if test="./RMEI">
				<arco-spe:headingTranscript>
					<xsl:value-of select="normalize-space(./RMEI)" />
				</arco-spe:headingTranscript>
			</xsl:if>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>		
		</rdf:Description>
	</xsl:for-each>

								<!-- Specimen Harvesting as individual -->
	<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A')">
	<xsl:if test="record/metadata/schede/*/LR or record/metadata/schede/*/IM or record/metadata/schede/*/IR or record/metadata/schede/*/ET">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'SpecimenHarvesting/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/SpecimenHarvesting'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Harvesting of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Harvesting of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/LR/LRI/LRIL">
				<xsl:variable name="lril-virgola" select="record/metadata/schede/*/LR/LRI/LRIL" />
				<xsl:variable name="lril-novirgola" select="translate($lril-virgola, ',', ' ')" />
				<xsl:variable name="lirl" select="translate($lril-novirgola, '/', ',')" />
				<xsl:variable name="authorssplit" select="arco-fn:split($lirl)" />
				<xsl:for-each select="$authorssplit">
					<arco-spe:hasHarvestingOperator>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-spe:hasHarvestingOperator>
				</xsl:for-each>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIZ">
					<arco-spe:hasHarvestingResponsible>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-spe:hasHarvestingResponsible>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIG">
					<arco-spe:hasHarvestingResponsible>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-spe:hasHarvestingResponsible>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIX">
					<arco-spe:hasHarvestingSponsor>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-spe:hasHarvestingSponsor>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/*/LR/LRI/LRIY">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
	               		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/BNB/LR/LRI/LRIY, '-',  record/metadata/schede/BNB/LR/LRI/LRIY)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/LR/LRI/LRIK">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
	               		<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/LR/LRI/LRIK, '-',  record/metadata/schede/BNB/LR/LRI/LRIN, '-',  record/metadata/schede/BNB/LR/LRI/LRIC,'-',  record/metadata/schede/BNB/LR/LRI/LRIQ)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/LR/LRI/LRIE">
				<arco-core:note>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIE)" />
				</arco-core:note>
			</xsl:if>			
			<xsl:if test="record/metadata/schede/*/LR/LRV">
				<clvapit:hasSpatialCoverage>
					<xsl:choose>
						<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</clvapit:hasSpatialCoverage>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/LR/LRI/LRIW">
				<arco-location:hasHarvestingMethod>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'HarvestingMethod/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIW))" />
					</xsl:attribute>
				</arco-location:hasHarvestingMethod>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/LR/LRI/LRIU">
				<arco-location:hasHarvestingMotivation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'HarvestingMotivation/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIU))" />
					</xsl:attribute>
				</arco-location:hasHarvestingMotivation>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/LR/LRI/LRIF">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/LR/LRI/LRIF)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
		</rdf:Description>
	</xsl:if>				
	<!-- Time interval as individual -->
	<xsl:if test="record/metadata/schede/*/LR/LRI/LRIF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(normalize-space(record/metadata/schede/*/LR/LRI/LRIF)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIF)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIF)" />
			</l0:name>
			<tiapit:time>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIF)" />
			</tiapit:time>
		</rdf:Description>
	</xsl:if>
	<!-- Harvesting Method as individual -->
	<xsl:if test="record/metadata/schede/*/LR/LRI/LRIW">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of 	select="concat($NS, 'HarvestingMethod/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIW))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/natural-specimen-description/HarvestingMethod'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIW)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIW)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- Harvesting Motivation as individual -->
	<xsl:if test="record/metadata/schede/*/LR/LRI/LRIU and not($sheetType='F')">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'HarvestingMotivation/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIU))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/natural-specimen-description/HarvestingMotivation'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIU)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/LR/LRI/LRIU)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>				
	<!-- Time indexed typed location as individual -->
	<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A' or $sheetType='BNB')">
		<xsl:if test="record/metadata/schede/*/LR or record/metadata/schede/*/IM or record/metadata/schede/*/IR or record/metadata/schede/*/ET">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TimeIndexedTypedLocation/', $itemURI, '-collecting-location')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
		    	    	<xsl:value-of select="'https://w3id.org/arco/ontology/location/TimeIndexedTypedLocation'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Localizzazione della raccolta del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Localizzazione della raccolta del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Collecting location of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Collecting location of cultural property ', $itemURI)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IMA/IMAC or record/metadata/schede/*/IM/IMA/IMAE or record/metadata/schede/*/IM/IMA/IMAP or record/metadata/schede/*/IM/IMA/IMAD or record/metadata/schede/*/IM/IMA/IMAF or record/metadata/schede/*/IM/IMA/IMAG">
					<arco-location:hasGeologicalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
						</xsl:attribute>
					</arco-location:hasGeologicalContext>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/ET/ETA/ETAC or record/metadata/schede/*/ET/ETA/ETAP or record/metadata/schede/*/ET/ETA/ETAD or record/metadata/schede/*/ET/ETA/ETAF">
					<arco-location:hasGeologicalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
						</xsl:attribute>
					</arco-location:hasGeologicalContext>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IM/IMG">
					<arco-location:hasGeologicalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
						</xsl:attribute>
					</arco-location:hasGeologicalContext>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IM/IML">
					<arco-location:hasGeologicalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
						</xsl:attribute>
					</arco-location:hasGeologicalContext>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRG">
					<arco-location:hasGeologicalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
						</xsl:attribute>
					</arco-location:hasGeologicalContext>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRL">
					<arco-location:hasGeologicalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
						</xsl:attribute>
					</arco-location:hasGeologicalContext>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/ET/ETG">
					<arco-location:hasGeologicalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
						</xsl:attribute>
					</arco-location:hasGeologicalContext>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/ET/ETL">
					<arco-location:hasGeologicalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
						</xsl:attribute>
					</arco-location:hasGeologicalContext>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/IR/IRA/IRAC or record/metadata/schede/*/IR/IRA/IRAE or record/metadata/schede/*/IR/IRA/IRAP or record/metadata/schede/*/IR/IRA/IRAD or record/metadata/schede/*/IR/IRA/IRAF or record/metadata/schede/*/IR/IRA/IRAG">
					<arco-location:hasGeologicalContext>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
						</xsl:attribute>
					</arco-location:hasGeologicalContext>
				</xsl:if>
				<xsl:if test="record/metadata/schede/*/LR/LRI/LRIR">
					<arco-location:hasNaturalEnvironment>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'NaturalEnvironment/', $itemURI)" />
						</xsl:attribute>
					</arco-location:hasNaturalEnvironment>
				</xsl:if>					
				<arco-location:hasLocationType>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="'https://w3id.org/arco/ontology/location/CollectingLocation'" />
	            	</xsl:attribute>
				</arco-location:hasLocationType>			
				<!-- at location -->
				<xsl:for-each select="record/metadata/schede/*/LR/LRV">
					<arco-location:atLocation>
						<xsl:choose>
							<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-location:atLocation>
				</xsl:for-each>
			</rdf:Description>
		</xsl:if>
		<!-- NaturalEnvironment as individual -->	
		<xsl:if test="record/metadata/schede/*/LR/LRI/LRIR">
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
					<xsl:value-of select="concat('Ambiente naturale relativo al luogo di raccolta del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Ambiente naturale relativo al luogo di raccolta del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Natural environment of collecting location of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Natural environment of collecting location of cultural property ', $itemURI)" />
				</l0:name>
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/*/LR/LRI/LRIR" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/*/LR/LRI/LRIR" />
				</l0:name>
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'NaturalEnvironmentType/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIR))" />
					</xsl:attribute>
				</arco-core:hasType>
				<xsl:if test="record/metadata/schede/*/LR/LRI/LRIO">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-natural-environment-measurement-collection')" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>		
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
        			<xsl:value-of select="concat($NS, 'NaturalEnvironmentType/', arco-fn:urify(record/metadata/schede/*/LR/LRI/LRIR))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/NaturalEnvironmentType'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/*/LR/LRI/LRIR" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/*/LR/LRI/LRIR" />
				</l0:name>		
			</rdf:Description>
			<xsl:if test="record/metadata/schede/*/LR/LRI/LRIO">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-natural-environment-measurement-collection')" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
        	    	   		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
            	   		</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="'Misure del luogo di raccolta'" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="'Misure del luogo di raccolta'" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="'Measuerements of collecting location'" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="'Measuerements of collecting location'" />
					</l0:name>
					<xsl:if test="record/metadata/schede/*/LR/LRI/LRIO">
						<arco-dd:hasMeasurement>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-depth')" />
							</xsl:attribute>
						</arco-dd:hasMeasurement>
					</xsl:if>		
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/NaturalEnvironment/', $itemURI, '-depth')" />
					<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/*/LR/LRI/LRIO)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Measurement of collecting location of ', $itemURI, ': ', record/metadata/schede/*/LR/LRI/LRIO)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/*/LR/LRI/LRIO)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Misura del luogo di raccolta di ', $itemURI, ': ', record/metadata/schede/*/LR/LRI/LRIO)" />
					</l0:name>
					<arco-dd:hasMeasurementType>
						<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Depth')" />
					</arco-dd:hasMeasurementType>
					<arco-dd:hasValue>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:extract-value(record/metadata/schede/*/LR/LRI/LRIO))" />
					</arco-dd:hasValue>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:extract-value(record/metadata/schede/*/LR/LRI/LRIO))" />
					<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
					<rdfs:label xml:lang="en">
						<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/*/LR/LRI/LRIO)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/*/LR/LRI/LRIO)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/*/LR/LRI/LRIO)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="arco-fn:extract-value(record/metadata/schede/*/LR/LRI/LRIO)" />
					</l0:name>
					<mu:hasMeasurementUnit>
						<xsl:attribute name="rdf:resource" select="concat($NS, 'MeasurementUnit/', arco-fn:extract-unit(record/metadata/schede/*/LR/LRI/LRIO))" />
					</mu:hasMeasurementUnit>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:if>		
	<!-- Feature as individual -->
	<xsl:for-each select="record/metadata/schede/*/LR/LRV">
	<xsl:variable name="lrvk">
		<xsl:choose>
			<xsl:when test="./LRVK and (not(starts-with(lower-case(normalize-space(./LRVK)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVK)), 'n.r')))">
				<xsl:value-of select="concat(normalize-space(arco-fn:urify(./LRVK)), ' - ')" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lrvs">
		<xsl:choose>
			<xsl:when test="./LRVS and (not(starts-with(lower-case(normalize-space(./LRVS)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVS)), 'n.r')))">
				<xsl:value-of select="normalize-space(arco-fn:urify(./LRVS))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>	
	<xsl:variable name="lrvr">
		<xsl:choose>
			<xsl:when test="./LRVR and (not(starts-with(lower-case(normalize-space(./LRVR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVR)), 'n.r')))">
				<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVR)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lrvp">
		<xsl:choose>
			<xsl:when test="./LRVP and (not(starts-with(lower-case(normalize-space(./LRVP)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVP)), 'n.r')))">
				<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVP)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lrvc">
		<xsl:choose>
			<xsl:when test="./LRVC and (not(starts-with(lower-case(normalize-space(./LRVC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVC)), 'n.r')))">
				<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVC)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lrvl">
		<xsl:choose>
			<xsl:when test="./LRVL and (not(starts-with(lower-case(normalize-space(./LRVL)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVL)), 'n.r')))">
				<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVL)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lrve">
		<xsl:choose>
			<xsl:when test="./LRVE and (not(starts-with(lower-case(normalize-space(./LRVE)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVE)), 'n.r')))">
				<xsl:value-of select="concat(' - ', normalize-space(arco-fn:urify(./LRVE)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="address-label">
		<xsl:value-of select="concat($lrvk, $lrvs, $lrvr, $lrvp, $lrvc, $lrvl, $lrve)" />
	</xsl:variable>
		<rdf:Description>
			<xsl:choose>
				<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'Feature/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text"
						select="$address-label" />
				</xsl:call-template>
			</rdfs:label>
			<l0:name>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text"
						select="$address-label" />
				</xsl:call-template>
			</l0:name>
			<xsl:if test="../MAO and (not(starts-with(lower-case(normalize-space(../MAO)), 'nr')) and not(starts-with(lower-case(normalize-space(../MAO)), 'n.r')))">
				<arco-location:seaOrOcean>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="../MAO" />
					</xsl:call-template>
				</arco-location:seaOrOcean>
			</xsl:if>
			<xsl:if test="../BID and (not(starts-with(lower-case(normalize-space(../BID)), 'nr')) and not(starts-with(lower-case(normalize-space(../BID)), 'n.r')))">
				<arco-location:drainageBasin>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="../BID" />
					</xsl:call-template>
				</arco-location:drainageBasin>
			</xsl:if>
			<xsl:if test="./LRVZ and (not(starts-with(lower-case(normalize-space(./LRVZ)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVZ)), 'n.r')))">
				<arco-location:hasZoogeographicRegion>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'ZoogeographicRegion/', arco-fn:urify(./LRVZ))" />
					</xsl:attribute>
				</arco-location:hasZoogeographicRegion> 
			</xsl:if>
			<xsl:if test="../LRM and (not(starts-with(lower-case(normalize-space(../LRM)), 'nr')) and not(starts-with(lower-case(normalize-space(../LRM)), 'n.r')))">
				<arco-location:hasZoogeographicRegion>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of 	select="concat($NS, 'ZoogeographicRegion/', arco-fn:urify(../LRM))" />
					</xsl:attribute>
				</arco-location:hasZoogeographicRegion> 
			</xsl:if>
			<clvapit:hasAddress>
				<xsl:choose>
					<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</clvapit:hasAddress>
				<xsl:for-each select="../LRL">
					<arco-location:hasToponymInTime>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(.)))" />
						</xsl:attribute>
					</arco-location:hasToponymInTime>
				</xsl:for-each>
			<xsl:if test="../LRS and (not(starts-with(lower-case(normalize-space(../LRS)), 'nr')) and not(starts-with(lower-case(normalize-space(../LRS)), 'n.r')))">
				<arco-core:specifications>
					<xsl:value-of select="normalize-space(../LRS)" />
				</arco-core:specifications>
			</xsl:if>	
		</rdf:Description>
		<rdf:Description>
			<xsl:choose>
				<xsl:when test="./LRVS and not(lower-case(normalize-space(./LRVS))='italia')">
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVK), normalize-space(./LRVS), normalize-space(./LRVP), normalize-space(./LRVR), normalize-space(./LRVC), normalize-space(./LRVL), normalize-space(./LRVE))))" />
					</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="rdf:about">
						<xsl:value-of 	select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(./LRVP), normalize-space(./LRVC), normalize-space(./LRVL))))" />
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text"
						select="$address-label" />
				</xsl:call-template>
			</rdfs:label>
			<l0:name>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="text"
						select="$address-label" />
				</xsl:call-template>
			</l0:name>
			<xsl:if test="./LRVL and (not(starts-with(lower-case(normalize-space(./LRVL)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVL)), 'n.r')))">
				<clvapit:hasAddressArea>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./LRVL)))" />
					</xsl:attribute>
				</clvapit:hasAddressArea>
			</xsl:if>
			<xsl:if test="./LRVE and (not(starts-with(lower-case(normalize-space(./LRVE)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVE)), 'n.r')))">
				<clvapit:hasAddressArea>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./LRVE)))" />
					</xsl:attribute>
				</clvapit:hasAddressArea>
			</xsl:if>
			<xsl:if test="./LRVS and (not(starts-with(lower-case(normalize-space(./LRVS)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVS)), 'n.r')))">
				<clvapit:hasCountry>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(normalize-space(./LRVS)))" />
					</xsl:attribute>
				</clvapit:hasCountry>
			</xsl:if>
			<xsl:if test="./LRVR and (not(starts-with(lower-case(normalize-space(./LRVR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVR)), 'n.r')))">
				<xsl:choose>
					<xsl:when test="./LRVC and (starts-with(lower-case(normalize-space(./LRVC)), 'firenze') or starts-with(lower-case(normalize-space(./LRVC)), 'siena') or starts-with(lower-case(normalize-space(./LRVC)), 'san severino marche') or starts-with(lower-case(normalize-space(./LRVC)), 'modena'))">	
						<xsl:choose>
							<xsl:when test="./LRVR and (starts-with(lower-case(normalize-space(./LRVR)), 'lombardia'))">
							</xsl:when>
							<xsl:otherwise>
								<clvapit:hasRegion>
									<xsl:attribute name="rdf:resource">
                		                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./LRVR))" />
				           	        </xsl:attribute>
								</clvapit:hasRegion>
							</xsl:otherwise>
						</xsl:choose>					
					</xsl:when>
					<xsl:otherwise>
						<clvapit:hasRegion>
							<xsl:attribute name="rdf:resource">
        		   	            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./LRVR))" />
						    </xsl:attribute>
						</clvapit:hasRegion>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="./LRVP and (not(starts-with(lower-case(normalize-space(./LRVP)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVP)), 'n.r')))">
				<clvapit:hasProvince>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(normalize-space(./LRVP)))" />
					</xsl:attribute>
				</clvapit:hasProvince>
			</xsl:if>				
			<xsl:if test="./LRVC and (not(starts-with(lower-case(normalize-space(./LRVC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVC)), 'n.r')))">
				<clvapit:hasCity>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(normalize-space(./LRVC)))" />
					</xsl:attribute>
				</clvapit:hasCity>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./LRVL and (not(starts-with(lower-case(normalize-space(./LRVL)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVL)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./LRVL)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVL)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVL)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./LRVE and (not(starts-with(lower-case(normalize-space(./LRVE)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVE)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'AddressArea/', arco-fn:urify(normalize-space(./LRVE)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVE)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVE)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./LRVZ and (not(starts-with(lower-case(normalize-space(./LRVZ)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVZ)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'ZoogeographicRegion/', arco-fn:urify(./LRVZ))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/ZoogeographicRegion'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVZ)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVZ)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="../LRM and (not(starts-with(lower-case(normalize-space(../LRM)), 'nr')) and not(starts-with(lower-case(normalize-space(../LRM)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'ZoogeographicRegion/', arco-fn:urify(../LRM))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/ZoogeographicRegion'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(../LRM)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(../LRM)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./LRVS and (not(starts-with(lower-case(normalize-space(./LRVS)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVS)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'Country/', arco-fn:urify(normalize-space(./LRVS)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVS)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVS)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./LRVR and (not(starts-with(lower-case(normalize-space(./LRVR)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVR)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'Region/', arco-fn:urify(normalize-space(./LRVR)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVR)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVR)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./LRVP and (not(starts-with(lower-case(normalize-space(./LRVP)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVP)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'Province/', arco-fn:urify(normalize-space(./LRVP)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVP)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVP)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./LRVC and (not(starts-with(lower-case(normalize-space(./LRVC)), 'nr')) and not(starts-with(lower-case(normalize-space(./LRVC)), 'n.r')))">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of 	select="concat($NS, 'City/', arco-fn:urify(normalize-space(./LRVC)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVC)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./LRVC)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:for-each select="../LRL">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ToponymInTime/', arco-fn:urify(normalize-space(.)))" />
			 	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/location/ToponymInTime'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(.)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(.)" />
					</xsl:call-template>
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:for-each>		
	</xsl:if>				
	<!-- Address Area -->
	<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A')">
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAR">
		<xsl:call-template name="address-area">
			<xsl:with-param name="ctx" select="record/metadata/schede/*/IM/IMA/IMAR"/>
		</xsl:call-template>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAM">
		<xsl:call-template name="address-area">
			<xsl:with-param name="ctx" select="record/metadata/schede/*/IM/IMA/IMAM"/>
		</xsl:call-template>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAT">
		<xsl:call-template name="address-area">
			<xsl:with-param name="ctx" select="record/metadata/schede/*/IM/IMA/IMAT"/>
		</xsl:call-template>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/IR/IRA/IRAR">
		<xsl:call-template name="address-area">
			<xsl:with-param name="ctx" select="record/metadata/schede/*/IR/IRA/IRAR"/>
		</xsl:call-template>	
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/IR/IRA/IRAM">
		<xsl:call-template name="address-area">
			<xsl:with-param name="ctx" select="record/metadata/schede/*/IR/IRA/IRAM"/>
		</xsl:call-template>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/IR/IRA/IRAT">
		<xsl:call-template name="address-area">
			<xsl:with-param name="ctx" select="record/metadata/schede/*/IR/IRA/IRAT"/>
		</xsl:call-template>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/*/ET/ETA/ETAT">
		<xsl:call-template name="address-area">
			<xsl:with-param name="ctx" select="record/metadata/schede/*/ET/ETA/ETAT"/>
		</xsl:call-template>
	</xsl:if>			
	</xsl:if>
	<!-- Geological context as individual -->
	<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A')">					
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAC or record/metadata/schede/*/IM/IMA/IMAS or record/metadata/schede/*/IR/IRA/IRAS or record/metadata/schede/*/IM/IMA/IMAE or record/metadata/schede/*/IM/IMA/IMAP or record/metadata/schede/*/IM/IMA/IMAD or record/metadata/schede/*/IM/IMA/IMAF or record/metadata/schede/*/IM/IMA/IMAG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/GeologicalContext'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAP or record/metadata/schede/*/IM/IMA/IMAE">
				<arco-location:hasMineralDeposit>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MineralDeposit/', $itemURI)" />
					</xsl:attribute>
				</arco-location:hasMineralDeposit>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAS">
				<arco-location:hasStratum>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
					</xsl:attribute>
				</arco-location:hasStratum>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IR/IRA/IRAS">
				<arco-location:hasStratum>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
					</xsl:attribute>
				</arco-location:hasStratum>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAF or record/metadata/schede/*/IM/IMA/IMAD or record/metadata/schede/*/IM/IMA/IMAG">
				<arco-location:hasOutcrop>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Outcrop/', $itemURI)" />
					</xsl:attribute>
				</arco-location:hasOutcrop>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/IM/IMA/IMAB">
				<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-geological-context-bibliography-', position())" />
					</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAC">
				<arco-core:description>
					<xsl:value-of select="record/metadata/schede/*/IM/IMA/IMAC" />
				</arco-core:description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAN">
				<arco-core:note>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAN)" />
				</arco-core:note>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/ET/ETA/ETAC or record/metadata/schede/*/ET/ETA/ETAP or record/metadata/schede/*/ET/ETA/ETAD or record/metadata/schede/*/ET/ETA/ETAF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/GeologicalContext'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/ET/ETA/ETAP">
				<arco-location:hasMineralDeposit>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MineralDeposit/', $itemURI)" />
					</xsl:attribute>
				</arco-location:hasMineralDeposit>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/ET/ETA/ETAF or record/metadata/schede/*/ET/ETA/ETAD">
				<arco-location:hasOutcrop>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Outcrop/', $itemURI)" />
					</xsl:attribute>
				</arco-location:hasOutcrop>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/*/ET/ETA/ETAB">
				<arco-cd:hasBibliography>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-geological-context-bibliography-', position())" />
					</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/*/ET/ETA/ETAC">
				<arco-core:description>
					<xsl:value-of select="record/metadata/schede/*/ET/ETA/ETAC" />
				</arco-core:description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/ET/ETA/ETAN">
				<arco-core:note>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETA/ETAN)" />
				</arco-core:note>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/IM/IMG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/GeologicalContext'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<arco-location:hasStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasStratum>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Stratum'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', $chronostratigraphicClassBNM)" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/*/IM/IMG/IMGC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGC))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Chronozone'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGC)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IMG/IMGS">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGS))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IMG/IMGS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGS))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/ChronostratigraphicSubstage'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGS)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGS)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IMG/IMGT">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGT))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>	
		<xsl:if test="record/metadata/schede/*/IM/IMG/IMGT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGT))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/ChronostratigraphicStage'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGT)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IMG/IMGO">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGO))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IMG/IMGO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGO))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/ChronostratigraphicSeries'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGO)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGO)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IMG/IMGP">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGP))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IMG/IMGP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGP))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/ChronostratigraphicSystem'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGP)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IMG/IMGR">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGR))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IMG/IMGR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGR))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Erathem'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGR)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGR)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IMG/IMGE">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGE))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IMG/IMGE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IMG/IMGE))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Eonothem'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGE)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMG/IMGE)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/IM/IML">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/GeologicalContext'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/IM/IML/IMLO or record/metadata/schede/*/IM/IML/IMLL or record/metadata/schede/*/IM/IML/IMLM or record/metadata/schede/*/IM/IML/IMLF or record/metadata/schede/*/IM/IML/IMLG or record/metadata/schede/*/IM/IML/IMLS or record/metadata/schede/*/IM/IML/IMLC">
			<arco-location:hasStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasStratum>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/*/IM/IML/IMLO or record/metadata/schede/*/IM/IML/IMLL or record/metadata/schede/*/IM/IML/IMLM or record/metadata/schede/*/IM/IML/IMLF or record/metadata/schede/*/IM/IML/IMLG or record/metadata/schede/*/IM/IML/IMLS or record/metadata/schede/*/IM/IML/IMLC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Stratum'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', $lithostratigraphicClassBNM)" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IML/IMLO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLO))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicBed'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLO)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLO)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IML/IMLL">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLL))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IML/IMLL">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLL))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicStratum'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLL)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLL)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IML/IMLM">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLM))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IML/IMLM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLM))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicMember'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLM)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IML/IMLF">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLF))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IML/IMLF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLF))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicFormation'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLF)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLF)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IML/IMLG">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLG))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IML/IMLG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLG))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicGroup'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLG)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLG)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IML/IMLS">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLS))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IML/IMLS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLS))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicSupergroup'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLS)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLS)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IM/IML/IMLC">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLC))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IM/IML/IMLC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IM/IML/IMLC))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicComplex'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IML/IMLC)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>		
	<xsl:if test="record/metadata/schede/*/IR/IRG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/GeologicalContext'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<arco-location:hasStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasStratum>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Stratum'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', $chronostratigraphicClassBNPE)" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/*/IR/IRG/IRGC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGC))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Chronozone'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGC)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRG/IRGS">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGS))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRG/IRGS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGS))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/ChronostratigraphicSubstage'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGS)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGS)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRG/IRGT">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGT))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>	
		<xsl:if test="record/metadata/schede/*/IR/IRG/IRGT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGT))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/ChronostratigraphicStage'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGT)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRG/IRGO">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGO))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRG/IRGO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGO))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/ChronostratigraphicSeries'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGO)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGO)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRG/IRGP">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGP))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRG/IRGP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGP))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/ChronostratigraphicSystem'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGP)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRG/IRGR">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGR))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRG/IRGR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGR))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Erathem'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGR)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGR)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRG/IRGE">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGE))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRG/IRGE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRG/IRGE))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Eonothem'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGE)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRG/IRGE)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/IR/IRL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/GeologicalContext'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/IR/IRL/IRLO or record/metadata/schede/*/IR/IRL/IRLL or record/metadata/schede/*/IR/IRL/IRLM or record/metadata/schede/*/IR/IRL/IRLF or record/metadata/schede/*/IR/IRL/IRLG or record/metadata/schede/*/IR/IRL/IRLS or record/metadata/schede/*/IR/IRL/IRLC">
			<arco-location:hasStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasStratum>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/*/IR/IRL/IRLO or record/metadata/schede/*/IR/IRL/IRLL or record/metadata/schede/*/IR/IRL/IRLM or record/metadata/schede/*/IR/IRL/IRLF or record/metadata/schede/*/IR/IRL/IRLG or record/metadata/schede/*/IR/IRL/IRLS or record/metadata/schede/*/IR/IRL/IRLC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Stratum'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', $lithostratigraphicClassBNPE)" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRL/IRLO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLO))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicBed'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLO)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLO)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRL/IRLL">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLL))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRL/IRLL">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLL))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicStratum'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLL)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLL)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRL/IRLM">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLM))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRL/IRLM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLM))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicMember'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLM)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRL/IRLF">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLF))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRL/IRLF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLF))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicFormation'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLF)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLF)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRL/IRLG">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLG))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRL/IRLG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLG))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicGroup'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLG)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLG)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRL/IRLS">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLS))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRL/IRLS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLS))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicSupergroup'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLS)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLS)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/IR/IRL/IRLC">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLC))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/IR/IRL/IRLC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/IR/IRL/IRLC))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicComplex'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRL/IRLC)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>	
	<xsl:if test="record/metadata/schede/*/ET/ETG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/GeologicalContext'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<arco-location:hasStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasStratum>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Stratum'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', $chronostratigraphicClassBNP)" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/*/ET/ETG/ETGC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGC))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Chronozone'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGC)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/ET/ETG/ETGS">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGS))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETG/ETGS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGS))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/ChronostratigraphicSubstage'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGS)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGS)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/ET/ETG/ETGT">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGT))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>	
		<xsl:if test="record/metadata/schede/*/ET/ETG/ETGT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGT))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/ChronostratigraphicStage'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGT)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGT)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/ET/ETG/ETGO">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGO))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETG/ETGO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGO))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/ChronostratigraphicSeries'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGO)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGO)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/ET/ETG/ETGP">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGP))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETG/ETGP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGP))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/ChronostratigraphicSystem'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGP)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/ET/ETG/ETGR">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGR))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETG/ETGR">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGR))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Erathem'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGR)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGR)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/ET/ETG/ETGE">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGE))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETG/ETGE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'ChronostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETG/ETGE))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Eonothem'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGE)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETG/ETGE)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/ET/ETL">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'GeologicalContext/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/GeologicalContext'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Contesto geologico del luogo di raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Geological context of collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/ET/ETL/ETLO or record/metadata/schede/*/ET/ETL/ETLL or record/metadata/schede/*/ET/ETL/ETLM or record/metadata/schede/*/ET/ETL/ETLF or record/metadata/schede/*/ET/ETL/ETLG or record/metadata/schede/*/ET/ETL/ETLS or record/metadata/schede/*/ET/ETL/ETLC">
			<arco-location:hasStratum>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
				</xsl:attribute>
			</arco-location:hasStratum>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/*/ET/ETL/ETLO or record/metadata/schede/*/ET/ETL/ETLL or record/metadata/schede/*/ET/ETL/ETLM or record/metadata/schede/*/ET/ETL/ETLF or record/metadata/schede/*/ET/ETL/ETLG or record/metadata/schede/*/ET/ETL/ETLS or record/metadata/schede/*/ET/ETL/ETLC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Stratum'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:isClassifiedBy>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', $lithostratigraphicClassBNP)" />
				</xsl:attribute>
			</arco-core:isClassifiedBy>
		</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETL/ETLO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLO))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicBed'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLO)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLO)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/ET/ETL/ETLL">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLL))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETL/ETLL">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLL))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicStratum'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLL)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLL)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/ET/ETL/ETLM">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLM))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETL/ETLM">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLM))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicMember'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLM)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLM)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/ET/ETL/ETLF">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLF))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETL/ETLF">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLF))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicFormation'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLF)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLF)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/ET/ETL/ETLG">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLG))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETL/ETLG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLG))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicGroup'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLG)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLG)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/ET/ETL/ETLS">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLS))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETL/ETLS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLS))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicSupergroup'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLS)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLS)" />
				</l0:name>
				<xsl:if test="record/metadata/schede/*/ET/ETL/ETLC">
					<arco-spe:hasDirectHigherRank>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLC))" />
						</xsl:attribute>
					</arco-spe:hasDirectHigherRank>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/ET/ETL/ETLC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'LithostratigraphicClass/', arco-fn:urify(record/metadata/schede/*/ET/ETL/ETLC))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
			        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/LithostratigraphicComplex'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETL/ETLC)" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<!-- Mineral deposit as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAP or record/metadata/schede/*/IM/IMA/IMAE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'MineralDeposit/', $itemURI)" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of	select="'https://w3id.org/arco/ontology/location/MineralDeposit'" />
				</xsl:attribute>	
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Giacimento del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Giacimento del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Mineral deposit of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Mineral deposit of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAP">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAP))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAE">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAE))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/ET/ETA/ETAP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'MineralDeposit/', $itemURI)" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of	select="'https://w3id.org/arco/ontology/location/MineralDeposit'" />
				</xsl:attribute>	
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Giacimento del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Giacimento del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Mineral deposit of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Mineral deposit of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/ET/ETA/ETAP">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/ET/ETA/ETAP))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<!-- Mineral Deposit Type as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAP))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/location/MineralDepositType'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAP)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAE))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/location/MineralDepositType'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAE)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAE)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/ET/ETA/ETAP">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'MineralDepositType/', arco-fn:urify(record/metadata/schede/*/ET/ETA/ETAP))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/location/MineralDepositType'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETA/ETAP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETA/ETAP)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- Stratum as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Stratum'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</l0:name>
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
			 	   	<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-stratum')" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				 <xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-stratum')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure dello strato di ritrovmento del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name  xml:lang="it">
				<xsl:value-of select="'Misure dello strato di ritrovmento del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of finding stratum of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name  xml:lang="en">
				<xsl:value-of select="'Measuerements of finding stratum of cultural property ', $itemURI" />
			</l0:name>
			<arco-dd:hasMeasurement>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Measurement/Stratum/', (record/metadata/schede/*/IM/IMA/IMAS))" />
				</xsl:attribute>
			</arco-dd:hasMeasurement>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/Stratum/', (record/metadata/schede/*/IM/IMA/IMAS))" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of stratum: ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of stratum: ', (.))" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura dello strato: ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura dello strato: ', (.))" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="'https://w3id.org/arco/ontology/denotative-description/Thickness'" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAS))" />
			</arco-dd:hasValue>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about"   select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAS))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAS)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAS)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/IR/IRA/IRAS">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Stratum/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Stratum'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Strato del luogo di ritrovamento del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Stratum of finding location of cultural property ', $itemURI)" />
			</l0:name>
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
			 	   	<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-stratum')" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				 <xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-stratum')" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure dello strato di ritrovmento del bene culturale ', $itemURI" />
			</rdfs:label>
			<l0:name  xml:lang="it">
				<xsl:value-of select="'Misure dello strato di ritrovmento del bene culturale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of finding stratum of cultural property ', $itemURI" />
			</rdfs:label>
			<l0:name  xml:lang="en">
				<xsl:value-of select="'Measuerements of finding stratum of cultural property ', $itemURI" />
			</l0:name>
			<arco-dd:hasMeasurement>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Measurement/Stratum/', (record/metadata/schede/*/IR/IRA/IRAS))" />
				</xsl:attribute>
			</arco-dd:hasMeasurement>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about"   select="concat($NS, 'Measurement/Stratum/', (record/metadata/schede/*/IR/IRA/IRAS))" />
			<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Measurement of stratum: ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Measurement of stratum: ', (.))" />
			</l0:name>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Misura dello strato: ', (.))" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Misura dello strato: ', (.))" />
			</l0:name>
			<arco-dd:hasMeasurementType>
				<xsl:attribute name="rdf:resource" select="'https://w3id.org/arco/ontology/denotative-description/Thickness'" />
			</arco-dd:hasMeasurementType>
			<arco-dd:hasValue>
				<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAS))" />
			</arco-dd:hasValue>
		</rdf:Description>
		<rdf:Description>
			<xsl:attribute name="rdf:about"   select="concat($NS, 'Value/', arco-fn:urify(record/metadata/schede/*/IR/IRA/IRAS))" />
			<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAS)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IR/IRA/IRAS)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- OutCrop as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAF or record/metadata/schede/*/IM/IMA/IMAD or record/metadata/schede/*/IM/IMA/IMAG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Outcrop/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Outcrop'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Affioramento del luogo di raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Affioramento del luogo di raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Outcrop of collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Outcrop of collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAF">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'OutcropType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAF))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAD">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/IM/IMA/IMAD, '-',  record/metadata/schede/*/IM/IMA/IMAD)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/IM/IMA/IMAG">
				<arco-dd:hasOrientation>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS,'Orientation/', arco-fn:urify(normalize-space(record/metadata/schede/*/IM/IMA/IMAG)))" />
				</xsl:attribute>
				</arco-dd:hasOrientation>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/ET/ETA/ETAF or record/metadata/schede/*/ET/ETA/ETAD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'Outcrop/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/arco/ontology/location/Outcrop'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Affioramento del luogo di raccolta del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Affioramento del luogo di raccolta del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Outcrop of collecting location of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Outcrop of collecting location of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/*/ET/ETA/ETAF">
				<arco-core:hasType>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'OutcropType/', arco-fn:urify(record/metadata/schede/*/ET/ETA/ETAF))" />
					</xsl:attribute>
				</arco-core:hasType>
			</xsl:if>
			<xsl:if test="record/metadata/schede/*/ET/ETA/ETAD">
				<tiapit:atTime>
					<xsl:attribute name="rdf:resource">
		        		<xsl:value-of 	select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/ET/ETA/ETAD, '-',  record/metadata/schede/*/ET/ETA/ETAD)))" />
					</xsl:attribute>
				</tiapit:atTime>
			</xsl:if>
		</rdf:Description>
	</xsl:if>					
	<!-- OutCrop type as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'OutcropType/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAF))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/location/OutcropType'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAF)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/IM/IMA/IMAF)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/ET/ETA/ETAF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	            <xsl:value-of select="concat($NS, 'OutcropType/', arco-fn:urify(record/metadata/schede/*/ET/ETA/ETAF))" />
	        </xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
	            	<xsl:value-of	select="'https://w3id.org/arco/ontology/location/OutcropType'" />
	            </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETA/ETAF)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/*/ET/ETA/ETAF)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>				
	<!-- Time interval as individual -->
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/IM/IMA/IMAD, '-',  record/metadata/schede/*/IM/IMA/IMAD)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat(record/metadata/schede/*/IM/IMA/IMAD, ' - ', record/metadata/schede/*/IM/IMA/IMAD)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat(record/metadata/schede/*/IM/IMA/IMAD, ' - ', record/metadata/schede/*/IM/IMA/IMAD)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="record/metadata/schede/*/IM/IMA/IMAD" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="record/metadata/schede/*/IM/IMA/IMAD" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/*/ET/ETA/ETAD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(record/metadata/schede/*/ET/ETA/ETAD, '-',  record/metadata/schede/*/ET/ETA/ETAD)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat(record/metadata/schede/*/ET/ETA/ETAD, ' - ', record/metadata/schede/*/ET/ETA/ETAD)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat(record/metadata/schede/*/ET/ETA/ETAD, ' - ', record/metadata/schede/*/ET/ETA/ETAD)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="record/metadata/schede/*/ET/ETA/ETAD" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="record/metadata/schede/*/ET/ETA/ETAD" />
			</arco-arco:endTime>
		</rdf:Description>
	</xsl:if>
	</xsl:if>
	<!-- Type specimen identification as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMT and not(starts-with(lower-case(normalize-space(record/metadata/schede/BNM/SM/SMT/SMTT)), 'non tipo'))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'Typification/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Typification'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of 	select="concat('Typification of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of 	select="concat('Typification of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTB">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography')" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTT">	
				<arco-spe:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNM/SM/SMT/SMTT))" />
				</xsl:attribute>
				</arco-spe:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="record/metadata/schede/BNM/SM/SMN">
			<arco-spe:producesTaxon>
				<xsl:choose>
					<xsl:when test="record/metadata/schede/BNM/SM/SMN/SMNI">
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNI)))" />
		    			</xsl:attribute>
		    		</xsl:when>
		    		<xsl:otherwise>
						<xsl:attribute name="rdf:resource">
		    				<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMN/SMNA)))" />
		    			</xsl:attribute>
		    		</xsl:otherwise>
		    	</xsl:choose>
			</arco-spe:producesTaxon>
			</xsl:if>		
			<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTA">
			<xsl:variable name="authorssplit" select="arco-fn:split(record/metadata/schede/BNM/SM/SMT/SMTA)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
		</rdf:Description>
		<!-- Bibliography as individual -->
		<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography')" />
	        	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMT/SMTB" />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:if>
			
		<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(record/metadata/schede/BNM/SM/SMT/SMTT))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMT/SMTT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMT/SMTT" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMT/SMTA">
			<xsl:variable name="authorssplit" select="arco-fn:split(record/metadata/schede/BNM/SM/SMT/SMTA)" />
			<xsl:for-each select="$authorssplit">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
					</xsl:attribute>
    		        <rdf:type>
						<xsl:attribute name="rdf:resource">
	        		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>   
					<rdfs:label>
						<xsl:value-of select="." />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="." />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
	</xsl:if>	
	<!-- Bibliography as individual -->	
	<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A')">					
		<xsl:for-each select="record/metadata/schede/*/IM/IMA/IMAB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-geological-context-bibliography-', position())" />
	        	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al contesto geologico del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al contesto geologico del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about geological context of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about geological context of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="." />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:for-each>	
	</xsl:if>				
	<!-- Type specimen identification as individual -->
	<xsl:for-each select="record/metadata/schede/BNM/RM">
	<xsl:variable name="rmnv">
		<xsl:choose>
			<xsl:when test="./RMN/RMNV and (not(starts-with(lower-case(normalize-space(./RMN/RMNV)), 'nr')) and not(starts-with(lower-case(normalize-space(./RMN/RMNV)), 'n.r')))">
				<xsl:value-of select="concat('-', normalize-space(arco-fn:urify(./RMN/RMNV)))" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="''" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:if test="./RMT/RMTT and not(starts-with(lower-case(normalize-space(./RMT/RMTT)), 'non tipo'))">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'Typification/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Typification'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of 	select="concat('Identificazione del tipo nomenclaturale del bene ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of 	select="concat('Typification of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of 	select="concat('Typification of cultural property ', $itemURI)" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="false()" />
            </arco-core:current>
			<xsl:if test="./RMT/RMTB">	
				<arco-cd:hasBibliography>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography-', position())" />
				</xsl:attribute>
				</arco-cd:hasBibliography>
			</xsl:if>
			<xsl:if test="./RMT/RMTT">	
				<arco-spe:hasTypeOfTypeSpecimen>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RMT/RMTT))" />
				</xsl:attribute>
				</arco-spe:hasTypeOfTypeSpecimen>
			</xsl:if>								
			<xsl:if test="./RMN">
			<arco-spe:producesTaxon>
				<xsl:choose>
					<xsl:when test="./RMN/RMNI">
						<xsl:choose>
							<xsl:when test="./RMN/RMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMNI)), $rmnv, '-',arco-fn:urify(normalize-space(./RMN/RMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMNI)), $rmnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:when>
		    		<xsl:otherwise>
		    			<xsl:choose>
							<xsl:when test="./RMN/RMNP">
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMNA)), $rmnv, '-',arco-fn:urify(normalize-space(./RMN/RMNP)))" />
		    					</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
		    						<xsl:value-of select="concat($NS,'MineralTaxon/', arco-fn:urify(normalize-space(./RMN/RMNA)), $rmnv)" />
		    					</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
		    		</xsl:otherwise>
		    </xsl:choose>
			</arco-spe:producesTaxon>
			</xsl:if>		
			<xsl:if test="./RMT/RMTA">
			<xsl:variable name="authorssplit" select="arco-fn:split(./RMT/RMTA)" />
				<xsl:for-each select="$authorssplit">
					<arco-core:involvesAgent>
						<xsl:attribute name="rdf:resource">
        					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-core:involvesAgent>
				</xsl:for-each>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RMT/RMTB">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Bibliography/', $itemURI, '-type-specimen-bibliography-', position())" />
	        	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Bibliografia relativa al tipo nomenclaturale del bene ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Bibliography about type specimen of cultural property ', $itemURI)" />
				</l0:name>
				<arco-cd:completeBibliographicReference>
					<xsl:value-of select="./RMT/RMTB" />
				</arco-cd:completeBibliographicReference>			
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMT/RMTT">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'TypeOfTypeSpecimen/', arco-fn:urify(./RMT/RMTT))" />
		        </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
	        	    	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/TypeOfTypeSpecimen'" />
	            	</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="./RMT/RMTT" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMT/RMTT" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMT/RMTA">
			<xsl:variable name="authorssplit" select="arco-fn:split(./RMT/RMTA)" />
			<xsl:for-each select="$authorssplit">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
					</xsl:attribute>
    		        <rdf:type>
						<xsl:attribute name="rdf:resource">
	        		    	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
						</xsl:attribute>
					</rdf:type>   
					<rdfs:label>
						<xsl:value-of select="." />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="." />
					</l0:name>
				</rdf:Description>
			</xsl:for-each>
		</xsl:if>
	</xsl:if>
	</xsl:for-each>
	<!-- Chemical formula as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'ChemicalFormula/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSF)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/EmpiricalChemicalFormula'" />
			   	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSF" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSF" />
			</l0:name>			
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMS/SMSE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'ChemicalFormula/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMS/SMSE)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/SemplifiedChemicalFormula'" />
			   	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSE" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/SM/SMS/SMSE" />
			</l0:name>			
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNM/RM/RMS">
	<xsl:if test="./RMSF">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'ChemicalFormula/', arco-fn:urify(normalize-space(./RMSF)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/EmpiricalChemicalFormula'" />
			   	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="./RMSF" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMSF" />
			</l0:name>			
		</rdf:Description>
	</xsl:if>
	<xsl:if test="./RMSE">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS,'ChemicalFormula/', arco-fn:urify(normalize-space(./RMSE)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/SemplifiedChemicalFormula'" />
			   	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="./RMSE" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="./RMSE" />
			</l0:name>			
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>
	<!-- Host rock as individual -->
	<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A')">							
	<xsl:if test="record/metadata/schede/*/IM/IMA/IMAO">
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'HostRock/', arco-fn:urify(record/metadata/schede/*/IM/IMA/IMAO))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/HostRock'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
            	 <xsl:value-of select="record/metadata/schede/*/IM/IMA/IMAO" />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="record/metadata/schede/*/IM/IMA/IMAO" />
            </l0:name>
		</rdf:Description>
	</xsl:if>
	</xsl:if>
	<!-- Inclusions rock as individual -->
	<xsl:for-each select="record/metadata/schede/BNM/SM/SMA/SMAI">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS,'Inclusion/', arco-fn:urify(.))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
                	<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Inclusion'" />
            	</xsl:attribute>
			</rdf:type>
			<rdfs:label>
            	 <xsl:value-of select="." />
            </rdfs:label>
            <l0:name>
            	<xsl:value-of select="." />
            </l0:name>
		</rdf:Description>
	</xsl:for-each>
						<!-- Orientation as individual -->	
	<xsl:if test="not($sheetType='F' or $sheetType='PG' or $sheetType='A')">						
	<xsl:if test="record/metadata/schede/BNM/IM/IMA/IMAG">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Orientation/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/IM/IMA/IMAG)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/Orientation'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="record/metadata/schede/BNM/IM/IMA/IMAG" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="record/metadata/schede/BNM/IM/IMA/IMAG" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	</xsl:if>
	<!-- Morphology as individual -->	
	<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAB" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'CrystalMorphology/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystalMorphology'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAB)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAB)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAA" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'CrystalHabit/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystalHabit'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAA)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAA)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAP" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Pseudomorhosis/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Pseudomorhosis'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAP)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAP)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAS" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Paramorhosis/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Paramorhosis'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAS)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAS)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<xsl:if test="record/metadata/schede/BNM/SM/SMA/SMAG" >
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'CrystalTwinning/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystalTwinning'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAG)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMA/SMAG)" />
			</l0:name>
		</rdf:Description>
	</xsl:if>
	<!-- Cleavage as individual -->	
	<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFA or record/metadata/schede/BNM/SM/SMF/SMFZ">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Cleavage/',  $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Cleavage'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Sfaldatura del bene culturale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Sfaldatura el bene culturale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Cleavage of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Cleavage of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFA">
				<arco-spe:cleavageGrade>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFA" />
				</arco-spe:cleavageGrade>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMF/SMFZ">
				<arco-spe:cleavageDirection>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMF/SMFZ" />
				</arco-spe:cleavageDirection>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNM/RM">					
	<xsl:if test="./RMF/RMFA or ./RMF/RMFZ">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Cleavage/',  $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Cleavage'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Sfaldatura del bene culturale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Sfaldatura el bene culturale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Cleavage of cultural property ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Cleavage of cultural property ', $itemURI)" />
			</l0:name>
			<xsl:if test="./RMF/RMFA">
				<arco-spe:cleavageGrade>
					<xsl:value-of select="./RMF/RMFA" />
				</arco-spe:cleavageGrade>
			</xsl:if>
			<xsl:if test="./RMF/RMFZ">
				<arco-spe:cleavageDirection>
					<xsl:value-of select="./RMF/RMFZ" />
				</arco-spe:cleavageDirection>
			</xsl:if>
		</rdf:Description>
	</xsl:if>
	</xsl:for-each>	
	<!-- UnitCell as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMC">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'UnitCell/',  $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/UnitCell'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Cella del minerale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Cella del minerale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Unit cell of mineral ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Unit cell of mineral ', $itemURI)" />
			</l0:name>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCA or record/metadata/schede/BNM/SM/SMC/SMCB or record/metadata/schede/BNM/SM/SMC/SMCC or record/metadata/schede/BNM/SM/SMC/SMCF or record/metadata/schede/BNM/SM/SMC/SMCE or record/metadata/schede/BNM/SM/SMC/SMCM or record/metadata/schede/BNM/SM/SMC/SMCV or record/metadata/schede/BNM/SM/SMC/SMCZ">
				<arco-dd:hasMeasurementCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/UnitCell/', $itemURI)" />
					</xsl:attribute>
				</arco-dd:hasMeasurementCollection>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCS or record/metadata/schede/BNM/SM/SMC/SMCL or record/metadata/schede/BNM/SM/SMC/SMCP or record/metadata/schede/BNM/SM/SMC/SMCG">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
		                <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-UnitCell')" />
 					</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCS">
				<arco-lite:hasCrystalSystem>
					<xsl:attribute name="rdf:resource">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCS)))" />
            		</xsl:attribute>
				</arco-lite:hasCrystalSystem>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCL">
				<arco-lite:hasCrystalClass>
					<xsl:attribute name="rdf:resource">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCL)))" />
            		</xsl:attribute>
				</arco-lite:hasCrystalClass>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCP">
				<arco-lite:hasPointGroup>
					<xsl:attribute name="rdf:resource">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCP)))" />
            		</xsl:attribute>
				</arco-lite:hasPointGroup>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCG">
				<arco-lite:hasSpaceGroup>
					<xsl:attribute name="rdf:resource">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCG)))" />
            		</xsl:attribute>
				</arco-lite:hasSpaceGroup>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCA or record/metadata/schede/BNM/SM/SMC/SMCB or record/metadata/schede/BNM/SM/SMC/SMCC or record/metadata/schede/BNM/SM/SMC/SMCF or record/metadata/schede/BNM/SM/SMC/SMCE or record/metadata/schede/BNM/SM/SMC/SMCM or record/metadata/schede/BNM/SM/SMC/SMCV or record/metadata/schede/BNM/SM/SMC/SMCZ">
			<rdf:Description>	
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/UnitCell/', $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misure della cella del minerale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misure della cella del minerale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measuerements of cell of mineral ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measuerements of cell of mineral ', $itemURI)" />
				</l0:name>
				<arco-core:current>
    	        	<xsl:value-of select="true()" />
        	    </arco-core:current>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCA">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-a-parameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCB">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-b-parameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCC">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-c-parameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCF">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-alfa-parameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCE">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-beta-parameter')" />
							</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCM">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gamma-parameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCV">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-volume')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCZ">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-z-parameter')" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-a-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCA)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCA)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCA)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCA)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'aParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCA)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCA)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-b-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'bParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCC">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-c-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCC)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCC)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCC)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCC)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'cParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCC)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCC)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCC" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCC" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCF">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-alfa-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCF)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCF)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCF)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCF)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'alfaParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCF)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCF)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCF" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCF" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCE">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-beta-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCE)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCE)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCE)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCE)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'betaParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCE)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCE)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCE" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCE" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCM">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-gamma-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCM)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCM)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCM)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCM)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'gammaParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCM)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCM)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCM" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCM" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCV">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-volume')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCV)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCV)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCV)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCV)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Volume')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCV)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCV)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCV" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCV" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCZ">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-z-parameter')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCZ)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCZ)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCZ)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMC/SMCZ)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'zParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCZ)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCZ)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCZ" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMC/SMCZ" />
				</l0:name>
			</rdf:Description>
		</xsl:if>			
		<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCS or record/metadata/schede/BNM/SM/SMC/SMCL or record/metadata/schede/BNM/SM/SMC/SMCP or record/metadata/schede/BNM/SM/SMC/SMCG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		       		<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-UnitCell')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico della cella ', position(), ' del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico della cella ', position(), ' del bene culturale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Technical status of unit cell ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Technical status of unit cell ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
         	   		<xsl:value-of select="true()" />
            	</arco-core:current>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCS">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCS)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCL">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCL)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCP)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCG">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCG)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCS)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCS)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystalSystem'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCL)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCL)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystalClass'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCP)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCP)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PointGroup'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMC/SMCG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMC/SMCG)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCG)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/BNM/SM/SMC/SMCG)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/SpaceGroup'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:if>		
	<xsl:for-each select="record/metadata/schede/BNM/RM">					
	<xsl:if test="./RMC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	       			<xsl:value-of select="concat($NS,'UnitCell/',  $itemURI)" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/UnitCell'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Cella del minerale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Cella del minerale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Unit cell of mineral ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Unit cell of mineral ', $itemURI)" />
				</l0:name>
				<xsl:if test="./RMC/RMCA or ./RMC/RMCB or ./RMC/RMCC or ./RMC/RMCF or ./RMC/RMCE or ./RMC/RMCM or ./RMC/RMCV or ./RMC/RMCZ">
					<arco-dd:hasMeasurementCollection>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'MeasurementCollection/UnitCell/', $itemURI, '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurementCollection>
				</xsl:if>
				<xsl:if test="./RMC/RMCS or ./RMC/RMCL or ./RMC/RMCP or ./RMC/RMCG">
					<arco-dd:hasTechnicalStatus>
						<xsl:attribute name="rdf:resource">
		            	    <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-UnitCell-', position())" />
	 					</xsl:attribute>
					</arco-dd:hasTechnicalStatus>
				</xsl:if>
			</rdf:Description>
		<xsl:if test="./RMC/RMCA or ./RMC/RMCB or ./RMC/RMCC or ./RMC/RMCF or ./RMC/RMCE or ./RMC/RMCM or ./RMC/RMCV or ./RMC/RMCZ">
			<rdf:Description>	
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/UnitCell/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
            	   		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
               		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Misure della cella del minerale ', $itemURI" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="'Misure della cella del minerale ', $itemURI" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Measuerements of cell of mineral ', $itemURI" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="'Measuerements of cell of mineral ', $itemURI" />
				</l0:name>
				<arco-core:current>
    	        	<xsl:value-of select="false()" />
        	    </arco-core:current>
				<xsl:if test="./RMC/RMCA">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-a-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCB">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-b-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCC">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-c-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCF">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-alfa-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCE">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-beta-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCM">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gamma-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCV">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-volume', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMC/RMCZ">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-z-parameter', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
			</rdf:Description>
		</xsl:if>	
	
		<xsl:if test="./RMC/RMCA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-a-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCA)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCA)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCA)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCA)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'aParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCA)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCA)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-b-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'bParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCC">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-c-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCC)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCC)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCC)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCC)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'cParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCC)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCC)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCC" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCC" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCF">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-alfa-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCF)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCF)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCF)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCF)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'alfaParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCF)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCF)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCF" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCF" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCE">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-beta-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCE)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCE)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCE)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCE)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'betaParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCE)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCE)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCE" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCE" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCM">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-gamma-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCM)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCM)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCM)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCM)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'gammaParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCM)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCM)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCM" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCM" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCV">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-volume', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCV)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCV)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCV)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCV)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Volume')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCV)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCV)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCV" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCV" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMC/RMCZ">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-z-parameter', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCZ)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of unit cell of mineral ', $itemURI, ': ', ./RMC/RMCZ)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCZ)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della cella del minerale ', $itemURI, ': ', ./RMC/RMCZ)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'zParameter')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCZ)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMC/RMCZ)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMC/RMCZ" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMC/RMCZ" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		
		<xsl:if test="./RMC/RMCS or ./RMC/RMCL or ./RMC/RMCP or ./RMC/RMCG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		       		<xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI, '-UnitCell-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalStatus'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico della cella ', position(), ' del bene culturale ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Stato tecnico della cella ', position(), ' del bene culturale ', $itemURI)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Technical status of unit cell ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Technical status of unit cell ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:current>
         	   		<xsl:value-of select="false()" />
            	</arco-core:current>
				<xsl:if test="./RMC/RMCS">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCS)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMC/RMCL">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCL)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMC/RMCP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCP)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="./RMC/RMCG">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCG)))" />
            			</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<arco-core:current>
					<xsl:value-of select="false()" />
				</arco-core:current>
			</rdf:Description>
			<xsl:if test="./RMC/RMCS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCS)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RMC/RMCS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RMC/RMCS)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystalSystem'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RMC/RMCL">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCL)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RMC/RMCL)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RMC/RMCL)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystalClass'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RMC/RMCP">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCP)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RMC/RMCP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RMC/RMCP)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/PointGroup'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
			<xsl:if test="./RMC/RMCG">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
        	    		<xsl:value-of select="concat($NS, 'CrystallographicCharacteristic/', arco-fn:urify(normalize-space(./RMC/RMCG)))" />
         			</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/CrystallographicCharacteristic'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./RMC/RMCG)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./RMC/RMCG)" />
					</l0:name>
					<arco-dd:isCharacteristicClassifiedBy>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/SpaceGroup'" />
	            		</xsl:attribute>
					</arco-dd:isCharacteristicClassifiedBy>
				</rdf:Description>
			</xsl:if>
		</xsl:if>
	</xsl:if>
	</xsl:for-each>	
	
					<!-- Reflectance as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMF or record/metadata/schede/BNM/SM/SMM/SMMB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Reflectance/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Reflectance'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Riflettanza del minerale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Riflettanza del minerale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Reflectance of mineral ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Reflectance of mineral ', $itemURI)" />
			</l0:name>
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/Reflectance/', $itemURI)" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</rdf:Description>
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/Reflectance/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
       	       		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
           	   	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure della riflettanza del minerale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure della riflettanza del minerale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of reflectance of mineral ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of reflectance of mineral ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
       	    </arco-core:current>
			<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMF">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-reflectance')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMB">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-bireflectance')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMF">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-reflectance')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMF)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMF)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMF)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMF)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Reflectance')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMF)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMF)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMM/SMMF" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMM/SMMF" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMM/SMMB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-bireflectance')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMM/SMMB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Bireflectance')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMM/SMMB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMM/SMMB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMM/SMMB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/BNM/RM/RMM">
	<xsl:if test="./RMMF or ./RMMB">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Reflectance/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Reflectance'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Riflettanza del minerale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Riflettanza del minerale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Reflectance of mineral ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Reflectance of mineral ', $itemURI)" />
			</l0:name>
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/Reflectance/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</rdf:Description>
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/Reflectance/', $itemURI, '-', position())" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
       	       		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
           	   	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure della riflettanza del minerale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure della riflettanza del minerale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of reflectance of mineral ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of reflectance of mineral ', $itemURI" />
			</l0:name>
			<arco-core:current>
            	<xsl:value-of select="true()" />
       	    </arco-core:current>
			<xsl:if test="./RMMF">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-reflectance', '-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="./RMMB">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-bireflectance', '-', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="./RMMF">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-reflectance', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', ./RMMF)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', ./RMMF)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMMF)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMMF)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Reflectance')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMMF)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMMF)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMMF" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMMF" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMMB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-bireflectance', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', ./RMMB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of reflectance of mineral ', $itemURI, ': ', ./RMMB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMMB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMMB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Bireflectance')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMMB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMMB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMMB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMMB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	</xsl:for-each>	

				<!-- Refraction as individual -->
	<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOI or record/metadata/schede/BNM/SM/SMO/SMOR or record/metadata/schede/BNM/SM/SMO/SMOO or record/metadata/schede/BNM/SM/SMO/SMOE or record/metadata/schede/BNM/SM/SMO/SMOA or record/metadata/schede/BNM/SM/SMO/SMOB or record/metadata/schede/BNM/SM/SMO/SMOG or record/metadata/schede/BNM/SM/SMO/SMOV or record/metadata/schede/BNM/SM/SMO/SMOD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Refraction/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Refraction'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Rifrazione del minerale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Rifrazione del minerale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Refraction of mineral ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Refraction of mineral ', $itemURI)" />
			</l0:name>
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/Refraction/', $itemURI)" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</rdf:Description>
		<rdf:Description>	
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'MeasurementCollection/Refraction/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
               		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
           	   	</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="'Misure della rifrazione del minerale ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="'Misure della rifrazione del minerale ', $itemURI" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="'Measuerements of refraction of mineral ', $itemURI" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="'Measuerements of refraction of mineral ', $itemURI" />
			</l0:name>
			<arco-core:current>
    	       	<xsl:value-of select="true()" />
            </arco-core:current>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOI">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-refractive-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOR">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-birefingence')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOO">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-omega-refractive-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOE">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-epsilon-refractive-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOA">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-alfa-refractive-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOB">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-beta-refractive-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOG">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gamma-refractive-index')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOV">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-2vAngle')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
			<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOD">
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-dispersion')" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOI">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-refractive-index')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOI)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'RefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOI)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOI)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOI" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOI" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOR">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-birefringence')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOR)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOR)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOR)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOR)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Birefringence')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOR)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOR)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOR" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOR" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOO">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-omega-refractive-index')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOO)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOO)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOO)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOO)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'OmegaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOO)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOO)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOO" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOO" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOE">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-epsilon-refractive-index')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOE)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOE)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOE)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOE)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'EpsilonRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOE)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOE)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOE" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOE" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-alfa-refractive-index')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOA)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOA)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOA)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOA)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'AlfaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOA)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOA)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-beta-refractive-index')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'BetaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOG">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-gamma-refractive-index')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOG)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOG)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOG)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOG)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'GammaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOG)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOG)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOG" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOG" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOV">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-2vAngle')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOV)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOV)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOV)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOV)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', '2vAngle')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOV)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOV)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOV" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOV" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/BNM/SM/SMO/SMOD">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-dispersion')" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOD)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOD)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOD)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', record/metadata/schede/BNM/SM/SMO/SMOD)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Dispersion')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/',  arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOD)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(record/metadata/schede/BNM/SM/SMO/SMOD)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOD" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/BNM/SM/SMO/SMOD" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
					<!-- Refraction as individual -->
	<xsl:for-each select="record/metadata/schede/BNM/RM">
	<xsl:if test="./RMO/RMOI or ./RMO/RMOR or ./RMO/RMOO or ./RMO/RMOE or ./RMO/RMOA or ./RMO/RMOB or ./RMO/RMOG or ./RMO/RMOV or ./RMO/RMOD">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
	       		<xsl:value-of select="concat($NS,'Refraction/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/natural-specimen-description/Refraction'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Rifrazione del minerale ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Rifrazione del minerale ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Refraction of mineral ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Refraction of mineral ', $itemURI)" />
			</l0:name>
			<arco-dd:hasMeasurementCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/Refraction/', $itemURI, '-', position())" />
				</xsl:attribute>
			</arco-dd:hasMeasurementCollection>
		</rdf:Description>
		<rdf:Description>	
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/Refraction/', $itemURI, '-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        	       		<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
            	   	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Misure della rifrazione del minerale ', $itemURI" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="'Misure della rifrazione del minerale ', $itemURI" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Measuerements of refraction of mineral ', $itemURI" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="'Measuerements of refraction of mineral ', $itemURI" />
				</l0:name>
				<arco-core:current>
    	        	<xsl:value-of select="false()" />
        	    </arco-core:current>
				<xsl:if test="./RMO/RMOI">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-refractive-index', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOR">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-birefingence', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOO">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-omega-refractive-index', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOE">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-epsilon-refractive-index', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOA">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-alfa-refractive-index', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOB">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-beta-refractive-index', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOG">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-gamma-refractive-index', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOV">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-2vAngle', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
				<xsl:if test="./RMO/RMOD">
					<arco-dd:hasMeasurement>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-dispersion', '-', position())" />
						</xsl:attribute>
					</arco-dd:hasMeasurement>
				</xsl:if>
			</rdf:Description>
		<xsl:if test="./RMO/RMOI">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-refractive-index', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOI)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOI)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOI)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'RefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOI)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOI)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOI" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOI" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOR">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-birefringence', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOR)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOR)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOR)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOR)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Birefringence')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOR)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/',  arco-fn:urify(normalize-space(./RMO/RMOR)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOR" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOR" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOO">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-omega-refractive-index', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOO)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOO)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOO)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOO)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'OmegaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOO)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOO)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOO" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOO" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOE">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-epsilon-refractive-index', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOE)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOE)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOE)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOE)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'EpsilonRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOE)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOE)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOE" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOE" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOA">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-alfa-refractive-index', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOA)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOA)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOA)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOA)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'AlfaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOA)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOA)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOA" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOA" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOB">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-beta-refractive-index', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOB)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOB)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOB)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOB)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'BetaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOB)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOB)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOB" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOB" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOG">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-gamma-refractive-index', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOG)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOG)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOG)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOG)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'GammaRefractiveIndex')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOG)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOG)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOG" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOG" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOV">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-2vAngle', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOV)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOV)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOV)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOV)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', '2vAngle')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOV)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOV)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOV" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOV" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="./RMO/RMOD">
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-dispersion', '-', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOD)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of refration of mineral ', $itemURI, ': ', ./RMO/RMOD)" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOD)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della rifrazione del minerale ', $itemURI, ': ', ./RMO/RMOD)" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/natural-specimen-description/', 'Dispersion')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOD)))" />
				</arco-dd:hasValue>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Value/', arco-fn:urify(normalize-space(./RMO/RMOD)))" />
				<rdf:type rdf:resource="https://w3id.org/italia/onto/MU/Value" />
				<rdfs:label>
					<xsl:value-of select="./RMO/RMOD" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./RMO/RMOD" />
				</l0:name>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
	</xsl:for-each>
				
					<!-- Author as individual -->
	<xsl:if test="record/metadata/schede/*/LR/LRI/LRIL">
		<xsl:variable name="lril-virgola" select="record/metadata/schede/*/LR/LRI/LRIL" />
		<xsl:variable name="lril-novirgola" select="translate($lril-virgola, ',', ' ')" />
		<xsl:variable name="lirl" select="translate($lril-novirgola, '/', ',')" />
		<xsl:variable name="authorssplit" select="arco-fn:split($lirl)" />
		<xsl:for-each select="$authorssplit">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIZ">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/COV/Organization'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIX">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/COV/Organization'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/LR/LRI">
		<xsl:if test="record/metadata/schede/*/LR/LRI/LRIY">
		<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(./LRIY, '-',  ./LRIY)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
		        </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat(./LRIY, ' - ', ./LRIY)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat(./LRIY, ' - ', ./LRIY)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="./LRIY" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="./LRIY" />
			</arco-arco:endTime>
		</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/*/LR/LRI/LRIK">
			<rdf:Description>
			<xsl:attribute name="rdf:about">
		    	<xsl:value-of select="concat($NS, 'TimeInterval/', arco-fn:urify(concat(./LRIK, '-',  ./LRIN, '-', ./LRIC,'-', ./LRIQ)))" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
		        	<xsl:value-of select="'https://w3id.org/italia/onto/TI/TimeInterval'" />
		        </xsl:attribute>
			</rdf:type>
			<rdfs:label>
				<xsl:value-of select="concat(./LRIK, '/', ./LRIN, '/', ./LRIC, '/', ./LRIQ)" />
			</rdfs:label>
			<l0:name>
				<xsl:value-of select="concat(./LRIK, '/', ./LRIN, '/', ./LRIC, '/', ./LRIQ)" />
			</l0:name>
			<arco-arco:startTime>
				<xsl:value-of select="./LRIK, '/', ./LRIN, '/', ./LRIC, '/', ./LRIQ" />
			</arco-arco:startTime>
			<arco-arco:endTime>
				<xsl:value-of select="./LRIK, '/', ./LRIN, '/', ./LRIC, '/', ./LRIQ" />
			</arco-arco:endTime>
		</rdf:Description>
		</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="record/metadata/schede/*/LR/LRI/LRIG">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
                	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(.))" />
                </xsl:attribute>
	            <rdf:type>
					<xsl:attribute name="rdf:resource">
	    	        	<xsl:value-of	select="'https://w3id.org/italia/onto/CPV/Person'" />
					</xsl:attribute>
				</rdf:type>   
				<rdfs:label>
					<xsl:value-of select="." />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="." />
				</l0:name>
			</rdf:Description>
	</xsl:for-each>
	<xsl:if test="$sheetType='BNM' or $sheetType='BNPE' or $sheetType='BNPL' or $sheetType='BNZ'">
		<xsl:variable name="aco" select="arco-fn:urify(record/metadata/schede/*/AC/ACO)"></xsl:variable>
		<xsl:variable name="acm" select="arco-fn:urify(record/metadata/schede/*/AC/ACM)"></xsl:variable>
		<xsl:variable name="ldcm" select="arco-fn:urify(record/metadata/schede/*/LC/LDC/LDCM)"></xsl:variable>
		<xsl:variable name="pvcc" select="arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCC)"></xsl:variable>
		<xsl:variable name="ecp" select="record/metadata/schede/*/CD/ECP"></xsl:variable>
		<xsl:variable name="ogtc" select="record/metadata/schede/*/OG/OGT/OGTC"></xsl:variable>				
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="$specimencollection" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of	select="'https://w3id.org/arco/ontology/natural-specimen-description/SpecimenCollection'" />
				</xsl:attribute>
			</rdf:type>
			<xsl:choose> 
				<xsl:when test="record/metadata/schede/*/OG/OGT/OGTC">
					<rdfs:label>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTC)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(record/metadata/schede/*/OG/OGT/OGTC)" />
					</l0:name>
				</xsl:when>
				<xsl:otherwise>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Specimen collection ', record/metadata/schede/*/AC/ACO)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Specimen collection ', record/metadata/schede/*/AC/ACO)" />
					</l0:name>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Collezione di beni naturalistici ', record/metadata/schede/*/AC/ACO)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Collezione di beni naturalistici ', record/metadata/schede/*/AC/ACO)" />
					</l0:name>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="record/metadata/schede/*/AC/ACO">
				<arco-lite:localIdentifier>
               		<xsl:value-of select="record/metadata/schede/*/AC/ACO" />
				</arco-lite:localIdentifier>
				<arco-core:hasIdentifier>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'CollectionIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/*/AC/ACO))" />
					</xsl:attribute>
				</arco-core:hasIdentifier>
			</xsl:if>
		</rdf:Description>
		<xsl:if test="record/metadata/schede/*/AC/ACO">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'CollectionIdentifier/', $itemURI, arco-fn:arcofy(record/metadata/schede/*/AC/ACO))" />
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
					<xsl:value-of select="record/metadata/schede/*/AC/ACO" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="record/metadata/schede/*/AC/ACO" />
				</l0:name>
				<l0:identifier>
					<xsl:value-of select="record/metadata/schede/*/AC/ACO" />
				</l0:identifier>
				<arco-core:current>
					<xsl:value-of select="true()" />
				</arco-core:current>
			</rdf:Description>
		</xsl:if>
	</xsl:if>
				<!-- natural heritage collection membership membership -->
 	<xsl:if test="$sheetType='BNM' or $sheetType='BNPE' or $sheetType='BNPL' or $sheetType='BNZ'">
	<xsl:variable name="aco" select="arco-fn:urify(record/metadata/schede/*/AC/ACO)"></xsl:variable>
			<xsl:variable name="acm" select="arco-fn:urify(record/metadata/schede/*/AC/ACM)"></xsl:variable>
			<xsl:variable name="ldcm" select="arco-fn:urify(record/metadata/schede/*/LC/LDC/LDCM)"></xsl:variable>
			<xsl:variable name="pvcc" select="arco-fn:urify(record/metadata/schede/*/LC/PVC/PVCC)"></xsl:variable>
			<xsl:variable name="ecp" select="record/metadata/schede/*/CD/ECP"></xsl:variable>
			<xsl:variable name="ogtc" select="record/metadata/schede/*/OG/OGT/OGTC"></xsl:variable>	
		<rdf:Description>
			<xsl:attribute name="rdf:about">
				<xsl:value-of select="concat($NS, 'CollectionMembership/', $itemURI)" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/CollectionMembership'" />
				</xsl:attribute>
			</rdf:type>
			<rdfs:label xml:lang="it">
				<xsl:value-of select="concat('Appartenenza a collezione naturalistica del bene: ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="it">
				<xsl:value-of select="concat('Appartenenza a collezione naturalistica del bene: ', $itemURI)" />
			</l0:name>
			<rdfs:label xml:lang="en">
				<xsl:value-of select="concat('Specimen membership of cultural property: ', $itemURI)" />
			</rdfs:label>
			<l0:name xml:lang="en">
				<xsl:value-of select="concat('Specimen membership of cultural property: ', $itemURI)" />
			</l0:name>
			<arco-cd:hasCollection>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="$specimencollection" />
				</xsl:attribute>
			</arco-cd:hasCollection>
		</rdf:Description>
	</xsl:if>
	</rdf:RDF>
</xsl:template>
</xsl:stylesheet>