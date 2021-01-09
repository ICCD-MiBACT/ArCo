package it.cnr.istc.stlab.arco.xsltextension;

import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

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

public class ContenitoreGiuridicoFinder implements ExtensionFunction {

	private static ContenitoreGiuridicoFinder instance;
	private Map<String, String> cgsr2ccg;
	private static final Logger logger = LogManager.getLogger(ContenitoreGiuridicoFinder.class);

	private ContenitoreGiuridicoFinder() {
		PreprocessedData pd = PreprocessedData.getInstance(true);
		this.cgsr2ccg = pd.getContenitoreGiuridicoSystemRecordCode2CCG();

	}

	public static ContenitoreGiuridicoFinder getInstance() {
		if (instance == null)
			instance = new ContenitoreGiuridicoFinder();
		return instance;
	}

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue();

		logger.trace("Argument " + arg);
		String url = cgsr2ccg.get(arg);
		logger.trace("ccg " + url);

		if (url == null || url.length() == 0) {
			return XdmEmptySequence.getInstance();
		} else {
			return XdmValue.makeValue(url);
		}
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[] { SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE) };
	}

	@Override
	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "find-cg");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.ANY_ITEM, OccurrenceIndicator.ZERO_OR_MORE);
	}
}
