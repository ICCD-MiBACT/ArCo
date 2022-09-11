<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:arco-core="https://w3id.org/arco/ontology/core/"
	xmlns:arco-arco="https://w3id.org/arco/ontology/arco/"
	xmlns:arco-lite="https://w3id.org/arco/ontology/arco-lite/"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:arco-mi="https://w3id.org/arco/ontology/musical-instrument/"
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
	
	<xsl:if test="$sheetType='SM'">			
		<rdf:Description>
			<xsl:attribute name="rdf:about">
        		<xsl:value-of select="$culturalProperty" />
			</xsl:attribute>
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:value-of select="'https://w3id.org/arco/ontology/arco/MusicalHeritage'" />
				</xsl:attribute>
			</rdf:type>
			<xsl:for-each select="record/metadata/schede/SM/CL/CHS">
				<arco-core:isClassifiedBy>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'HornbostelSachsClass/', arco-fn:urify(normalize-space(./CHSN)))" />
		    		</xsl:attribute>
				</arco-core:isClassifiedBy>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/SM/CL/CLA">
				<arco-core:isClassifiedBy>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat($NS,'MusicalInstrumentClass/', arco-fn:urify(normalize-space(./CLAA)), arco-fn:urify(normalize-space(./CLAT)))" />
		    		</xsl:attribute>
				</arco-core:isClassifiedBy>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/SM/CL/CLA/CLAO">
				<arco-core:note>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat('Nota relativa alla classe dello strumeto musicale. ', normalize-space(.))" />
		    		</xsl:attribute>
				</arco-core:note>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/SM/CL/CHS/CHSS">
				<arco-core:note>
					<xsl:attribute name="rdf:resource">
		    			<xsl:value-of select="concat('Nota relativa alla classe dello strumeto musicale. ', normalize-space(.))" />
		    		</xsl:attribute>
				</arco-core:note>
			</xsl:for-each>
			<xsl:if test="record/metadata/schede/SM/AA/AAE">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
	    	            <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 					</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
				<arco-lite:hasExstension>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/SM/AA/AAE)))" />
            		</xsl:attribute>
				</arco-lite:hasExstension>
			</xsl:if>
			<xsl:if test="record/metadata/schede/SM/AA/AAC">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
	    	            <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 					</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
				<arco-lite:hasDiapason>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/SM/AA/AAC)))" />
            		</xsl:attribute>
				</arco-lite:hasDiapason>
			</xsl:if>
			<xsl:if test="record/metadata/schede/SM/AA/AAP">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
	    	            <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 					</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
				<arco-lite:hasTemperament>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/SM/AA/AAP)))" />
            		</xsl:attribute>
				</arco-lite:hasTemperament>
			</xsl:if>
			<xsl:if test="record/metadata/schede/SM/AA/AAA">
				<arco-dd:hasTechnicalStatus>
					<xsl:attribute name="rdf:resource">
	    	            <xsl:value-of select="concat($NS, 'TechnicalStatus/', $itemURI)" />
 					</xsl:attribute>
				</arco-dd:hasTechnicalStatus>
				<arco-lite:hasTuning>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/SM/AA/AAA)))" />
            		</xsl:attribute>
				</arco-lite:hasTuning>
			</xsl:if>
			<xsl:if test="record/metadata/schede/SM/AA/AAN">
			<xsl:variable name="intero" select="record/metadata/schede/SM/AA/AAN" />
			<xsl:variable name="note" select="translate($intero, ' ', ',')" />
			<xsl:variable name="notesplit" select="arco-fn:split($note)" />
				<xsl:for-each select="$notesplit">
					<arco-mi:producesMusicalNote>
						<xsl:attribute name="rdf:resource">
    	    				<xsl:value-of select="concat($NS, 'MusicalNote/', arco-fn:arcofy(.))" />
						</xsl:attribute>
					</arco-mi:producesMusicalNote>
				</xsl:for-each>
			</xsl:if>
			<xsl:for-each select="record/metadata/schede/SM/AA/AAL">
				<arco-mi:hasString>
					<xsl:attribute name="rdf:resource">
            			<xsl:value-of select="concat($NS, 'String/', $itemURI, '-', position())" />
            		</xsl:attribute>
				</arco-mi:hasString>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/SM/MU">
				<arco-cd:hasUse>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-musician-', position())" />
					</xsl:attribute>
				</arco-cd:hasUse>
				<arco-lite:hasUser>
					<xsl:choose>
						<xsl:when test="./MUT/MUTN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./MUT/MUTN))" />
							</xsl:attribute>						
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./MUT/MUTI, ./MUT/MUTZ, ./MUT/MUTB, ./MUT/MUTM)))" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-lite:hasUser>
				<arco-lite:hasMusician>
					<xsl:choose>
						<xsl:when test="./MUT/MUTN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./MUT/MUTN))" />
							</xsl:attribute>						
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./MUT/MUTI, ./MUT/MUTZ, ./MUT/MUTB, ./MUT/MUTM)))" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-lite:hasMusician>
			</xsl:for-each>
			<xsl:for-each select="record/metadata/schede/SM/OS">
				<arco-cd:hasUse>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-ensemble-', position())" />
					</xsl:attribute>
				</arco-cd:hasUse>
				<arco-lite:hasUser>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./OSD))" />
					</xsl:attribute>
				</arco-lite:hasUser>
				<arco-lite:hasMusician>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./OSD))" />
					</xsl:attribute>
				</arco-lite:hasMusician>
			</xsl:for-each>
		</rdf:Description>
		<!-- musical instrument class -->
		<xsl:for-each select="record/metadata/schede/SM/CL/CHS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'HornbostelSachsClass/', arco-fn:urify(normalize-space(./CHSN)))" />
			    </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        		       	<xsl:value-of select="'https://w3id.org/arco/ontology/musical-istrument/HornbostelSachsClass'" />
            		</xsl:attribute>
				</rdf:type>
				<rdfs:label>
	   				<xsl:value-of select="./CHSN" />
		   		</rdfs:label>
				<l0:name>
					<xsl:value-of select="./CHSN" />
	   			</l0:name>
	   			<arco-core:refersToClassificationSystem>
					<xsl:attribute name="rdf:resource">
			    		<xsl:value-of select="concat($NS,'Hornbosel-SachsClassificationSystem')" />
			    	</xsl:attribute>
				</arco-core:refersToClassificationSystem>
	   			<arco-mi:HSNumber>
					<xsl:value-of select="./CHSN" />
	   			</arco-mi:HSNumber>
	   			<xsl:if test="./CHSD">
		   			<arco-mi:HSDefinition>
						<xsl:value-of select="./CHSD" />
	   				</arco-mi:HSDefinition>
	   			</xsl:if>
	   			<xsl:if test="./CHSE">
		   			<arco-mi:HSEdition>
						<xsl:value-of select="./CHSE" />
	   				</arco-mi:HSEdition>
	   			</xsl:if>
		   </rdf:Description>
		   <rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'Hornbosel-SachsClassificationSystem')" />
			    </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        		       	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationSystem'" />
            		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
	   				<xsl:value-of select="'Hornbosel-Sachs Classification System'" />
		   		</rdfs:label>
		   		<rdfs:label xml:lang="it">
	   				<xsl:value-of select="'Sistema di classificazione Hornbosel-Sachs'" />
		   		</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="'Hornbosel-Sachs Classification System'" />
	   			</l0:name >
	   			<l0:name xml:lang="it">
					<xsl:value-of select="'Sistema di classificazione Hornbosel-Sachs'" />
	   			</l0:name >
	   		</rdf:Description>
		</xsl:for-each>
		<xsl:for-each select="record/metadata/schede/SM/CL/CLA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'MusicalInstrumentClass/', arco-fn:urify(normalize-space(./CLAA)), arco-fn:urify(normalize-space(./CLAT)))" />
			    </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        		       	<xsl:value-of select="'https://w3id.org/arco/ontology/musical-istrument/MusicalInstrumentClass'" />
            		</xsl:attribute>
				</rdf:type>
				<rdfs:label>
	   				<xsl:value-of select="./CLAT" />
		   		</rdfs:label>
				<l0:name>
					<xsl:value-of select="./CLAT" />
	   			</l0:name>
	   			<arco-core:refersToClassificationSystem>
					<xsl:attribute name="rdf:resource">
			    		<xsl:value-of select="concat($NS,'ClassificationSystem/', arco-fn:urify(normalize-space(./CLAA)))" />
			    	</xsl:attribute>
				</arco-core:refersToClassificationSystem>
		   </rdf:Description>
		   <rdf:Description>
				<xsl:attribute name="rdf:about">
		    		<xsl:value-of select="concat($NS,'ClassificationSystem/', arco-fn:urify(normalize-space(./CLAA)))" />
			    </xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
        		       	<xsl:value-of select="'https://w3id.org/arco/ontology/core/ClassificationSystem'" />
            		</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="en">
	   				<xsl:value-of select="concat(normalize-space(./CLAA),' Classification System')" />
		   		</rdfs:label>
		   		<rdfs:label xml:lang="it">
	   				<xsl:value-of select="concat('Sistema di classificazione ', normalize-space(./CLAA))" />
		   		</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat(normalize-space(./CLAA),' Classification System')" />
	   			</l0:name >
	   			<l0:name xml:lang="it">
					<xsl:value-of select="concat('Sistema di classificazione ', normalize-space(./CLAA))" />
	   			</l0:name >
	   			<arco-lite:hasAuthor>
					<xsl:attribute name="rdf:resource">
			            <xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CLAA))" />
			        </xsl:attribute>
	   			</arco-lite:hasAuthor>
	   			<xsl:if test="./CLAR">
					<arco-cd:hasBibliography>
						<xsl:attribute name="rdf:resource">
            				<xsl:value-of select="concat($NS, 'Bibliography/', arco-fn:arcofy(./CLAR))" />
            			</xsl:attribute>
					</arco-cd:hasBibliography>
				</xsl:if>
	   		</rdf:Description>
	   		<!-- agent as an indiviual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
	            	<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./CLAA))" />
	            </xsl:attribute>
				<rdfs:label>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./CLAA)" />
					</xsl:call-template>
				</rdfs:label>
				<l0:name>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="text" select="normalize-space(./CLAA)" />
					</xsl:call-template>
				</l0:name>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>
			</rdf:Description>
			<!-- bibliography as an indiviual -->
			<xsl:if test="./CLAR">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
		            	<xsl:value-of select="concat($NS, 'Bibliography/', arco-fn:arcofy(./CLAR))" />
	    	        </xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	                		<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Bibliography'" />
	                	</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Bibliografia relativa al sistema di classificazione ', normalize-space(./CLAA))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Bibliografia relativa al sistema di classificazione ', normalize-space(./CLAA))" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Bibliography about the classification system ', normalize-space(./CLAA))" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Bibliography about the classification system ', normalize-space(./CLAA))" />
					</l0:name>
					<arco-cd:completeBibliographicReference>
						<xsl:value-of select="normalize-space(./CLAR)" />
					</arco-cd:completeBibliographicReference>
			</rdf:Description>
			</xsl:if>
		</xsl:for-each>
		<!-- Cultural entity technical status -->
		<xsl:if test="record/metadata/schede/SM/AA/AAE or record/metadata/schede/SM/AA/AAC or record/metadata/schede/SM/AA/AAP or record/metadata/schede/SM/AA/AAA">
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
				<xsl:if test="record/metadata/schede/SM/AA/AAE">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/SM/AA/AAE)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SM/AA/AAC">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/SM/AA/AAC)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SM/AA/AAP">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/SM/AA/AAP)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
				<xsl:if test="record/metadata/schede/SM/AA/AAA">
					<arco-dd:includesTechnicalCharacteristic>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/SM/AA/AAA)))" />
						</xsl:attribute>
					</arco-dd:includesTechnicalCharacteristic>
				</xsl:if>
			</rdf:Description>
		</xsl:if>
		<!-- Technical characteristic as individual -->
		<xsl:if test="record/metadata/schede/SM/AA/AAE">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/SM/AA/AAE)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/SM/AA/AAE)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/SM/AA/AAE)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/musical-instrument/Extension'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/SM/AA/AAC">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/SM/AA/AAC)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/SM/AA/AAC)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/SM/AA/AAC)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/musical-instrument/Diapason'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/SM/AA/AAP">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/SM/AA/AAP)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/SM/AA/AAP)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/SM/AA/AAP)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/musical-instrument/Temperament'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<xsl:if test="record/metadata/schede/SM/AA/AAA">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'TechnicalCharacteristic/', arco-fn:urify(normalize-space(record/metadata/schede/SM/AA/AAA)))" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/TechnicalCharacteristic'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(record/metadata/schede/SM/AA/AAA)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space(record/metadata/schede/SM/AA/AAA)" />
				</l0:name>
				<arco-dd:isCharacteristicClassifiedBy>
					<xsl:attribute name="rdf:resource">
          				<xsl:value-of select="'https://w3id.org/arco/ontology/musical-instrument/Tuning'" />
	          		</xsl:attribute>
				</arco-dd:isCharacteristicClassifiedBy>
			</rdf:Description>
		</xsl:if>
		<!-- string as individual -->
		<xsl:for-each select="record/metadata/schede/SM/AA/AAL">
			<xsl:variable name="string">
				<xsl:value-of select="substring-before((.), '=')"/>
 			</xsl:variable>
 			<xsl:variable name="measure">
				<xsl:value-of select="substring-after((.), '=')"/>
 			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
            		<xsl:value-of select="concat($NS, 'String/', $itemURI, '-', position())" />
	         	</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/musical-instrument/String'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space($string)" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="normalize-space($string)" />
				</l0:name>
				<arco-dd:hasMeasurementCollection>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-String', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurementCollection>
				<!-- il campo è composto da corda = lunghezza in mm.Trovare un modo per splittare -->
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'MeasurementCollection/', $itemURI, '-String', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
               			<xsl:value-of select="'https://w3id.org/arco/ontology/denotative-description/MeasurementCollection'" />
	               	</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Misure della corda ', position(), ' del bene culturale ', $itemURI" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="'Misure della corda ', position(), ' del bene culturale ', $itemURI" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Measuerements of string ', position(), ' of cultural property ', $itemURI" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="'Measuerements of string ', position(), ' of cultural property ', $itemURI" />
				</l0:name>
				<arco-dd:hasMeasurement>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Measurement/', $itemURI, '-String', position())" />
					</xsl:attribute>
				</arco-dd:hasMeasurement>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about" select="concat($NS, 'Measurement/', $itemURI, '-String', position())" />
				<rdf:type rdf:resource="https://w3id.org/arco/ontology/denotative-description/Measurement" />
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Measurement of string ', position(), ' of cultural property ', $itemURI, ': ', (.))" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Measurement of string ', position(), ' of cultural property ', $itemURI, ': ', (.))" />
				</l0:name>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Misura della corda ', position(), ' del bene culturale ', $itemURI, ': ', (.))" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Misura della corda ', position(), ' del bene culturale ', $itemURI, ': ', (.))" />
				</l0:name>
				<arco-dd:hasMeasurementType>
					<xsl:attribute name="rdf:resource" select="concat('https://w3id.org/arco/ontology/denotative-description/', 'Length')" />
				</arco-dd:hasMeasurementType>
				<arco-dd:hasValue>
					<xsl:attribute name="rdf:resource" select="concat($NS, 'Value/', arco-fn:urify(normalize-space($measure)))" />
				</arco-dd:hasValue>
				<mu:hasMeasurementUnit>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'MeasurementUnit/mm')" />
					</xsl:attribute>
				</mu:hasMeasurementUnit>
			</rdf:Description>
		</xsl:for-each>
		<!-- musical note -->
		<xsl:if test="record/metadata/schede/SM/AA/AAN">
			<xsl:variable name="intero" select="record/metadata/schede/SM/AA/AAN" />
			<xsl:variable name="note" select="translate($intero, ' ', ',')" />
			<xsl:variable name="notesplit" select="arco-fn:split($note)" />
			<xsl:for-each select="$notesplit">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
            			<xsl:value-of select="concat($NS, 'MusicalNote/', arco-fn:arcofy(.))" />
			       	</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/musical-instrument/MusicalNote'" />
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
		</xsl:if>
		<!-- musician -->
		<xsl:for-each select="record/metadata/schede/SM/MU">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-musician-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Use'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Uso ', position(), ' del bene: ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Use ', position(), ' of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Uso ', position(), ' del bene: ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Use ', position(), ' of cultural property: ', $itemURI)" />
				</l0:name>
				<arco-core:hasAgentRole>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-musician')" />
					</xsl:attribute>
				</arco-core:hasAgentRole>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-musician')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Musicista ', position(), ' del bene culturale ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Musician ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Musicista ', position(), ' del bene culturale ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Musician ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<!-- hasRole -->
				<xsl:if test="./MUT/MUTI">
					<arco-core:hasRole>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./MUT/MUTI)) )" />
						</xsl:attribute>
					</arco-core:hasRole>
				</xsl:if>
				<arco-core:hasAgent>
					<xsl:choose>
						<xsl:when test="./MUT/MUTN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./MUT/MUTN))" />
							</xsl:attribute>						
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:resource">
								<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./MUT/MUTI, ./MUT/MUTZ, ./MUT/MUTB, ./MUT/MUTM)))" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</arco-core:hasAgent>
			</rdf:Description>
			<!-- role as an individual -->
			<xsl:if test="./MUT/MUTI">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Role/', arco-fn:urify(normalize-space(./MUT/MUTI)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./MUT/MUTI)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./MUT/MUTI)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- agent as an indiviual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:choose>
						<xsl:when test="./MUT/MUTN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./MUT/MUTN))" />					
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(concat(./MUT/MUTI, ./MUT/MUTZ, ./MUT/MUTB, ./MUT/MUTM)))" />
						</xsl:otherwise>
					</xsl:choose>
	           	</xsl:attribute>
				<rdfs:label>
					<xsl:choose>
						<xsl:when test="./MUT/MUTN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./MUT/MUTN)" />
							</xsl:call-template>				
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(./MUT/MUTI)" />
						</xsl:otherwise>
					</xsl:choose>
				</rdfs:label>
				<l0:name>
					<xsl:choose>
						<xsl:when test="./MUT/MUTN[not(starts-with(lower-case(normalize-space()), 'nr')) and not(starts-with(lower-case(normalize-space()), 'n.r'))]">
							<xsl:call-template name="CamelCase">
								<xsl:with-param name="text" select="normalize-space(./MUT/MUTN)" />
							</xsl:call-template>				
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="normalize-space(./MUT/MUTI)" />
						</xsl:otherwise>
					</xsl:choose>
				</l0:name>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Agent'" />
					</xsl:attribute>
				</rdf:type>
				<xsl:if test="./MUT/MUTZ">
					<arco-cd:nationality>
						<xsl:value-of select="./MUT/MUTZ" />
					</arco-cd:nationality>
				</xsl:if>
				<xsl:if test="./MUT/MUTO">
					<arco-core:note>
						<xsl:value-of select="concat('Scolarità: ', ./MUT/MUTO)" />
					</arco-core:note>
				</xsl:if>
				<xsl:if test="./ATTM and (not(starts-with(lower-case(normalize-space(./ATTM)), 'nr')) and not(starts-with(lower-case(normalize-space(./ATTM)), 'n.r')))">
					<arco-cd:hasProfession>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(./ATTM)))" />
						</xsl:attribute>
					</arco-cd:hasProfession>
				</xsl:if>
				<xsl:if test="./MUT/MUTB">
					<arco-core:note>
						<xsl:value-of select="concat('Contesto culturale: ', ./MUT/MUTB)" />
					</arco-core:note>
				</xsl:if>
				<!-- sex -->
				<xsl:if test="./MUT/MUTS">
					<arco-cd:hasSex>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS,'Sex/', arco-fn:arcofy(normalize-space(./MUT/MUTS)))" />
						</xsl:attribute>
					</arco-cd:hasSex>
				</xsl:if>
				<!-- age -->
				<xsl:if test="./MUT/MUTE">
					<arco-cd:hasAge>
						<xsl:attribute name="rdf:resource">
            	   			<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./MUT/MUTE)))" />
               			</xsl:attribute>
					</arco-cd:hasAge>
					<arco-lite:age>
						<xsl:attribute name="rdf:resource">
            	   			<xsl:value-of select="arco-fn:arcofy(normalize-space(./MUT/MUTE))" />
               			</xsl:attribute>
					</arco-lite:age>
					<arco-cd:isSubjectOfInterpretation>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AgeInterpetation/', $itemURI, '-', arco-fn:urify(./MUT/MUTE))" />
						</xsl:attribute>
					</arco-cd:isSubjectOfInterpretation>
				</xsl:if>
				<!-- birth place -->
				<xsl:if test="./DNA/DNAP or ./DNA/DNAC or ./DNA/DNAE">
					<CPV:hasBirthPlace>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Location/', arco-fn:arcofy(normalize-space(concat(./DNAS, ./DNAR, ./DNAP, ./DNAC, ./DNAE))))" />
						</xsl:attribute>
					</CPV:hasBirthPlace>
				</xsl:if>
				<!-- domicile -->
				<xsl:if test="./DML">
					<arco-cd:hasDomicile>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Location/', arco-fn:arcofy(normalize-space(./MUT/MUTN)), '-domicile')" />
						</xsl:attribute>
					</arco-cd:hasDomicile>
				</xsl:if>
				<!-- date Of Birth -->
				<xsl:if test="./DNA/DNAN">
					<CPV:dateOfBirth>
						<xsl:value-of select="./DNA/DNAN" />
					</CPV:dateOfBirth>
				</xsl:if>
			</rdf:Description>
			<!-- profession of user as an individual -->
			<xsl:if test="./ATTM and (not(starts-with(lower-case(normalize-space(./ATTM)), 'nr')) and not(starts-with(lower-case(normalize-space(./ATTM)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Profession/', arco-fn:urify(normalize-space(./ATTM)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Profession'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./ATTM)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./ATTM)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- sex as individual -->
			<xsl:if test="./MUT/MUTS">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Sex/', arco-fn:arcofy(normalize-space(./MUT/MUTS)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Sex'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./MUT/MUTS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./MUT/MUTS)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- age interpretation as individual -->
			<xsl:if test="./MUT/MUTE">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AgeInterpetation/', $itemURI, '-', arco-fn:urify(./MUT/MUTE))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Interpretation'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Interpretazione relativa alla età di  ', normalize-space(./MUT/MUTN))" />
					</rdfs:label>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Interpretation of age of ', normalize-space(./MUT/MUTN))" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Interpretazione relativa alla età di  ', normalize-space(./MUT/MUTN))" />
					</l0:name>
					<l0:name xml:lang="en">
						<xsl:value-of select="concat('Interpretation of age of ', normalize-space(./MUT/MUTN))" />
					</l0:name>
					<arco-cd:involvesEntity>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./MUT/MUTE)))" />
						</xsl:attribute>
					</arco-cd:involvesEntity>
					<arco-cd:hasInterpretationCriterion>
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./MUT/MUTE)), 'ca')">
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'InterpretationCriterion/CataloguerAttribution')" />
								</xsl:attribute>
							</xsl:when>
							<xsl:otherwise>
								<xsl:attribute name="rdf:resource">
									<xsl:value-of select="concat($NS, 'InterpretationCriterion/AgentDeclaration')" />
								</xsl:attribute>
							</xsl:otherwise>
						</xsl:choose>
					</arco-cd:hasInterpretationCriterion>
				</rdf:Description>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
				    	<xsl:value-of select="concat($NS, 'Age/', arco-fn:arcofy(normalize-space(./MUT/MUTE)))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
	            			<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Age'" />
			            </xsl:attribute>
					</rdf:type>
					<rdfs:label xml:lang="it">
						<xsl:value-of select="concat('Età dell&quot;agente principale ', ./MUT/MUTN)" />
					</rdfs:label>
					<l0:name xml:lang="it">
						<xsl:value-of select="concat('Età dell&quot;agente principale ', ./MUT/MUTN)" />
					</l0:name>
					<rdfs:label xml:lang="en">
						<xsl:value-of select="concat('Age of main agent ', ./MUT/MUTN)" />
					</rdfs:label>
					<l0:name xml:lang="en">
						<xsl:value-of	select="concat('Age of main agent ', ./MUT/MUTN)" />
					</l0:name>
					<arco-cd:ageValue>
						<xsl:value-of select="normalize-space(./MUT/MUTE)" />
					</arco-cd:ageValue>
					<arco-core:hasType>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/ChronologicalAge'" />
						</xsl:attribute>
					</arco-core:hasType>
				</rdf:Description>
				<rdf:Description>
					<xsl:choose>
						<xsl:when test="contains(lower-case(normalize-space(./MUT/MUTE)), 'ca')">
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'InterpretationCriterion/CataloguerAttribution')" />
							</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="rdf:about">
								<xsl:value-of select="concat($NS, 'InterpretationCriterion/AgentDeclaration')" />
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/InterpretationCriterion'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label  xml:lang="it">
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./MUT/MUTE)), 'ca')">
								<xsl:value-of select="'attribuzione del catalogatore'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'agent declaration'" />
							</xsl:otherwise>
						</xsl:choose>
					</rdfs:label>
					<rdfs:label  xml:lang="en">
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./MUT/MUTE)), 'ca')">
								<xsl:value-of select="'cataloguer attribution'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'agent declaration'" />
							</xsl:otherwise>
						</xsl:choose>
					</rdfs:label>
					<l0:name  xml:lang="it">
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./MUT/MUTE)), 'ca')">
								<xsl:value-of select="'attribuzione del catalogatore'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'agent declaration'" />
							</xsl:otherwise>
						</xsl:choose>
					</l0:name>
					<l0:name  xml:lang="en">
						<xsl:choose>
							<xsl:when test="contains(lower-case(normalize-space(./MUT/MUTE)), 'ca')">
								<xsl:value-of select="'cataloguer attribution'" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'agent declaration'" />
							</xsl:otherwise>
						</xsl:choose>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- birth place -->
			<xsl:if test="./DNA/DNAP or ./DNA/DNAC or ./DNA/DNAE">
			<xsl:variable name="location">
				<xsl:value-of select="concat($NS, 'Feature/', arco-fn:arcofy(normalize-space(concat(./DNAS, ./DNAR, ./DNAP, ./DNAC, ./DNAE))))" />
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Location/', arco-fn:arcofy(normalize-space(concat(./DNAS, ./DNAR, ./DNAP, ./DNAC, ./DNAE))))" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Location'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Luogo di nascita di ', ./MUT/MUTN)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Luogo di nascita di ', ./MUT/MUTN)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Birth place of ', ./MUT/MUTN)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Birth place of ', ./MUT/MUTN)" />
				</l0:name>
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
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Feature'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:value-of select="normalize-space(./DNA)" />
				</rdfs:label>
				<clvapit:hasAddress>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="./DNA/DNAS and not(lower-case(normalize-space(./DNA/DNAS))='italia')">
								<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DNA/DNAS)), normalize-space(lower-case(./DNA/DNAE)), normalize-space(lower-case(./DNA/DNAP)), normalize-space(lower-case(./DNA/DNAC)))))" />
							</xsl:when>
							<xsl:otherwise>
	               	             <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DNA/DNAP)), normalize-space(lower-case(./DNA/DNAC)))))" />
							</xsl:otherwise>
						</xsl:choose>
                      </xsl:attribute>
				</clvapit:hasAddress>
			</rdf:Description>
			<!-- address -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:choose>
						<xsl:when test="./DNA/DNAS and not(lower-case(normalize-space(./DNA/DNAS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DNA/DNAS)), normalize-space(lower-case(./DNA/DNAE)), normalize-space(lower-case(./DNA/DNAP)), normalize-space(lower-case(./DNA/DNAC)))))" />
						</xsl:when>
						<xsl:otherwise>
	               			<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DNA/DNAP)), normalize-space(lower-case(./DNA/DNAC)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:for-each select="./DNA/*">
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
				<!-- Stato -->
				<xsl:if test="./DNA/DNAS and (not(starts-with(lower-case(normalize-space(./DNA/DNAS)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAS)), 'n.r')))">
					<clvapit:hasCountry>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./DNA/DNAS))" />
						</xsl:attribute>
					</clvapit:hasCountry>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="./DNA/DNAR and (not(starts-with(lower-case(normalize-space(./DNA/DNAR)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAR)), 'n.r')))">
					<xsl:choose>
						<xsl:when test="./DNA/DNAC and (starts-with(lower-case(normalize-space(./DNA/DNAC)), 'firenze') or starts-with(lower-case(normalize-space(./DNA/DNAC)), 'siena') or starts-with(lower-case(normalize-space(./DNA/DNAC)), 'san severino marche') or starts-with(lower-case(normalize-space(./DNA/DNAC)), 'modena'))">	
							<xsl:choose>
								<xsl:when test="./DNA/DNAR and (starts-with(lower-case(normalize-space(./DNA/DNAR)), 'lombardia'))">
								</xsl:when>
								<xsl:otherwise>
									<clvapit:hasRegion>
										<xsl:attribute name="rdf:resource">
            				                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DNA/DNAR))" />
						    		    </xsl:attribute>
									</clvapit:hasRegion>
								</xsl:otherwise>
							</xsl:choose>					
						</xsl:when>
						<xsl:otherwise>
							<clvapit:hasRegion>
								<xsl:attribute name="rdf:resource">
        				            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DNA/DNAR))" />
							    </xsl:attribute>
							</clvapit:hasRegion>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="./DNA/DNAP and (not(starts-with(lower-case(normalize-space(./DNA/DNAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAP)), 'n.r')))">
					<clvapit:hasProvince>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./DNA/DNAP))" />
						</xsl:attribute>
					</clvapit:hasProvince>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="./DNA/DNAC and (not(starts-with(lower-case(normalize-space(./DNA/DNAC)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAC)), 'n.r')))">
					<clvapit:hasCity>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./DNA/DNAC))" />
						</xsl:attribute>
					</clvapit:hasCity>
				</xsl:if>
				<!-- Località -->
				<xsl:if test="./DNA/DNAE and (not(starts-with(lower-case(normalize-space(./DNA/DNAE)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAE)), 'n.r')))">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./DNA/DNAE))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
			</rdf:Description>
			<!-- Country -->
			<xsl:if test="./DNA/DNAS and (not(starts-with(lower-case(normalize-space(./DNA/DNAS)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAS)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./DNA/DNAS))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DNA/DNAS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DNA/DNAS)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Region -->
			<xsl:if test="./DNA/DNAR and (not(starts-with(lower-case(normalize-space(./DNA/DNAR)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAR)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DNA/DNAR))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DNA/DNAR)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DNA/DNAR)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Province -->
			<xsl:if test="./DNA/DNAP and (not(starts-with(lower-case(normalize-space(./DNA/DNAP)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAP)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./DNA/DNAP))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DNA/DNAP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DNA/DNAP)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- City -->
			<xsl:if test="./DNA/DNAC and (not(starts-with(lower-case(normalize-space(./DNA/DNAC)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAC)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./DNA/DNAC))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DNA/DNAC)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DNA/DNAC)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Località (Address Area) -->
			<xsl:if test="./DNA/DNAE and (not(starts-with(lower-case(normalize-space(./DNA/DNAE)), 'nr')) and not(starts-with(lower-case(normalize-space(./DNA/DNAE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./DNA/DNAE))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DNA/DNAE)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DNA/DNAE)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			</xsl:if>
			<!-- domicile -->
			<xsl:if test="./DML">
			<xsl:variable name="location">
				<xsl:value-of select="concat($NS, 'Feature/',arco-fn:arcofy(normalize-space(./DML)))" />
			</xsl:variable>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Location/', arco-fn:arcofy(normalize-space(./MUT/MUTN)), '-birth-place')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/l0/Location'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Domicilio di ', ./MUT/MUTN)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Domicilio di ', ./MUT/MUTN)" />
				</l0:name>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Domicile of ', ./MUT/MUTN)" />
				</rdfs:label>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Domicile of ', ./MUT/MUTN)" />
				</l0:name>
				<arco-location:atLocation>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="$location" />
					</xsl:attribute>
				</arco-location:atLocation>
			</rdf:Description>
			<!-- feature -->
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
					<xsl:value-of select="normalize-space(./DML)" />
				</rdfs:label>
				<clvapit:hasAddress>
					<xsl:attribute name="rdf:resource">
						<xsl:choose>
							<xsl:when test="./DML/DMLS and not(lower-case(normalize-space(./DML/DMLS))='italia')">
								<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DML/DMLS)), normalize-space(lower-case(./DML/DMLE)), normalize-space(lower-case(./DML/DMLP)), normalize-space(lower-case(./DML/DMLC)))))" />
							</xsl:when>
							<xsl:otherwise>
	               	             <xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DML/DMLP)), normalize-space(lower-case(./DML/DMLC)))))" />
							</xsl:otherwise>
						</xsl:choose>
                      </xsl:attribute>
				</clvapit:hasAddress>
			</rdf:Description>
			<!-- address -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:choose>
						<xsl:when test="./DML/DMLS and not(lower-case(normalize-space(./DML/DMLS))='italia')">
							<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DML/DMLS)), normalize-space(lower-case(./DML/DMLE)), normalize-space(lower-case(./DML/DMLP)), normalize-space(lower-case(./DML/DMLC)))))" />
						</xsl:when>
						<xsl:otherwise>
	               			<xsl:value-of select="concat($NS, 'Address/', arco-fn:arcofy(concat(normalize-space(lower-case(./DML/DMLP)), normalize-space(lower-case(./DML/DMLC)))))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Address'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label>
					<xsl:for-each select="./DNA/*">
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
				<!-- Stato -->
				<xsl:if test="./DML/DMLS and (not(starts-with(lower-case(normalize-space(./DML/DMLS)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLS)), 'n.r')))">
					<clvapit:hasCountry>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./DML/DMLS))" />
						</xsl:attribute>
					</clvapit:hasCountry>
				</xsl:if>
				<!-- Regione -->
				<xsl:if test="./DML/DMLR and (not(starts-with(lower-case(normalize-space(./DML/DMLR)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLR)), 'n.r')))">
					<xsl:choose>
						<xsl:when test="./DML/DMLC and (starts-with(lower-case(normalize-space(./DML/DMLC)), 'firenze') or starts-with(lower-case(normalize-space(./DML/DMLC)), 'siena') or starts-with(lower-case(normalize-space(./DML/DMLC)), 'san severino marche') or starts-with(lower-case(normalize-space(./DML/DMLC)), 'modena'))">		
							<xsl:choose>
								<xsl:when test="./DML/DMLR and (starts-with(lower-case(normalize-space(./DML/DMLR)), 'lombardia'))">
								</xsl:when>
								<xsl:otherwise>
									<clvapit:hasRegion>
										<xsl:attribute name="rdf:resource">
            				                 <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DML/DMLR))" />
						    		    </xsl:attribute>
									</clvapit:hasRegion>
								</xsl:otherwise>
							</xsl:choose>					
						</xsl:when>
						<xsl:otherwise>
							<clvapit:hasRegion>
								<xsl:attribute name="rdf:resource">
        				            <xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DML/DMLR))" />
							    </xsl:attribute>
							</clvapit:hasRegion>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<!-- Provincia -->
				<xsl:if test="./DML/DMLP and (not(starts-with(lower-case(normalize-space(./DML/DMLP)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLP)), 'n.r')))">
					<clvapit:hasProvince>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./DML/DMLP))" />
						</xsl:attribute>
					</clvapit:hasProvince>
				</xsl:if>
				<!-- Comune -->
				<xsl:if test="./DML/DMLC and (not(starts-with(lower-case(normalize-space(./DML/DMLC)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLC)), 'n.r')))">
					<clvapit:hasCity>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./DML/DMLC))" />
						</xsl:attribute>
					</clvapit:hasCity>
				</xsl:if>
				<!-- Località -->
				<xsl:if test="./DML/DMLE and (not(starts-with(lower-case(normalize-space(./DML/DMLE)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLE)), 'n.r')))">
					<clvapit:hasAddressArea>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./DML/DMLE))" />
						</xsl:attribute>
					</clvapit:hasAddressArea>
				</xsl:if>
			</rdf:Description>
			<!-- Country -->
			<xsl:if test="./DML/DMLS and (not(starts-with(lower-case(normalize-space(./DML/DMLS)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLS)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Country/', arco-fn:urify(./DML/DMLS))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Country'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DML/DMLS)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DML/DMLS)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Region -->
			<xsl:if test="./DML/DMLR and (not(starts-with(lower-case(normalize-space(./DML/DMLR)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLR)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Region/', arco-fn:urify(./DML/DMLR))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Region'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DML/DMLR)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DML/DMLR)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Province -->
			<xsl:if test="./DML/DMLP and (not(starts-with(lower-case(normalize-space(./DML/DMLP)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLP)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'Province/', arco-fn:urify(./DML/DMLP))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/Province'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:value-of select="normalize-space(./DML/DMLP)" />
					</rdfs:label>
					<l0:name>
						<xsl:value-of select="normalize-space(./DML/DMLP)" />
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- City -->
			<xsl:if test="./DML/DMLC and (not(starts-with(lower-case(normalize-space(./DML/DMLC)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLC)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'City/', arco-fn:urify(./DML/DMLC))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource">
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/City'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DML/DMLC)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DML/DMLC)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			<!-- Località (Address Area) -->
			<xsl:if test="./DML/DMLE and (not(starts-with(lower-case(normalize-space(./DML/DMLE)), 'nr')) and not(starts-with(lower-case(normalize-space(./DML/DMLE)), 'n.r')))">
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:value-of select="concat($NS, 'AddressArea/', arco-fn:urify(./DML/DMLE))" />
					</xsl:attribute>
					<rdf:type>
						<xsl:attribute name="rdf:resource"> 
							<xsl:value-of select="'https://w3id.org/italia/onto/CLV/AddressArea'" />
						</xsl:attribute>
					</rdf:type>
					<rdfs:label>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DML/DMLE)" />
						</xsl:call-template>
					</rdfs:label>
					<l0:name>
						<xsl:call-template name="CamelCase">
							<xsl:with-param name="text" select="normalize-space(./DML/DMLE)" />
						</xsl:call-template>
					</l0:name>
				</rdf:Description>
			</xsl:if>
			</xsl:if>
		</xsl:for-each>
		<!-- ensemble -->
		<xsl:for-each select="record/metadata/schede/SM/OS">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-ensemble-', position())" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/context-description/Use'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Uso ', position(), ' del bene: ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Use ', position(), ' of cultural property: ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Uso ', position(), ' del bene: ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Use ', position(), ' of cultural property: ', $itemURI)" />
				</l0:name>
				<arco-core:hasAgentRole>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-ensemble')" />
					</xsl:attribute>
				</arco-core:hasAgentRole>
			</rdf:Description>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'AgentRole/', $itemURI, position(), '-ensemble')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/arco/ontology/core/AgentRole'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="concat('Organico musicale ', position(), ' del bene culturale ', $itemURI)" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="concat('Ensemble ', position(), ' of cultural property ', $itemURI)" />
				</rdfs:label>
				<l0:name xml:lang="it">
					<xsl:value-of select="concat('Organico musicale ', position(), ' del bene culturale ', $itemURI)" />
				</l0:name>
				<l0:name xml:lang="en">
					<xsl:value-of select="concat('Ensemble ', position(), ' of cultural property ', $itemURI)" />
				</l0:name>
				<arco-core:hasRole>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Role/Ensemble')" />
					</xsl:attribute>
				</arco-core:hasRole>
				<arco-core:hasAgent>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./OSD))" />
					</xsl:attribute>
				</arco-core:hasAgent>
			</rdf:Description>
			<!-- role as an individual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Role/Ensemble')" />
				</xsl:attribute>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/RO/Role'" />
					</xsl:attribute>
				</rdf:type>
				<rdfs:label xml:lang="it">
					<xsl:value-of select="'Organico musicale'" />
				</rdfs:label>
				<rdfs:label xml:lang="en">
					<xsl:value-of select="'Ensemble'" />
				</rdfs:label>
			</rdf:Description>
			<!-- agent as an indiviual -->
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./OSD))" />
	           	</xsl:attribute>
				<rdfs:label>
					<xsl:value-of select="./OSD" />
				</rdfs:label>
				<l0:name>
					<xsl:value-of select="./OSD" />
				</l0:name>
				<rdf:type>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="'https://w3id.org/italia/onto/COV/Group'" />
					</xsl:attribute>
				</rdf:type>
				<xsl:if test="./OSE">
					<arco-cd:contacts>
						<xsl:value-of select="./OSE" />
					</arco-cd:contacts>
				</xsl:if>
				<xsl:if test="./OSA">
					<arco-core:note>
						<xsl:value-of select="./OSA" />
					</arco-core:note>
				</xsl:if>
			</rdf:Description>
		</xsl:for-each>
	</xsl:if>
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>