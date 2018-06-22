package it.cnr.istc.stlab.arco;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.xml.transform.stream.StreamSource;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.Processor;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.Serializer;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmNode;
import net.sf.saxon.s9api.XdmValue;
import net.sf.saxon.s9api.XsltCompiler;
import net.sf.saxon.s9api.XsltExecutable;
import net.sf.saxon.s9api.XsltTransformer;

public class Converter {

	private static final String XSLT_LOCATION = "META-INF/xslt/arco.xslt";
	
	
	private Processor proc;
	private XsltExecutable exp;
	
	public Converter() {
		ExtensionFunction urify = new ExtensionFunction()
        {
            public QName getName()
            {
                return new QName("http://w3id.org/arco/saxon-extension", "urify");
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
        };
        
        ExtensionFunction md5 = new ExtensionFunction()
        {
            public QName getName()
            {
                return new QName("http://w3id.org/arco/saxon-extension", "md5");
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
                
                
                String digest = "";
                MessageDigest md;
				try {
					byte[] bytesOfMessage = arg.getBytes("UTF-8");
					md = MessageDigest.getInstance("MD5");
					byte[] thedigest = md.digest(bytesOfMessage);
					StringBuffer sb = new StringBuffer();
			        for (int i = 0; i < thedigest.length; ++i) {
			          sb.append(Integer.toHexString((thedigest[i] & 0xFF) | 0x100).substring(1,3));
			       }
			        digest = sb.toString();
				} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                return new XdmAtomicValue(digest);
            }
        };
        
        ExtensionFunction sheetType2propertyType = new ExtensionFunction()
        {
            public QName getName()
            {
                return new QName("http://w3id.org/arco/saxon-extension", "getPropertyType");
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
                arg = TolLevelCultruralPropertyType.getPropertyType(arg);
                
                if(arg == null) arg = "http://www.w3id.org/arco/core/CulturalProperty";
                return new XdmAtomicValue(arg);
            }
        };
        
        ExtensionFunction sheetType2SpecificPropertyType = new ExtensionFunction()
        {
            public QName getName()
            {
                return new QName("http://w3id.org/arco/saxon-extension", "getSpecificPropertyType");
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
                arg = SpecificCulturalPropertyType.getPropertyType(arg);
                
                if(arg == null) arg = "http://www.w3id.org/arco/core/CulturalProperty";
                return new XdmAtomicValue(arg);
            }
        };
        
        ExtensionFunction localName = new ExtensionFunction()
        {
            public QName getName()
            {
                return new QName("http://w3id.org/arco/saxon-extension", "local-name");
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
                int lastSlash = arg.lastIndexOf("/");
                int lastHash = arg.lastIndexOf("#");
                
                if(lastHash > lastSlash)
                	arg = arg.substring(lastHash+1);
                else if(lastSlash > lastHash )
                	arg = arg.substring(lastSlash+1);
                
                return new XdmAtomicValue(arg);
            }
        };
        
        
		
		proc = new Processor(false);
		proc.registerExtensionFunction(urify);
		proc.registerExtensionFunction(md5);
		proc.registerExtensionFunction(sheetType2propertyType);
		proc.registerExtensionFunction(sheetType2SpecificPropertyType);
		proc.registerExtensionFunction(localName);
        XsltCompiler comp = proc.newXsltCompiler();
        
        InputStream xsltInputStream = Converter.class.getClassLoader().getResourceAsStream(XSLT_LOCATION);
        try {
			exp = comp.compile(new StreamSource(xsltInputStream));
			
		} catch (SaxonApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void convert(String item, InputStream sourceXml, OutputStream outRdf){
        
        try {
        	StreamSource inputStreamSource = new StreamSource(sourceXml);
			XdmNode source = proc.newDocumentBuilder().build(inputStreamSource);
			
			Serializer out = proc.newSerializer(outRdf);
            
			XsltTransformer trans = exp.load();
			
			QName qName = new QName("item");
			XdmValue value = new XdmAtomicValue(item);
			trans.setParameter(qName, value);
            trans.setInitialContextNode(source);
            trans.setDestination(out);
            trans.transform();
            trans.close();
            out.close();
            
		} catch (SaxonApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		
	}
	
	public static void main(String[] args) {
		Converter converter = new Converter();
		//converter.convert("ICCD3569822", Converter.class.getClassLoader().getResourceAsStream("META-INF/xslt/ICCD3569822.xml"), System.out);
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		converter.convert("ICCD10717180", Converter.class.getClassLoader().getResourceAsStream("META-INF/xslt/ICCD10717180.xml"), out);
	
		String sss = new String(out.toByteArray());
		//System.out.println(sss);
		
		ByteArrayInputStream in = new ByteArrayInputStream(sss.getBytes());
		
		Model model = ModelFactory.createDefaultModel();
		model.read(in, null, "RDF/XML");
		model.write(System.out, "TURTLE");
	}
	
}
