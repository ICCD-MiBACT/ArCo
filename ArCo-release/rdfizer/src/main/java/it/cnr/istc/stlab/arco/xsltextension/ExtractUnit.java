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

public class ExtractUnit implements ExtensionFunction {

	private static ExtractUnit instance;
	private static Pattern unitOfMeasurePattern = Pattern.compile("[A-Za-z]+");

	private ExtractUnit() {

	}

	public static ExtractUnit getInstance() {

		if (instance == null)
			instance = new ExtractUnit();
		return instance;
	}

	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "extract-unit");
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

		Matcher matcher = unitOfMeasurePattern.matcher(input);
		if (matcher.find()) {
			return input.substring(matcher.start(), matcher.end());
		}

		return "";
	}

}
