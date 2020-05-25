package it.cnr.istc.stlab.arco.figures;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.apache.jena.ext.com.google.common.collect.Lists;
import org.apache.jena.query.ParameterizedSparqlString;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.query.ResultSetFactory;
import org.apache.jena.rdf.model.Property;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.rdf.model.ResourceFactory;
import org.apache.jena.sparql.vocabulary.FOAF;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

public class FiguresKG {
	
	private static final String SERVICE = "http://wit.istc.cnr.it/arco/virtuoso/sparql";
	private static final String SPARQL = "PREFIX a-cat: <https://w3id.org/arco/ontology/catalogue/> " + 
			"SELECT ?record ?cp " + 
			"WHERE{ " + 
			"  ?record a-cat:systemRecordCode ?systemRecordCode; " +
			"      a-cat:describesCulturalProperty ?cp " +
			"}";
	
	public void build(File picoFolder) {
		
		
		OutputStream os = null;
		try {
			os = new FileOutputStream("images.nt");
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(os != null) {
			OutputStreamWriter osw = new OutputStreamWriter(os, Charset.forName("UTF-8"));
			BufferedWriter bw = new BufferedWriter(osw);

			
			File[] xmlFiles = picoFolder.listFiles(f -> {return f.getName().endsWith(".xml");});
			
			List<File> xmls = Lists.newArrayList(xmlFiles);
			Stream<File> s = xmls.parallelStream();
			
			Property image = ResourceFactory.createProperty(FOAF.NS + "image");
			
			s.forEach(f -> {
				String name = f.getName();
				
				System.out.println(name);
				
				String systemRecordCode = getSystemRecordCode(name);
				Resource cp = retrieveCulturalProperty(systemRecordCode);
				
				if(cp != null) {
					Resource figure = null; 
					try {
						figure = fetchFigure(f);
					} catch (XPathExpressionException | ParserConfigurationException | SAXException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					if(figure != null && !figure.getURI().trim().isEmpty()) {
						
						String line = "<" + cp.getURI() + "> <" + image.getURI() + "> <" + figure.getURI() + "> . "; 
						try {
							bw.write(line);
							bw.newLine();
							bw.flush();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					
				}
				
			});
			
			
			try {
				bw.close();
				osw.close();
				os.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	private String getSystemRecordCode(String fileName) {
		
		String systemRecordCode = null;
		
		Pattern pattern = Pattern.compile("@(ICCD[0-9]+)@");
		Matcher matcher = pattern.matcher(fileName);
		if(matcher.find()) {
			systemRecordCode = matcher.group(1);
		}
		
		return systemRecordCode; 
	}
	
	private Resource retrieveCulturalProperty(String systemRecordCode) {
		
		Resource cp = null;
		
		ParameterizedSparqlString pss = new ParameterizedSparqlString();
		pss.setCommandText(FiguresKG.SPARQL);
		pss.setLiteral("systemRecordCode", systemRecordCode);
		
		
		try {
			URLConnection conn = new URL(SERVICE + "?query=" + URLEncoder.encode(pss.toString(), "UTF-8")).openConnection();
			conn.addRequestProperty("Accept", "application/json");
			conn.setReadTimeout(10000);
			conn.setConnectTimeout(5000);
			
			InputStream inputStream = conn.getInputStream();
			
			ResultSet resultSet = ResultSetFactory.fromJSON(inputStream);
			
			if(resultSet.hasNext()) {
				QuerySolution querySolution = resultSet.next();
				cp = querySolution.getResource("cp");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cp;
	}
	
	private Resource fetchFigure(File xmlFile) throws ParserConfigurationException, SAXException, IOException, XPathExpressionException {
		Resource figure = null;
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse(xmlFile);
		XPathFactory xPathfactory = XPathFactory.newInstance();
		XPath xpath = xPathfactory.newXPath();
		XPathExpression expr = xpath.compile("//*[local-name()='preview']/text()");
		String figureString = (String) expr.evaluate(doc, XPathConstants.STRING);
		
		figure = ResourceFactory.createResource(figureString);
		
		return figure;
	}
	
	public static void main(String[] args) {
		FiguresKG figuresKG = new FiguresKG();
		figuresKG.build(new File(args[0]));
	}

}
