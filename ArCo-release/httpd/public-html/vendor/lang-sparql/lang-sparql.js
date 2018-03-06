// Copyright (C) 2013 WESO RG, César L.A.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


/**
 * @fileoverview
 * Registers a language handler for SPARQL 1.1 Query Language.
 *
 *
 * To use, include prettify.js and this file in your HTML page.
 * Then put your code in an HTML tag like
 *      <pre class="prettyprint lang-sparql">(my SPARQL code)</pre>
 *
 *
 * http://www.w3.org/TR/sparql11-query/#rDatasetClause is the basis for the grammar
 *
 * Repo: https://raw.github.com/Cesarla/Sparql-Pettify
 *
 * @author info@cesarla.com
 * @author sisa989@gmail.com
 */
PR['registerLangHandler'](
	PR['createSimpleLexer'](
		[
			// Whitespace
			[PR['PR_PLAIN'],	/^[\t\n\r \xA0]+/, null, '\t\n\r \xA0'],
			// A double or single quoted, possibly multi-line, string.
			[PR['PR_STRING'],	/^"(?:[^\\"]|\\.)*(?:"|$)/, null, '"'],
		],
		[
			[PR['PR_KEYWORD'],	/^(?:BASE|PREFIX|SELECT|DISTINCT|REDUCED|CONSTRUCT|WHERE|DESCRIBE|ASK|FROM|NAMED|GROUP|	BY|AS|HAVING|ORDER|BY|ASC|DESC|LIMIT|OFFSET|VALUES|LOAD|SILENT|CLEAR|DROP|CREATE|ADD|MOVE|COPY|INSERT|DELETE|DATA|USING|DEFAULT|GRAPH|ALL|OPTIONAL|SERVICE|BIND|UNDEF|MINUS|FILTER|UNION|a|WITH|CREATE|STR|LANG|LANGMATCHES|DATATYPE|BOUND|IRI|URI|BNODE|RAND|ABS|CEIL|FLOOR|ROUND|CONCAT|STRLEN|UCASE|LCASE|ENCODE_FOR_URI|CONTAINS|STRSTARTS|STRENDS|STRBEFORE|STRAFTER|YEAR|MONTH|DAY|HOURS|MINUTES|SECONDS|TIMEZONE|TZ|NOW|UUID|STRUUID|MD5|SHA1|SHA256|SHA384|SHA512|COALESCE|IF|STRLANG|STRDT|sameTerm|isIRI|isURI|isBLANK|isLITERAL|isNUMERIC|REGEX|SUBSTR|REPLACE|NOT|EXISTS|COUNT|SUM|MIN|MAX|AVG|SAMPLE|GROUP_CONCAT)(?=[^\w-]|$)/i, null],
			// A number is a hex integer literal, a decimal real literal, or in
			//scientific notation.
			[PR['PR_LITERAL'],	/^[+-]?(?:0x[\da-f]+|(?:(?:\.\d+|\d+(?:\.\d*)?)(?:e[+\-]?\d+)?))/i],
			// An identifier
			[PR['PR_PLAIN'],	/^(\_\:[a-z_][\w-]*)|([?][a-z_][\w-]*)/],
			[PR['PR_ATTRIB_VALUE'],	/^[a-z_][\w-]*\:([a-z_A-Z][\w-]*)*/],
			[PR['PR_ATTRIB_NAME'],	/^[?]?[a-zA-Z_][\w-]*[:]?/],
			[PR['PR_DECLARATION'],	/^<http:[/][/][a-zA-z0-9\.\/\-#]*>/],
			// A run of punctuation
			[PR['PR_PUNCTUATION'],	/^([^\w\t\n\r \xA0\"\'\:\?\<\>\/\.\#])|([\s\t\n\r]*\.)/]
		]
	),
['sparql']);