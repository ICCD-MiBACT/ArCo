package it.cnr.istc.stlab.arco.xsltextension;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.xml.transform.stream.StreamSource;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.Processor;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.Serializer;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmNode;
import net.sf.saxon.s9api.XdmValue;
import net.sf.saxon.s9api.XsltCompiler;
import net.sf.saxon.s9api.XsltExecutable;
import net.sf.saxon.s9api.XsltTransformer;

public class DefinitionMatcherForBDMSheet extends SKOSThesaurusLinker implements ExtensionFunction {

	private static final String THESAURUS = "META-INF/datasets/demoetnoantropologici.rdf";
	private static final String KB_NAMED_MODEL = "demoetnoantropologici";
	
	private static DefinitionMatcherForBDMSheet instance;
	
	private DefinitionMatcherForBDMSheet(){
		super();
		if(!kbManager.modelExists(KB_NAMED_MODEL)) {
			Model model = ModelFactory.createDefaultModel();
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream(THESAURUS);
			model.read(inputStream, null, "RDF/XML");
			
			kbManager.addNamedModel(KB_NAMED_MODEL, model);
		}
	}
	
	public static DefinitionMatcherForBDMSheet getInstance(){
		if(instance == null){
			instance = new DefinitionMatcherForBDMSheet();
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
		return new QName("https://w3id.org/arco/saxon-extension", "bdm-definition");
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
