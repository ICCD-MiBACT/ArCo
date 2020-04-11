package it.cnr.istc.stlab.arco.xsltextension;

import org.apache.jena.query.ParameterizedSparqlString;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.vocabulary.SKOS;

import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;

public abstract class SKOSThesaurusLinker {

	protected final String sparql = "SELECT ?definition "
			+ "WHERE{ "
			+ "?definition skos:prefLabel ?label "
			+ "FILTER(REGEX(STR(?label), ?x, 'i')) "
			+ "} "
			+ "LIMIT 1";
	
	protected KBManager kbManager;
	
	public SKOSThesaurusLinker() {
		kbManager = KBManager.getInstance();
	}

	protected XdmValue link(String arg) throws SaxonApiException {
		
		String argClean = arg.replaceAll("[\\(\\)]", "");
		
		ParameterizedSparqlString pss = new ParameterizedSparqlString();
		pss.setCommandText(sparql);
		pss.setNsPrefix("skos", SKOS.uri);
		pss.setLiteral("x", "^" + argClean + "$");
		
		ResultSet resultSet = kbManager.executeSelect(pss.asQuery(), getNamedModel());
		
		if(resultSet.hasNext()){
			QuerySolution querySolution = resultSet.next();
			Resource definition = querySolution.getResource("definition");
			return new XdmAtomicValue(definition.getURI());
		}
		else return new XdmAtomicValue(new String());
	}
	
	protected abstract String getNamedModel();
	
}
