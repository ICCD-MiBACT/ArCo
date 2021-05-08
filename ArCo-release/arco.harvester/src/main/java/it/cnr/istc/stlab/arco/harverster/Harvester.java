package it.cnr.istc.stlab.arco.harverster;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.xpath.XPathExpressionException;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class Harvester {

	private String listIdentifierURL, recordsDirectory, multimediaRecordsDirectory, altreNormativeDirectory,
			contenitoriFisiciDirectory, contenitoriGiuridiciDirectory, authorityFilesDirectory, outputDirectory;
	private static final int chunk_size = 1000;
	private static final Pattern p = Pattern.compile("@(.*?)@");
	private DocumentBuilder builder;
	private static final int NUM_OF_ATTEMPTS = 3;
	private long limit = Long.MAX_VALUE;
	private long downloaded = 0;
	private boolean records, multimedia_records, contenitoriFisici, contenitoriGiuridici, altreNormative,
			authorityFiles;
	private AtomicInteger c = new AtomicInteger(0);

	private Calendar from = null;
	private Calendar to = null;

	private static final Logger logger = LoggerFactory.getLogger(OAIHarvester.class);

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

	public void setFrom(Calendar from) {
		this.from = from;
	}

	public void setTo(Calendar to) {
		this.to = to;
	}

	public void setLimit(long limit) {
		this.limit = limit;
	}

	private static String getResumptionToken(String postfix, Calendar from, Calendar to, boolean depub) {

		String depubString = "null";

		if (depub) {
			depubString = "DEPUBBLICATO";
		}

		if (from == null || to == null) {

			return System.currentTimeMillis() + ":0:oai_dc:00010101000000:99991231235959:" + depubString + postfix;
		} else {
			return System.currentTimeMillis() + ":0:oai_dc:" + getStringDate(from) + "000000:" + getStringDate(to)
					+ "235959:" + depubString + postfix;
		}

	}

	private static String getStringDate(Calendar c) {
		return String.format("%d%02d%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DAY_OF_MONTH));
	}

	public List<String> downloadRecords(String folder, String postfixList, String postfixRecord, boolean download,
			Calendar from, Calendar to) throws IOException {

		String nextToken = getResumptionToken(postfixList, from, to, false);
		
		//TODO

		AtomicInteger chunk = new AtomicInteger(0);
		List<String> downloadedRecords = new ArrayList<>();

		FileOutputStream fos_keys = null, fos_paths = null;
		if (download) {

			new File(folder + "/" + chunk + "/").mkdirs();
			fos_keys = new FileOutputStream(new File(folder + "/keys.txt"));
			fos_paths = new FileOutputStream(new File(folder + "/paths.txt"));
		}

		Document d;
		while (nextToken != null) {

			URL url = new URL(listIdentifierURL + "verb=ListIdentifiers&resumptionToken=" + nextToken);

			for (int i = 0; i < NUM_OF_ATTEMPTS; i++) {
				try {
					logger.trace("Issuing request " + url.toString());
					String identifiersResponse = IOUtils.toString(url, Charset.forName("UTF-8"));
					d = builder.parse(new ByteArrayInputStream(identifiersResponse.getBytes()));
					downloadedRecords
							.addAll(getRecordsFromList(d, chunk, fos_keys, fos_paths, postfixRecord, folder, download));
					nextToken = Utils.getResumptionToken(d);
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

			if (nextToken == null || downloaded >= limit) {
				break;
			}

		}
		if (fos_keys != null) {

			fos_keys.flush();
			fos_keys.close();
		}
		if (fos_paths != null) {
			fos_paths.flush();
			fos_paths.close();
		}
		return downloadedRecords;
	}

	public void getRecords() throws IOException, ParserConfigurationException, SAXException, XPathExpressionException,
			TransformerException {

		if (records) {
			logger.info("Download records");
			downloadRecords(recordsDirectory, "", "/xml", true, from, to);
			downloaded = 0;
		}
		if (multimedia_records) {
			logger.info("Download multimedia records");
			downloadRecords(multimediaRecordsDirectory, "/entita_multimediale", "/xml/entita_multimediale", true, from,
					to);
			downloaded = 0;
		}
		if (contenitoriFisici) {
			logger.info("Download contenitori fisici");
			downloadRecords(contenitoriFisiciDirectory, "/contenitori_fisici", "/xml/contenitori_fisici", true, from,
					to);
			downloaded = 0;
		}
		if (contenitoriGiuridici) {
			logger.info("Download contenitori giuridici");
			downloadRecords(contenitoriGiuridiciDirectory, "/contenitori_giuridici", "/xml/contenitori_giuridici", true,
					from, to);
			downloaded = 0;
		}
		if (altreNormative) {
			logger.info("Download altre normative");
			downloadRecords(altreNormativeDirectory, "/altre_normative", "/xml/altre_normative", true, from, to);
			downloaded = 0;
		}

		if (authorityFiles) {
			logger.info("Download authority file");
			downloadRecords(authorityFilesDirectory, "/authorities", "/xml/authorities", true, from, to);
		}

	}

	private List<String> getRecordsFromList(Document d, AtomicInteger chunk, FileOutputStream fos_keys,
			FileOutputStream fos_paths, String postFix, String recordsDirectory, boolean download)
			throws IOException, SAXException, XPathExpressionException, TransformerException {

		List<String> recordsChunk = getRecords(d);
		List<String> result = new ArrayList<>();

		for (String keycode : recordsChunk) {

			String filename = recordsDirectory + "/" + chunk.get() + "/" + keycode + ".xml";

			if (download) {
				String recordString = getRecord(getIdentifierFromKeycode(keycode) + postFix);
				if (recordString != null) {
					FileOutputStream fos = new FileOutputStream(new File(filename));
					fos.write(recordString.getBytes());
					fos.flush();
					fos.flush();
					fos.close();

					fos_keys.write(
							(keycode + "\tSUCCESS\t" + keycode + "\t" + chunk.get() + "/" + keycode + ".xml" + "\n")
									.getBytes());

					result.add(keycode);

				} else {
					logger.error("Could not download " + keycode);
					if (fos_keys != null) {
						fos_keys.write(
								(keycode + "\tERROR\t" + keycode + "\t" + chunk.get() + "/" + keycode + ".xml" + "\n")
										.getBytes());
					}
				}
			} else {
				result.add(keycode);
			}

			if (fos_paths != null)
				fos_paths.write((chunk.get() + "/" + keycode + ".xml" + "\n").getBytes());

			downloaded++;

			if (downloaded >= limit) {
				break;
			}

			if (fos_keys != null) {
				fos_keys.flush();
			}
			if (fos_paths != null) {
				fos_paths.flush();
			}

			c.incrementAndGet();

			if (c.longValue() % chunk_size == 0) {
				logger.info("Processed " + c);
				chunk.incrementAndGet();
				new File(recordsDirectory + "/" + chunk + "/").mkdirs();
			}

		}

		return result;

	}

	private List<String> getRecords(Document d)
			throws IOException, SAXException, XPathExpressionException, TransformerException {

		List<String> result = new ArrayList<>();

		NodeList headers = d.getElementsByTagName("header");

		for (int i = 0; i < headers.getLength(); i++) {
			Element header = (Element) headers.item(i);
			String identifier = header.getElementsByTagName("identifier").item(0).getTextContent();
			Matcher m = p.matcher(identifier);
			if (m.find()) {
				String keycode = identifier.substring(m.start(1), m.end(1));

				result.add(keycode);

			}

		}

		return result;
	}

	private String getRecord(String identifier)
			throws IOException, SAXException, XPathExpressionException, TransformerException {
		for (int i = 0; i < NUM_OF_ATTEMPTS; i++) {
			try {
				URL url = new URL(listIdentifierURL + "verb=GetRecord&metadataPrefix=oai_dc&identifier=" + identifier);
				logger.trace("Getting {}", url);
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

	private static String getIdentifierFromKeycode(String keycode) {
		return "oai:oaicat.iccd.org:@" + keycode + "@";
	}

	public void getRecordsFromList(List<String> keycodes)
			throws XPathExpressionException, IOException, SAXException, TransformerException {
		new File(outputDirectory).mkdirs();

		for (String keycode : keycodes) {
			String recordString = getRecord(getIdentifierFromKeycode(keycode) + "/xml");

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

	public String getContenitoreFisico(String keycode)
			throws XPathExpressionException, IOException, SAXException, TransformerException {
		return getRecord("oai:oaicat.iccd.org:@" + keycode + "@/xml/contenitori_fisici");
	}

	public String getContenitoreGiuridico(String keycode)
			throws XPathExpressionException, IOException, SAXException, TransformerException {
		return getRecord("oai:oaicat.iccd.org:@" + keycode + "@/xml/contenitori_giuridici");
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
