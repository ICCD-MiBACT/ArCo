package it.cnr.istc.stlab.arco.xsltextension;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;

public class Uncamelizer implements ExtensionFunction {
	
	private static Uncamelizer instance;
	
	private Uncamelizer() {
		
	}
	
	public static Uncamelizer getInstance(){
		if(instance == null) instance = new Uncamelizer();
		return instance;
	}

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue)arguments[0].itemAt(0)).getStringValue().trim();
		
		StringBuilder sb = new StringBuilder();
		for(char c : arg.toCharArray()){
			if(Character.isUpperCase(c)){
				if(sb.length() > 0) sb.append("-");
				sb.append(Character.toLowerCase(c));
			}
			else sb.append(c);
		}
		return new XdmAtomicValue(sb.toString());
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[]{
			SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE)
		};
	}

	@Override
	public QName getName() {
		return new QName("http://w3id.org/arco/saxon-extension", "uncamelize");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
	}

}
