package it.cnr.istc.stlab.arco.xsltextension;

import java.util.Map;

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

public class CatalogueRecordIdentifierToCulturalProperty implements ExtensionFunction {

	private static CatalogueRecordIdentifierToCulturalProperty instance;
	private Map<String, String> catalogueRecordIdentifier2URI;

	private CatalogueRecordIdentifierToCulturalProperty() {

		PreprocessedData pd = PreprocessedData.getInstance(true);
		this.catalogueRecordIdentifier2URI = pd.getCatalogueRecordIdentifier2URI();

	}

	public static CatalogueRecordIdentifierToCulturalProperty getInstance() {
		if (instance == null)
			instance = new CatalogueRecordIdentifierToCulturalProperty();
		return instance;
	}

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue();

		String url = catalogueRecordIdentifier2URI.get(arg);

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
		return new QName("https://w3id.org/arco/saxon-extension", "catalogue-record-identifier-to-cultural-property");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.ANY_ITEM, OccurrenceIndicator.ONE);
	}
}
