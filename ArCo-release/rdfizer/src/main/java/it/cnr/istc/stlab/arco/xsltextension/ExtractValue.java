package it.cnr.istc.stlab.arco.xsltextension;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;

public class ExtractValue implements ExtensionFunction {

	private static ExtractValue instance;
	private static Pattern numbers = Pattern.compile("[0-9]+[,\\.]?[0-9]*");

	private ExtractValue() {

	}

	public static ExtractValue getInstance() {

		if (instance == null)
			instance = new ExtractValue();
		return instance;
	}

	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "extract-value");
	}

	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.ANY_ITEM, OccurrenceIndicator.ONE);
	}

	public net.sf.saxon.s9api.SequenceType[] getArgumentTypes() {
		return new SequenceType[] { SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE) };
	}

	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {

		String arg = ((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue();
		return XdmValue.makeValue(extractValue(arg));
	}

	private static String extractValue(String input) {

		Matcher matcherNumbers = numbers.matcher(input);
		if (matcherNumbers.find()) {
			return input.substring(matcherNumbers.start(), matcherNumbers.end());
		}

		return "";
	}

}
