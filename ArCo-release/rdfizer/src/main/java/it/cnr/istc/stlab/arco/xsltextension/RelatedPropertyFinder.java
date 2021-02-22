package it.cnr.istc.stlab.arco.xsltextension;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import it.cnr.istc.stlab.arco.preprocessing.PreprocessedData;
import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmEmptySequence;
import net.sf.saxon.s9api.XdmValue;

public class RelatedPropertyFinder implements ExtensionFunction {

	private static final Logger logger = LoggerFactory.getLogger(RelatedPropertyFinder.class);
	private static RelatedPropertyFinder instance;
	private Map<String, List<String>> uniqueIdentifier2URIs;

	private RelatedPropertyFinder() {

		PreprocessedData pd = PreprocessedData.getInstance(true);
		this.uniqueIdentifier2URIs = pd.getUniqueIdentifier2URIs();

	}

	public static RelatedPropertyFinder getInstance() {
		if (instance == null)
			instance = new RelatedPropertyFinder();
		return instance;
	}

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue();

		if (arg.contains("-")) {
			arg = arg.trim().split("-")[0];
		}

		List<String> uris = uniqueIdentifier2URIs.get(arg);

		if (uris != null) {
			logger.debug("Related-property argument {} - {} - {}",
					((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue(), arg, uris.size());

			return XdmValue.makeSequence(uris);
		}
		else
			return XdmEmptySequence.getInstance();

	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[] { SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE),
				SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE) };
	}

	@Override
	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "related-property");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ZERO_OR_MORE);
	}

}
