package it.cnr.istc.stlab.arco.xsltextension;

import java.io.InputStream;

import org.apache.jena.query.Dataset;
import org.apache.jena.query.ParameterizedSparqlString;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.query.Syntax;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.tdb.TDBFactory;
import org.apache.jena.vocabulary.SKOS;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;

public class DefinitionMatcherForRASheet implements ExtensionFunction {

	private static final String RA_THESAURUS = "META-INF/datasets/ra-thesaurus.rdf";
	
	private static DefinitionMatcherForRASheet instance;
	private Dataset dataset;
	
	private DefinitionMatcherForRASheet(){
		dataset = TDBFactory.createDataset("ra-definitions");
		Model model = dataset.getDefaultModel();
		if(model.isEmpty()){
			
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream(RA_THESAURUS);
			model.read(inputStream, null, "RDF/XML");
			
		}
	}
	
	public static DefinitionMatcherForRASheet getInstance(){
		if(instance == null){
			instance = new DefinitionMatcherForRASheet();
		}
		return instance;
	}

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue)arguments[0].itemAt(0)).getStringValue().trim();
		
		/*
		String sparql = "PREFIX skos: <" + SKOS.uri + "> "
				+ "SELECT ?definition "
				+ "WHERE{ "
				+ "?definition skos:prefLabel ?label "
				+ "FILTER(REGEX(STR(?label), '^" + arg + "$', 'i')) "
				+ "} "
				+ "LIMIT 1";
		*/
		
		String sparql = "SELECT ?definition "
				+ "WHERE{ "
				+ "?definition skos:prefLabel ?label "
				+ "FILTER(REGEX(STR(?label), ?x, 'i')) "
				+ "} "
				+ "LIMIT 1";
		
		ParameterizedSparqlString pss = new ParameterizedSparqlString();
		pss.setCommandText(sparql);
		pss.setNsPrefix("skos", SKOS.uri);
		pss.setLiteral("x", "'^" + arg + "$'");
		
		
		Query query = pss.asQuery();
		QueryExecution queryExecution = QueryExecutionFactory.create(query, dataset.getDefaultModel());
		ResultSet resultSet = queryExecution.execSelect();
		
		if(resultSet.hasNext()){
			QuerySolution querySolution = resultSet.next();
			Resource definition = querySolution.getResource("definition");
			return new XdmAtomicValue(definition.getURI());
		}
		else return new XdmAtomicValue(new String());
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[]
				{
	                SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE)
	            };
	}

	@Override
	public QName getName() {
		return new QName("http://w3id.org/arco/saxon-extension", "ra-definition");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
	}
	
}
