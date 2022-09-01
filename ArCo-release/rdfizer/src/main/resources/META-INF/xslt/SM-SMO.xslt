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
			<xsl:for-each select="rrecord/metadata/schede/SM/MU">
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
			</xsl:for-each>
			<xsl:for-each select="rrecord/metadata/schede/SM/OS">
				<arco-cd:hasUse>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Use/', $itemURI, '-orchestra-', position())" />
					</xsl:attribute>
				</arco-cd:hasUse>
				<arco-lite:hasUser>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat($NS, 'Agent/', arco-fn:arcofy(./OSD))" />
					</xsl:attribute>
				</arco-lite:hasUser>
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
	</xsl:if>
	</rdf:RDF>
</xsl:template>								
</xsl:stylesheet>