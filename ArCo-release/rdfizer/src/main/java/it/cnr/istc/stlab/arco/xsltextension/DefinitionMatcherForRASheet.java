package it.cnr.istc.stlab.arco.xsltextension;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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

public class DefinitionMatcherForRASheet extends SKOSThesaurusLinker implements ExtensionFunction {

	private static final String THESAURUS = "META-INF/datasets/ra-thesaurus.rdf";
	private static final String KB_NAMED_MODEL = "ra-definitions";
	
	private static DefinitionMatcherForRASheet instance;
	
	private DefinitionMatcherForRASheet(){
		super();
		if(!kbManager.modelExists(KB_NAMED_MODEL)) {
			Model model = ModelFactory.createDefaultModel();
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream(THESAURUS);
			model.read(inputStream, null, "RDF/XML");
			
			kbManager.addNamedModel(KB_NAMED_MODEL, model);
		}
	}
	
	public static DefinitionMatcherForRASheet getInstance(){
		if(instance == null){
			instance = new DefinitionMatcherForRASheet();
		}
		return instance;
	}

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue)arguments[0].itemAt(0)).getStringValue().trim();
		return link(arg);
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[]{
			SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE)
		};
	}

	@Override
	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "ra-definition");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
	}
	
	public static void main(String[] args) {
		Processor proc = new Processor(false);
		proc.registerExtensionFunction(new Urify());
		proc.registerExtensionFunction(DefinitionMatcherForRASheet.getInstance());
		proc.registerExtensionFunction(RelatedPropertyFinder.getInstance());
        XsltCompiler comp = proc.newXsltCompiler();
        
        try{
	        XsltExecutable exp = comp.compile(new StreamSource(new File("ra-recover.xslt")));
	        
	        //XsltTransformer trans = exp.load();
		
			File inFolder = new File("/Users/andrea/Documents/CNR/ArCo/state8");
			
			if(inFolder.exists() && inFolder.isDirectory() && !inFolder.isHidden()){
				File[] subFolders = inFolder.listFiles(f -> f.isDirectory() && !f.isHidden());
				for(File subFolder : subFolders){
					String subFolderName = subFolder.getName();
					File outSubFolder = new File(new File("/Users/andrea/Documents/CNR/ArCo/state8_Ordered_ttl"), subFolderName);
					
					if(!outSubFolder.exists()){
						outSubFolder.mkdirs();
						
						File[] xmls = subFolder.listFiles(f -> f.isFile() && !f.isHidden() && f.getName().endsWith(".xml"));
						
						System.out.println("XMLN " + outSubFolder +": "+ xmls.length);
						
						List<File> xmlList = new ArrayList<File>();
						for(File xml : xmls){
							xmlList.add(xml);
						}
						
						List<File> rdfFiles = xmlList.parallelStream().map(f -> {
							
							File ret = null;
							InputStream is = null;
							try {
								is = new FileInputStream(f);
							} catch (FileNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
							String itemName = f.getName().replace(".xml", "");
							if(is != null){
								try{
									
									//System.out.println(itemName);
									
									
							        
									ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
									Serializer out = proc.newSerializer(byteArrayOut);
									XsltTransformer trans = exp.load();
									
							        StreamSource inputStreamSource = new StreamSource(is);
									XdmNode source = proc.newDocumentBuilder().build(inputStreamSource);
									
									QName qName = new QName("item");
									XdmValue value = new XdmAtomicValue(itemName);
									trans.setParameter(qName, value);
							        trans.setInitialContextNode(source);
							        trans.setDestination(out);
							        trans.transform();
							        trans.close();
							        out.close();
							        
							        String rdfSource = new String(byteArrayOut.toByteArray());
									
							        ByteArrayInputStream in = new ByteArrayInputStream(rdfSource.getBytes());
						            Model model = ModelFactory.createDefaultModel();
						            model.read(in, null, "RDF/XML");
							        
									ret = new File(outSubFolder, itemName + ".ttl");
									OutputStream modelOut = new FileOutputStream(ret);
									model.write(modelOut, "TURTLE");
									modelOut.close();
									
									
									
								} catch(Exception e){
									System.err.println(itemName);
									e.printStackTrace();
								}
								
								
							}
							
							return ret;
						}).collect(Collectors.toList());
						
						System.out.println("created");
						
						Model model = ModelFactory.createDefaultModel();
						
						System.out.println(rdfFiles.size());
							rdfFiles.forEach(rdfFile -> {
							Model modelTmp = ModelFactory.createDefaultModel();
							InputStream is;
							try {
								is = new FileInputStream(rdfFile);
								modelTmp.read(is, null, "TURTLE");
								
								is.close();
								
								model.add(modelTmp);
								
								rdfFile.delete();
							} catch (Exception e) {
								System.err.println(rdfFile.getName());
								e.printStackTrace();
							}
						});
						
						OutputStream outputStream = new FileOutputStream(new File(outSubFolder, outSubFolder.getName() + ".ttl"));
						model.write(outputStream, "TURTLE");
						outputStream.close();
						
						
					}
					
				}
			}
			
			
        } catch(Exception e){
        	e.printStackTrace();
        }
	}

	@Override
	protected String getNamedModel() {
		return KB_NAMED_MODEL;
	}
	
}
