package it.cnr.istc.stlab.arco.xsltextension;

import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.google.common.net.PercentEscaper;

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

public class LinkEMMFinder implements ExtensionFunction {

	private static LinkEMMFinder instance;
	private PercentEscaper pe;
	private Map<String, String> ftan2linkEMM;
	private static final Logger logger = LogManager.getLogger(LinkEMMFinder.class);

	private LinkEMMFinder() {
		pe = new PercentEscaper("/:._,;<>!$\"'#[]*+@(){}=\\", false);
		PreprocessedData pd = PreprocessedData.getInstance(true);
		this.ftan2linkEMM = pd.getFtan2URL();

	}

	public static LinkEMMFinder getInstance() {
		if (instance == null)
			instance = new LinkEMMFinder();
		return instance;
	}

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue();

		logger.trace("Argument " + arg);
		String url = ftan2linkEMM.get(arg);
		logger.trace("Link emm " + url);
		url = pe.escape(url);
		logger.trace("Escaped link " + url);

		if (url == null || url.length() == 0)
			return XdmEmptySequence.getInstance();
		else
			return XdmValue.makeValue(url);
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[] { SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE) };
	}

	@Override
	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "find-link-emm");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.ANY_ITEM, OccurrenceIndicator.ZERO_OR_MORE);
	}
}
