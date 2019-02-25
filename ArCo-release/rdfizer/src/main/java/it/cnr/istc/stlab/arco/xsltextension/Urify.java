package it.cnr.istc.stlab.arco.xsltextension;

import it.cnr.istc.stlab.arco.Urifier;
import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;

public class Urify implements ExtensionFunction {
    
	public QName getName()
    {
        return new QName("https://w3id.org/arco/saxon-extension", "urify");
    }
    
    public SequenceType getResultType()
    {
        return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
    }
    
    public net.sf.saxon.s9api.SequenceType[] getArgumentTypes()
    {
        return new SequenceType[]
            {
                SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE)
            };
    }

    public XdmValue call(XdmValue[] arguments) throws SaxonApiException
    {
        String arg = ((XdmAtomicValue)arguments[0].itemAt(0)).getStringValue();
        arg = Urifier.toURI(arg);
        return new XdmAtomicValue(arg);
    }

}

