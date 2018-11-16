package it.cnr.istc.stlab.arco;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.transform.stream.StreamSource;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;

import it.cnr.istc.stlab.arco.xsltextension.CataloguingEntityFinder;
import it.cnr.istc.stlab.arco.xsltextension.DefinitionMatcherForRASheet;
import it.cnr.istc.stlab.arco.xsltextension.MeasurementMapper;
import it.cnr.istc.stlab.arco.xsltextension.RelatedPropertyFinder;
import it.cnr.istc.stlab.arco.xsltextension.Uncamelizer;
import it.cnr.istc.stlab.arco.xsltextension.Urify;
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

	//private static final String XSLT_LOCATION = "META-INF/xslt/arco.xslt";
	private static final String XSLT_LOCATION = "META-INF/xslt";
	
	private Processor proc;
	private List<XsltExecutable> exps;
	private CataloguingEntityFinder cataloguingEntityFinder;
	
	public Converter() {
		
		init();
		
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
		proc.registerExtensionFunction(new Urify());
		proc.registerExtensionFunction(md5);
		proc.registerExtensionFunction(sheetType2propertyType);
		proc.registerExtensionFunction(sheetType2SpecificPropertyType);
		proc.registerExtensionFunction(localName);
		proc.registerExtensionFunction(cataloguingEntityFinder);
		proc.registerExtensionFunction(DefinitionMatcherForRASheet.getInstance());
		proc.registerExtensionFunction(RelatedPropertyFinder.getInstance());
		proc.registerExtensionFunction(MeasurementMapper.getInstance());
		proc.registerExtensionFunction(Uncamelizer.getInstance());
        XsltCompiler comp = proc.newXsltCompiler();
        
        ClassLoader loader = Converter.class.getClassLoader();
        
        URL url = loader.getResource(XSLT_LOCATION);
        File[] xsltFiles = new File(url.getPath()).listFiles();
        for(File xsltFile : xsltFiles){
        	if(xsltFile.getName().endsWith(".xslt")){
	        	XsltExecutable exp;
				try {
					exp = comp.compile(new StreamSource(xsltFile));
					exps.add(exp);
				} catch (SaxonApiException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}
        	
        }
        /*
        String path = url.getPath();
        try {
        	XsltExecutable exp = comp.compile(new StreamSource(xsltInputStream));
        	exps.add(exp);
			
		} catch (SaxonApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
	}
	
	public Model convert(String item, InputStream sourceXml) throws Exception {
		
		Model model = ModelFactory.createDefaultModel();
        
        StreamSource inputStreamSource = new StreamSource(sourceXml);
		XdmNode source = proc.newDocumentBuilder().build(inputStreamSource);
		
		//XsltTransformer trans = exp.load();
		for(XsltExecutable exp : exps){
			ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
			Serializer out = proc.newSerializer(byteArrayOut);
			XsltTransformer trans = exp.load();
			
			QName qName = new QName("item");
			XdmValue value = new XdmAtomicValue(item);
			trans.setParameter(qName, value);
            trans.setInitialContextNode(source);
            trans.setDestination(out);
            trans.transform();
            trans.close();
            out.close();
            
            String rdfSource = new String(byteArrayOut.toByteArray());
            
            //System.out.println(rdfSource);
			
			ByteArrayInputStream in = new ByteArrayInputStream(rdfSource.getBytes());
            Model localModel = ModelFactory.createDefaultModel();
            localModel.read(in, null, "RDF/XML");
            
            model.add(localModel);
		}
            
            
            
            
		
        
        return model;
        
		
	}
	
	private void init(){
		
		exps = new ArrayList<XsltExecutable>();
		cataloguingEntityFinder = CataloguingEntityFinder.create();
    }
	
	public void destroy(){
		cataloguingEntityFinder.destroy();
	}
	
	public static void main(String[] args) {
		Converter converter = new Converter();
		//converter.convert("ICCD3569822", Converter.class.getClassLoader().getResourceAsStream("META-INF/xslt/ICCD3569822.xml"), System.out);
		
			
		Model model = null;
		try {
			model = converter.convert("ICCD10717180", Converter.class.getClassLoader().getResourceAsStream("META-INF/xslt/ICCD10717180.xml"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.write(System.out, "TURTLE");
		
		converter.destroy();
	}
	
}
