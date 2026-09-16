<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:arco-fn="https://w3id.org/arco/saxon-extension">

	<!-- TEMPLATE "timeIntervalResource" -->
	<xsl:template name="timeIntervalResource">

		<xsl:variable name="relv">
			<xsl:choose>
				<xsl:when test="./REL/RELV and contains(normalize-space(lower-case(./REL/RELV)), '?') or contains(lower-case(./REL/RELV), 'ca')">
					<xsl:value-of select="'uncertain-'" />
				</xsl:when>
				<xsl:when test="./REL/RELV and not(contains(normalize-space(lower-case(./REL/RELV)), '?') or contains(lower-case(./REL/RELV), 'ca'))">
					<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELV)), '-')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="relw">
			<xsl:choose>
				<xsl:when test="./REL/RELW and contains(normalize-space(lower-case(./REL/RELW)), '?') or contains(lower-case(./REL/RELW), 'ca')">
					<xsl:value-of select="'uncertain-'" />
				</xsl:when>
				<xsl:when test="./REL/RELW and not(contains(normalize-space(lower-case(./REL/RELW)), '?') or contains(lower-case(./REL/RELW), 'ca'))">
					<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELW)), '-')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="relf">
			<xsl:choose>
				<xsl:when test="./REL/RELF">
					<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELF)), '-')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="revv">
			<xsl:choose>
				<xsl:when test="./REV/REVV and contains(normalize-space(lower-case(./REV/REVV)), '?') or contains(lower-case(./REV/REVV), 'ca')">
					<xsl:value-of select="'uncertain-'" />
				</xsl:when>
				<xsl:when test="./REV/REVV and not(contains(normalize-space(lower-case(./REV/REVV)), '?') or contains(lower-case(./REV/REVV), 'ca'))">
					<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVV)), '-')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="revw">
			<xsl:choose>
				<xsl:when test="./REV/REVW and contains(normalize-space(lower-case(./REV/REVW)), '?') or contains(lower-case(./REV/REVW), 'ca')">
					<xsl:value-of select="'uncertain-'" />
				</xsl:when>
				<xsl:when test="./REV/REVW and not(contains(normalize-space(lower-case(./REV/REVW)), '?') or contains(lower-case(./REV/REVW), 'ca'))">
					<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVW)), '-')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="revf">
			<xsl:choose>
				<xsl:when test="./REV/REVF">
					<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVF)), '-')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="rels">
			<xsl:choose>
				<xsl:when test="./REL/RELW">
					<xsl:value-of select="concat($relw, $relf, arco-fn:urify(normalize-space(./REL/RELS)))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($relv, $relf, arco-fn:urify(normalize-space(./REL/RELS)))" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="revs">
			<xsl:choose>
				<xsl:when test="./REV/REVW">
					<xsl:value-of select="concat($revw, $revf, arco-fn:urify(normalize-space(./REV/REVS)))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($revv, $revf, arco-fn:urify(normalize-space(./REV/REVS)))" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="relx">
			<xsl:choose>
				<xsl:when test="./REL/RELX and contains(normalize-space(lower-case(./REL/RELX)), '?') or contains(lower-case(./REL/RELX), 'ca')">
					<xsl:value-of select="'uncertain-'" />
				</xsl:when>
				<xsl:when test="./REL/RELX and not(contains(normalize-space(lower-case(./REL/RELX)), '?') or contains(lower-case(./REL/RELX), 'ca'))">
					<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REL/RELX)), '-')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="revx">
			<xsl:choose>
				<xsl:when test="./REV/REVX and contains(normalize-space(lower-case(./REV/REVX)), '?') or contains(lower-case(./REV/REVX), 'ca')">
					<xsl:value-of select="'uncertain-'" />
				</xsl:when>
				<xsl:when test="./REV/REVX and not(contains(normalize-space(lower-case(./REV/REVX)), '?') or contains(lower-case(./REV/REVX), 'ca'))">
					<xsl:value-of select="concat(arco-fn:urify(normalize-space(./REV/REVX)), '-')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

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

		<xsl:variable name="relv">
			<xsl:choose>
				<xsl:when test="./REL/RELV">
					<xsl:value-of select="concat(normalize-space(./REL/RELV), ' ')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="relw">
			<xsl:choose>
				<xsl:when test="./REL/RELW">
					<xsl:value-of select="concat(normalize-space(./REL/RELW), ' ')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="relf">
			<xsl:choose>
				<xsl:when test="./REL/RELF">
					<xsl:value-of select="concat(normalize-space(./REL/RELF), ' ')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="revv">
			<xsl:choose>
				<xsl:when test="./REV/REVV">
					<xsl:value-of select="concat(normalize-space(./REV/REVV), ' ')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="revw">
			<xsl:choose>
				<xsl:when test="./REV/REVW">
					<xsl:value-of select="concat(normalize-space(./REV/REVW), ' ')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="revf">
			<xsl:choose>
				<xsl:when test="./REV/REVF">
					<xsl:value-of select="concat(normalize-space(./REV/REVF), ' ')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="rels">
			<xsl:choose>
				<xsl:when test="./REL/RELW">
					<xsl:value-of select="concat($relw, $relf, normalize-space(./REL/RELS))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($relv, $relf, normalize-space(./REL/RELS))" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="revs">
			<xsl:choose>
				<xsl:when test="./REV/REVW">
					<xsl:value-of select="concat($revw, $revf, normalize-space(./REV/REVS))" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($revv, $revf, normalize-space(./REV/REVS))" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="relx">
			<xsl:choose>
				<xsl:when test="./REL/RELX">
					<xsl:value-of select="concat(normalize-space(./REL/RELX), ' ')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="revx">
			<xsl:choose>
				<xsl:when test="./REV/REVX">
					<xsl:value-of select="concat(normalize-space(./REV/REVX), ' ')" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="''" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

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
