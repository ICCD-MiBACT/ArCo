package it.cnr.istc.stlab.arco.xsltextension;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.jena.query.Query;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.query.Syntax;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Resource;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmArray;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmEmptySequence;
import net.sf.saxon.s9api.XdmValue;

public class RelatedPropertyFinder extends SKOSThesaurusLinker implements ExtensionFunction {
	
	private static final String IDENTIFIERS = "META-INF/datasets/identifiers.ttl";
	private static final String KB_NAMED_MODEL = "identifiers";
	
	private static RelatedPropertyFinder instance;
	
	
	private RelatedPropertyFinder() {
		super();
		if(!kbManager.modelExists(KB_NAMED_MODEL)) {
			Model model = ModelFactory.createDefaultModel();
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream(IDENTIFIERS);
			model.read(inputStream, null, "TURTLE");
			
			kbManager.addNamedModel(KB_NAMED_MODEL, model);
		}
	}
	
	public static RelatedPropertyFinder getInstance(){
		if(instance == null) 
			instance = new RelatedPropertyFinder();
		return instance;
	}

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue)arguments[0].itemAt(0)).getStringValue();
		
		String sparql = "SELECT ?property "
				+ "WHERE{ ?property <https://w3id.org/arco/ontology/arco/uniqueIdentifier> '" + arg + "'}";
		
		Query query = QueryFactory.create(sparql, Syntax.syntaxARQ);
		ResultSet resultSet = kbManager.executeSelect(query, getNamedModel());
		
		List<String> uris = new ArrayList<String>();
		
		boolean found = false;
		while(resultSet.hasNext()){
			QuerySolution querySolution = resultSet.next();
			Resource property = querySolution.getResource("property");
			uris.add(property.getURI());
			if(!found) found = true;
			
			System.out.println(property);
		}
		
		/*
		if(!found){
			System.out.println(arg);
			String specificProperty = SpecificCulturalPropertyType.getPropertyType(type);
			if(specificProperty == null || specificProperty.trim().isEmpty()) 
				specificProperty = "CulturalProperty";
			
		
			String uri = "https://w3id.org/arco/resource/" + specificProperty + "/" + Urifier.toURI(arg);
			uris.add(uri);
		}
		*/
		
		if(uris.isEmpty()) return XdmEmptySequence.getInstance();
		else return XdmArray.makeArray(uris.toArray());
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[]{
				SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE),
				SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE)
		};
	}

	@Override
	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "related-property");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.ANY_ARRAY, OccurrenceIndicator.ZERO_OR_MORE);
	}

	@Override
	protected String getNamedModel() {
		return KB_NAMED_MODEL;
	}

}
