package it.cnr.istc.stlab.arco.harverster;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
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

	private String listIdentifierURL, recordsDirectory, multimediaRecordsDirectory, altreNormativeDirectory,
			contenitoriFisiciDirectory, contenitoriGiuridiciDirectory, authorityFilesDirectory, outputDirectory;
	private static final int chunk_size = 1000;
	private long items = Long.MAX_VALUE;
	private static final Pattern p = Pattern.compile("@(.*?)@");
	private DocumentBuilder builder;
	private static final int NUM_OF_ATTEMPTS = 3;
	private long limit = Long.MAX_VALUE;
	private long downloaded = 0;
	private boolean records, multimedia_records, contenitoriFisici, contenitoriGiuridici, altreNormative,
			authorityFiles;
	private AtomicInteger c = new AtomicInteger(0);

	private static final Logger logger = LogManager.getLogger(OAIHarvester.class);

	public Harvester(String listIdentifierURL, String outputDirectory) throws ParserConfigurationException {
		super();
		this.listIdentifierURL = listIdentifierURL;
		this.recordsDirectory = outputDirectory + "/records";
		this.multimediaRecordsDirectory = outputDirectory + "/multimedia_records";
		this.contenitoriFisiciDirectory = outputDirectory + "/contenitori_fisici";
		this.contenitoriGiuridiciDirectory = outputDirectory + "/contenitori_giuridici";
		this.altreNormativeDirectory = outputDirectory + "/altre_normative";
		this.authorityFilesDirectory = outputDirectory + "/authority_file";
		this.outputDirectory = outputDirectory;

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setValidating(true);
		factory.setIgnoringElementContentWhitespace(true);
		builder = factory.newDocumentBuilder();

	}

	public void setLimit(long limit) {
		this.limit = limit;
	}

	private void downloadRecords(String folder, String postfixList, String postfixRecord, String firstToken)
			throws IOException {

		boolean first = true;
		String nextToken = firstToken;

		AtomicInteger chunk = new AtomicInteger(0);

		new File(folder + "/" + chunk + "/").mkdirs();

		FileOutputStream fos_keys = new FileOutputStream(new File(folder + "/keys.txt"));
		FileOutputStream fos_paths = new FileOutputStream(new File(folder + "/paths.txt"));
		while (nextToken != null || first) {

			URL url = new URL(listIdentifierURL + "verb=ListIdentifiers&resumptionToken=" + nextToken);

			if (first) {
				if (firstToken != null) {
					url = new URL(
							listIdentifierURL + "verb=ListIdentifiers&resumptionToken=" + nextToken + postfixList);
				} else {
					url = new URL(listIdentifierURL + "verb=ListIdentifiers&metadataPrefix=oai_dc");
				}

				first = false;
			}

			for (int i = 0; i < NUM_OF_ATTEMPTS; i++) {
				try {
					logger.trace("Issuing request " + url.toString());
					nextToken = getRecordsFromList(url, chunk, fos_keys, fos_paths, postfixRecord, folder);
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

			if (c.longValue() >= this.items) {
				break;
			}

			if (downloaded > limit) {
				break;
			}

		}
		fos_keys.flush();
		fos_paths.flush();
		fos_keys.close();
		fos_paths.close();
	}

	public void getRecords() throws IOException, ParserConfigurationException, SAXException, XPathExpressionException,
			TransformerException {

		if (records) {
			downloadRecords(recordsDirectory, "", "/xml", null);
			downloaded = 0;
		}
		if (multimedia_records) {
			downloadRecords(multimediaRecordsDirectory, "/entita_multimediale", "/xml/entita_multimediale",
					getResumptionToken(new URL(listIdentifierURL + "verb=ListIdentifiers&metadataPrefix=oai_dc")));
			downloaded = 0;
		}
		if (contenitoriFisici) {
			downloadRecords(contenitoriFisiciDirectory, "/contenitori_fisici", "/xml/contenitori_fisici",
					getResumptionToken(new URL(listIdentifierURL + "verb=ListIdentifiers&metadataPrefix=oai_dc")));
			downloaded = 0;
		}
		if (contenitoriGiuridici) {
			downloadRecords(contenitoriGiuridiciDirectory, "/contenitori_giuridici", "/xml/contenitori_giuridici",
					getResumptionToken(new URL(listIdentifierURL + "verb=ListIdentifiers&metadataPrefix=oai_dc")));
			downloaded = 0;
		}
		if (altreNormative) {
			downloadRecords(altreNormativeDirectory, "/altre_normative", "/xml/altre_normative",
					getResumptionToken(new URL(listIdentifierURL + "verb=ListIdentifiers&metadataPrefix=oai_dc")));
			downloaded = 0;
		}

		if (authorityFiles) {
			downloadRecords(authorityFilesDirectory, "/authorities", "/xml/authorities",
					getResumptionToken(new URL(listIdentifierURL + "verb=ListIdentifiers&metadataPrefix=oai_dc")));
		}

//		AtomicInteger chunk = new AtomicInteger(0);
//
//		new File(recordsDirectory + "/" + chunk + "/").mkdirs();
//		new File(multimediaRecordsDirectory + "/" + chunk + "/").mkdirs();
//
//		boolean first = true;
//		String nextToken = null;
//
//		FileOutputStream fos_keys = new FileOutputStream(new File(recordsDirectory + "/keys.txt"));
//		FileOutputStream fos_paths = new FileOutputStream(new File(recordsDirectory + "/paths.txt"));
//		while (nextToken != null || first) {
//
//			URL url = new URL(listIdentifierURL + "verb=ListIdentifiers&resumptionToken=" + nextToken);
//
//			if (first) {
//				url = new URL(listIdentifierURL + "verb=ListIdentifiers&metadataPrefix=oai_dc");
//				first = false;
//			}
//
//			for (int i = 0; i < NUM_OF_ATTEMPTS; i++) {
//				try {
//					logger.trace("Issuing request " + url.toString());
//					nextToken = getRecordsFromList(url, chunk, fos_keys, fos_paths, "/xml", recordsDirectory);
//					break;
//				} catch (Exception e) {
//					e.printStackTrace();
//					logger.error(e.getMessage());
//					try {
//						Thread.sleep((i + 1) * 60000);
//					} catch (InterruptedException e1) {
//						e1.printStackTrace();
//					}
//					logger.error("Retry! " + i);
//				}
//			}
//
//			if (c.longValue() >= this.items) {
//				break;
//			}
//
//		}
//		fos_keys.flush();
//		fos_paths.flush();
//		fos_keys.close();
//		fos_paths.close();
//
//		logger.trace("Issuing request " + listIdentifierURL + "verb=ListIdentifiers&metadataPrefix=oai_dc");
//		nextToken = getResumptionToken(new URL(listIdentifierURL + "verb=ListIdentifiers&metadataPrefix=oai_dc"));
//		AtomicInteger chunk_mr = new AtomicInteger(0);
//		c = new AtomicInteger(0);
//		first = true;
//		FileOutputStream fos_keys_mr = new FileOutputStream(new File(multimediaRecordsDirectory + "/keys.txt"));
//		FileOutputStream fos_paths_mr = new FileOutputStream(new File(multimediaRecordsDirectory + "/paths.txt"));
//		while (nextToken != null) {
//
//			URL url = new URL(listIdentifierURL + "verb=ListIdentifiers&resumptionToken=" + nextToken);
//			if (first) {
//				url = new URL(listIdentifierURL + "verb=ListIdentifiers&resumptionToken=" + nextToken
//						+ "/entita_multimediale");
//				first = false;
//			}
//
//			for (int i = 0; i < NUM_OF_ATTEMPTS; i++) {
//				try {
//					logger.trace("Issuing request " + url.toString());
//					nextToken = getRecordsFromList(url, chunk_mr, fos_keys_mr, fos_paths_mr, "/xml/entita_multimediale",
//							multimediaRecordsDirectory);
//					break;
//				} catch (Exception e) {
//					e.printStackTrace();
//					logger.error(e.getMessage());
//					try {
//						Thread.sleep((i + 1) * 60000);
//					} catch (InterruptedException e1) {
//						e1.printStackTrace();
//					}
//					logger.error("Retry! " + i);
//				}
//			}
//
//			if (c.longValue() >= this.items) {
//				break;
//			}
//
//		}
//		fos_keys_mr.flush();
//		fos_paths_mr.flush();
//		fos_keys_mr.close();
//		fos_paths_mr.close();

	}

	private String getResumptionToken(URL url)
			throws IOException, SAXException, XPathExpressionException, TransformerException {
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");

		Document d = builder.parse(conn.getInputStream());

		return d.getElementsByTagName("resumptionToken").item(0).getTextContent();
	}

	private String getRecordsFromList(URL url, AtomicInteger chunk, FileOutputStream fos_keys,
			FileOutputStream fos_paths, String postFix, String recordsDirectory)
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

				String filename = recordsDirectory + "/" + chunk.get() + "/" + keycode + ".xml";

				String recordString = getRecord(identifier + postFix);

				if (recordString != null) {
					FileOutputStream fos = new FileOutputStream(new File(filename));
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

				downloaded++;

				if (downloaded > limit) {
					break;
				}

				fos_keys.flush();
				fos_paths.flush();

				c.incrementAndGet();

			}

			if (c.longValue() % chunk_size == 0) {
				logger.info("Processed " + c);
				chunk.incrementAndGet();
				new File(recordsDirectory + "/" + chunk + "/").mkdirs();
			}

		}

		logger.trace(d.getElementsByTagName("resumptionToken").item(0).getAttributes().getNamedItem("completeListSize")
				.getNodeValue());

		this.items = Long.parseLong(d.getElementsByTagName("resumptionToken").item(0).getAttributes()
				.getNamedItem("completeListSize").getNodeValue());

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
					Element schede = (Element) d.getElementsByTagName("record").item(0);
					if (schede != null) {
						return Utils.nodeToString(schede, false, true);
					}
				} catch (Exception e) {
					logger.error(e.getMessage());
					logger.error(url.toString());
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

	public void getRecordsFromList(List<String> keycodes)
			throws XPathExpressionException, IOException, SAXException, TransformerException {
		new File(outputDirectory).mkdirs();

		for (String keycode : keycodes) {
			String recordString = getRecord("oai:oaicat.iccd.org:@" + keycode + "@/xml");

			if (recordString != null) {
				FileOutputStream fos = new FileOutputStream(new File(outputDirectory + "/" + keycode + ".xml"));
				fos.write(recordString.getBytes());
				fos.flush();
				fos.flush();
				fos.close();
				logger.info(keycode + " downloaded!");
			} else {
				logger.error("Could not download " + keycode);
			}
		}
	}

	public static void main(String[] args) throws ParserConfigurationException, XPathExpressionException, IOException,
			SAXException, TransformerException {
		Harvester h = new Harvester(args[0], args[1]);
		List<String> keycodes = new ArrayList<>();
		for (int i = 2; i < args.length; i++) {
			keycodes.add(args[i]);
		}
		h.getRecordsFromList(keycodes);
	}

	public void setRecords(boolean records) {
		this.records = records;
	}

	public void setMultimedia_records(boolean multimedia_records) {
		this.multimedia_records = multimedia_records;
	}

	public void setContenitoriFisici(boolean contenitoriFisici) {
		this.contenitoriFisici = contenitoriFisici;
	}

	public void setContenitoriGiuridici(boolean contenitoriGiuridici) {
		this.contenitoriGiuridici = contenitoriGiuridici;
	}

	public void setAltreNormative(boolean altreNormative) {
		this.altreNormative = altreNormative;
	}

	public void setAuthorityFiles(boolean authorityFiles) {
		this.authorityFiles = authorityFiles;
	}

}
