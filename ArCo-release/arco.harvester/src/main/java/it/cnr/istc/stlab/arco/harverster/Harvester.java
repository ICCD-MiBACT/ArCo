package it.cnr.istc.stlab.arco.harverster;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.xpath.XPathExpressionException;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class Harvester {

	private String listIdentifierURL, outputDirectory;
	private static final int chunk_size = 1000;
	private static final Pattern p = Pattern.compile("@(.*?)@");
	private DocumentBuilder builder;
	private static final int NUM_OF_ATTEMPTS = 3;
	private AtomicInteger c = new AtomicInteger(0);

	private static final Logger logger = LogManager.getLogger(OAIHarvester.class);

	public Harvester(String listIdentifierURL, String outputDirectory) throws ParserConfigurationException {
		super();
		this.listIdentifierURL = listIdentifierURL;
		this.outputDirectory = outputDirectory;

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setValidating(true);
		factory.setIgnoringElementContentWhitespace(true);
		builder = factory.newDocumentBuilder();

	}

	public void getRecords() throws IOException, ParserConfigurationException, SAXException, XPathExpressionException,
			TransformerException {
		String nextToken = null;

		AtomicInteger chunk = new AtomicInteger(0);

		new File(outputDirectory + "/" + chunk + "/").mkdirs();

		FileOutputStream fos_keys = new FileOutputStream(new File(outputDirectory + "/keys.txt"));
		FileOutputStream fos_paths = new FileOutputStream(new File(outputDirectory + "/paths.txt"));

		boolean first = true;

		while (nextToken != null || first) {

			logger.trace("Issuing request " + listIdentifierURL + "verb=ListIdentifiers&resumptionToken=" + nextToken);

			URL url = new URL(listIdentifierURL + "verb=ListIdentifiers&resumptionToken=" + nextToken);

			if (first) {
				url = new URL(listIdentifierURL + "verb=ListIdentifiers&metadataPrefix=oai_dc");
				first = false;
			}

			for (int i = 0; i < NUM_OF_ATTEMPTS; i++) {
				try {
					nextToken = getRecordsFromList(url, chunk, fos_keys, fos_paths);
					break;
				} catch (Exception e) {
					e.printStackTrace();
					logger.error(e.getMessage());
					try {
						Thread.sleep((i + 1) * 60000);
					} catch (InterruptedException e1) {
						e1.printStackTrace();
					}
					logger.error("Retry! " + i);
				}
			}

		}

		fos_keys.flush();
		fos_paths.flush();
		fos_keys.close();
		fos_paths.close();

	}

	private String getRecordsFromList(URL url, AtomicInteger chunk, FileOutputStream fos_keys,
			FileOutputStream fos_paths)
			throws IOException, SAXException, XPathExpressionException, TransformerException {
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");

		Document d = builder.parse(conn.getInputStream());

		NodeList headers = d.getElementsByTagName("header");

		for (int i = 0; i < headers.getLength(); i++) {
			Element header = (Element) headers.item(i);
			String identifier = header.getElementsByTagName("identifier").item(0).getTextContent();
			String datestamp = header.getElementsByTagName("datestamp").item(0).getTextContent();
			Matcher m = p.matcher(identifier);
			if (m.find()) {
				String keycode = identifier.substring(m.start(1), m.end(1));

				String recordString = getRecord(identifier + "/xml");

				if (recordString != null) {
					FileOutputStream fos = new FileOutputStream(
							new File(outputDirectory + "/" + chunk.get() + "/" + keycode + ".xml"));
					fos.write(recordString.getBytes());
					fos.flush();
					fos.flush();
					fos.close();

					fos_keys.write((keycode + "\tSUCCESS\t" + identifier + "\t" + datestamp + "\t" + chunk.get() + "/"
							+ keycode + ".xml" + "\n").getBytes());
				} else {
					logger.error("Could not download " + identifier);
					fos_keys.write((keycode + "\tERROR\t" + identifier + "\t" + datestamp + "\t" + chunk.get() + "/"
							+ keycode + ".xml" + "\n").getBytes());
				}

				fos_paths.write((chunk.get() + "/" + keycode + ".xml" + "\n").getBytes());

				fos_keys.flush();
				fos_paths.flush();

			}

			if (c.incrementAndGet() % chunk_size == 0) {
				logger.info("Processed " + c);
				chunk.incrementAndGet();
				new File(outputDirectory + "/" + chunk + "/").mkdirs();
			}

		}

		logger.trace(d.getElementsByTagName("resumptionToken").item(0).getAttributes().getNamedItem("completeListSize")
				.getNodeValue());

		long items = Long.parseLong(d.getElementsByTagName("resumptionToken").item(0).getAttributes()
				.getNamedItem("completeListSize").getNodeValue());
		if (c.get() >= items) {
			return null;
		}

		return d.getElementsByTagName("resumptionToken").item(0).getTextContent();
	}

	private String getRecord(String identifier)
			throws IOException, SAXException, XPathExpressionException, TransformerException {
		for (int i = 0; i < NUM_OF_ATTEMPTS; i++) {
			try {
				URL url = new URL(listIdentifierURL + "verb=GetRecord&metadataPrefix=oai_dc&identifier=" + identifier);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				Document d = builder.parse(conn.getInputStream());
				try {
					Element schede = (Element) d.getElementsByTagName("schede").item(0);
					return Utils.nodeToString(schede, false, true);
				} catch (Exception e) {
					logger.error(e.getMessage());
					e.printStackTrace();
				}
				return null;
			} catch (Exception e) {
				e.printStackTrace();
				logger.error(e.getMessage());
				try {
					Thread.sleep((i + 1) * 60000);
				} catch (InterruptedException e1) {
					e1.printStackTrace();
				}
				logger.error("Retry! " + i);
			}
		}
		return null;

	}

}
