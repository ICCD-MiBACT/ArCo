package it.cnr.istc.stlab.arco.xsltextension;

import org.apache.jena.ext.com.google.common.collect.Lists;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmArray;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;

public class Split implements ExtensionFunction {

	private static Split instance;

	private Split() {

	}

	public static Split getInstance() {

		if (instance == null)
			instance = new Split();
		return instance;
	}

	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "split");
	}

	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.ANY_ITEM, OccurrenceIndicator.ONE_OR_MORE);
	}

	public net.sf.saxon.s9api.SequenceType[] getArgumentTypes() {
		return new SequenceType[] { SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE) };
	}

	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {

		String arg = ((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue();

		String[] result = splitAuthorString(arg);

		return XdmArray.makeSequence(Lists.newArrayList(result));

	}

	private static String[] splitAuthorString(String input) {
		String[] result = input.split(",");
		for (int i = 0; i < result.length; i++) {
			result[i] = result[i].trim();
		}
		return result;
	}

}
