package it.cnr.istc.stlab.arco.xsltextension;

import java.io.InputStream;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;

public class ScientificPropertyDefinitionLinker extends SKOSThesaurusLinker implements ExtensionFunction {

	private final String THESAURUS = "META-INF/datasets/ICCD_Thesaurus_definizione-del-bene_patrimonio-scientifico-e-tecnologico.rdf";
	private final String KB_NAMED_MODEL = "scientific-property-definition";
	
	private static ScientificPropertyDefinitionLinker instance;
	
	private ScientificPropertyDefinitionLinker(){
		super();
		if(!kbManager.modelExists(KB_NAMED_MODEL)) {
			Model model = ModelFactory.createDefaultModel();
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream(THESAURUS);
			model.read(inputStream, null, "RDF/XML");
			
			kbManager.addNamedModel(KB_NAMED_MODEL, model);
		}	
	}
	
	public static ScientificPropertyDefinitionLinker getInstance(){
		if(instance == null){
			instance = new ScientificPropertyDefinitionLinker();
		}
		return instance;
	}

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue)arguments[0].itemAt(0)).getStringValue().trim();
		return link(arg);
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[]{
			SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE)
		};
	}

	@Override
	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "pst-definition");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
	}

	@Override
	protected String getNamedModel() {
		return KB_NAMED_MODEL;
	}
	
}
