package it.cnr.istc.stlab.arco.xslt;

import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.query.Syntax;
import org.apache.jena.rdf.model.Resource;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmArray;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;

public class RelatedPropertyFinder implements ExtensionFunction {

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue)arguments[0].itemAt(0)).getStringValue();
        
		String sparql = "SELECT ?property "
				+ "WHERE{ ?property <https://w3id.org/arco/core/uniqueIdentifier> '" + arg + "'}";
		
		Query query = QueryFactory.create(sparql, Syntax.syntaxARQ);
		QueryExecution queryExecution = QueryExecutionFactory.createServiceRequest("http://wit.istc.cnr.it/arco/virtuoso/sparql", query);
		ResultSet resultSet = queryExecution.execSelect();
		XdmArray xdmArray = new XdmArray();
		while(resultSet.hasNext()){
			QuerySolution querySolution = resultSet.next();
			Resource property = querySolution.getResource("property");
			xdmArray.append(new XdmAtomicValue(property.getURI()));
		}
        return xdmArray;
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[]{
				SequenceType.makeSequenceType(ItemType.ANY_URI, OccurrenceIndicator.ONE)
		};
	}

	@Override
	public QName getName() {
		return new QName("http://w3id.org/arco/saxon-extension", "related-property");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.ANY_URI, OccurrenceIndicator.ZERO_OR_MORE);
	}

}
