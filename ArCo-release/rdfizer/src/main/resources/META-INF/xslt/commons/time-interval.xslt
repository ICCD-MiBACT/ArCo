<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:f="https://w3id.org/arco/xslt-functions">

	<!-- Helper condivisi per la reificazione dell'intervallo temporale arco:TimeInterval. -->

	<!-- Statere la versione incerta: prefisso "uncertain-" se presente '?' o 'ca' (case-insensitive),
	     altrimenti "<urify(elt)>-", altrimenti ''. -->
	<xsl:function name="f:reliability" as="xs:string">
		<xsl:param name="elt" as="node()*" />
		<xsl:sequence select="if (empty($elt)) then ''
			else if (contains(lower-case(normalize-space($elt)), '?') or contains(lower-case($elt), 'ca')) then 'uncertain-'
			else concat(arco-fn:urify(normalize-space($elt)), '-')" />
	</xsl:function>

	<!-- Frammento: "<normalize-space(elt)>" + separatore se l'elemento è presente (con urify opzionale), altrimenti ''. -->
	<xsl:function name="f:fragment" as="xs:string">
		<xsl:param name="elt" as="node()*" />
		<xsl:param name="sep" as="xs:string" />
		<xsl:param name="urify" as="xs:boolean" />
		<xsl:variable name="value" select="normalize-space($elt)" />
		<xsl:sequence select="if (empty($elt)) then ''
			else concat(if ($urify) then arco-fn:urify($value) else $value, $sep)" />
	</xsl:function>

	<!-- TEMPLATE "timeIntervalResource" -->
	<xsl:template name="timeIntervalResource">

		<xsl:variable name="relv" select="f:reliability(./REL/RELV)" />
		<xsl:variable name="relw" select="f:reliability(./REL/RELW)" />
		<xsl:variable name="relf" select="f:fragment(./REL/RELF, '-', true())" />
		<xsl:variable name="revv" select="f:reliability(./REV/REVV)" />
		<xsl:variable name="revw" select="f:reliability(./REV/REVW)" />
		<xsl:variable name="revf" select="f:fragment(./REV/REVF, '-', true())" />
		<xsl:variable name="rels" select="concat(if (./REL/RELW) then $relw else $relv, $relf, arco-fn:urify(normalize-space(./REL/RELS)))" />
		<xsl:variable name="revs" select="concat(if (./REV/REVW) then $revw else $revv, $revf, arco-fn:urify(normalize-space(./REV/REVS)))" />
		<xsl:variable name="relx" select="f:reliability(./REL/RELX)" />
		<xsl:variable name="revx" select="f:reliability(./REV/REVX)" />

		<xsl:attribute name="rdf:resource">
			<xsl:choose>
				<xsl:when test="./REL/RELS and not(./REV/REVS)">
					<xsl:value-of select="concat($NS, 'TimeInterval/', $rels, '-', $revx, arco-fn:urify(normalize-space(./REV/REVI)))" />
				</xsl:when>
				<xsl:when test="./REV/REVS and not(./REL/RELS)">
					<xsl:value-of select="concat($NS, 'TimeInterval/', $relx, arco-fn:urify(normalize-space(./REL/RELI)), '-', $revs)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($NS, 'TimeInterval/', $rels, '-', $revs)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>

	<!-- TEMPLATE "timeIntervalValue" -->
	<xsl:template name="timeIntervalValue">

		<xsl:variable name="relv" select="f:fragment(./REL/RELV, ' ', false())" />
		<xsl:variable name="relw" select="f:fragment(./REL/RELW, ' ', false())" />
		<xsl:variable name="relf" select="f:fragment(./REL/RELF, ' ', false())" />
		<xsl:variable name="revv" select="f:fragment(./REV/REVV, ' ', false())" />
		<xsl:variable name="revw" select="f:fragment(./REV/REVW, ' ', false())" />
		<xsl:variable name="revf" select="f:fragment(./REV/REVF, ' ', false())" />
		<xsl:variable name="rels" select="concat(if (./REL/RELW) then $relw else $relv, $relf, normalize-space(./REL/RELS))" />
		<xsl:variable name="revs" select="concat(if (./REV/REVW) then $revw else $revv, $revf, normalize-space(./REV/REVS))" />
		<xsl:variable name="relx" select="f:fragment(./REL/RELX, ' ', false())" />
		<xsl:variable name="revx" select="f:fragment(./REV/REVX, ' ', false())" />

		<xsl:choose>
			<xsl:when test="./REL/RELS and not(./REV/REVS)">
				<xsl:value-of select="concat($rels, ' - ', $revx, normalize-space(./REV/REVI))" />
			</xsl:when>
			<xsl:when test="./REV/REVS and not(./REL/RELS)">
				<xsl:value-of select="concat($relx, normalize-space(./REL/RELI), ' - ', $revs)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($rels, ' - ', $revs)" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>