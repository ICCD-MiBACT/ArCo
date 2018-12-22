package it.cnr.istc.stlab.arco.xsltextension;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;

public class ImageFinder implements ExtensionFunction {

	private final String ENDPOINT = "http://catalogo.beniculturali.it/oaitarget/OAIHandler";
	private final String VERB_FIELD = "verb";
	private final String VERB_VALUE = "GetRecord";
	private final String METADATA_PREFIX_FIELD = "metadataPrefix";
	private final String METADATA_PREFIX_VALUE = "pico";
	private final String IDENTIFIER_FIELD = "identifier";
	private final String IDENTIFIER_PREFIX_VALUE = "oai:oaicat.iccd.org:";
	
	private static ImageFinder instance;
	
	private ImageFinder() {
		
	}
	
	public static ImageFinder getInstance(){
		if(instance == null) instance = new ImageFinder();
		return instance;
	}
	
	private String harvestLink(String recordID) throws MalformedURLException, IOException, ParserConfigurationException, SAXException{
		
		String link = "";
		String identifierValue = IDENTIFIER_PREFIX_VALUE + "@" + recordID + "@";
		
		String urlString = ENDPOINT + "?"
				+ VERB_FIELD + "=" + VERB_VALUE + "&" 
				+ METADATA_PREFIX_FIELD + "=" + METADATA_PREFIX_VALUE + "&" 
				+ IDENTIFIER_FIELD + "=" + identifierValue; 
		
		try{
			URLConnection conn = new URL(urlString).openConnection();
			conn.addRequestProperty("Accept", "application/xml");
			conn.setConnectTimeout(10000);
			conn.setReadTimeout(20000);
			
			InputStream is = conn.getInputStream();
			DocumentBuilder documentBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			Document doc = documentBuilder.parse(is);
			NodeList nodeList = doc.getElementsByTagName("pico:preview");
			
			if(nodeList.getLength() > 0){
				link = nodeList.item(0).getTextContent().replaceAll("^http://www.sigecweb.beniculturali.it", "http://www.catalogo.beniculturali.it");
				
			}
		} catch(Exception e){
			link = "";
		}
		
		return link;
	}
	
	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String recordID = ((XdmAtomicValue)arguments[0].itemAt(0)).getStringValue().trim();
		
		String link = null;
		try {
			link = harvestLink(recordID);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(link != null){
			return new XdmAtomicValue(link);
		}
		else return new XdmAtomicValue(new String());
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[]{
			SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE)
	    };
	}

	@Override
	public QName getName() {
		return new QName("http://w3id.org/arco/saxon-extension", "find-image");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
	}

}
