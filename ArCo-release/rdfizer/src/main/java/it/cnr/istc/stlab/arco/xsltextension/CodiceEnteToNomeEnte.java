package it.cnr.istc.stlab.arco.xsltextension;

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

public class CodiceEnteToNomeEnte implements ExtensionFunction {

	private static CodiceEnteToNomeEnte instance;
	private Map<String, String> codiceEnteToNomeEnte;
	private static final Logger logger = LoggerFactory.getLogger(CodiceEnteToNomeEnte.class);

	private CodiceEnteToNomeEnte() {
		PreprocessedData pd = PreprocessedData.getInstance(true);
		this.codiceEnteToNomeEnte = pd.getCodiceEnteToNomeEnte();

	}

	public static CodiceEnteToNomeEnte getInstance() {
		if (instance == null)
			instance = new CodiceEnteToNomeEnte();
		return instance;
	}

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue();

		logger.trace("Argument " + arg);
		String nomeEnte = codiceEnteToNomeEnte.get(arg);

		if (nomeEnte == null || nomeEnte.length() == 0) {
			return XdmEmptySequence.getInstance();
		} else {
			return XdmValue.makeValue(nomeEnte);
		}
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[] { SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE) };
	}

	@Override
	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "get-nome-ente-from-codice");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.ANY_ITEM, OccurrenceIndicator.ZERO_OR_MORE);
	}
}
