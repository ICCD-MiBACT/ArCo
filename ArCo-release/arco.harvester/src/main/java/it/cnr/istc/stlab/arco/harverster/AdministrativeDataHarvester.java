package it.cnr.istc.stlab.arco.harverster;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class AdministrativeDataHarvester {

	private static final Logger logger = LoggerFactory.getLogger(AdministrativeDataHarvester.class);

	private static final String OAI_ICCD = "http://www.catalogo-old.beniculturali.it/oaitarget/OAIHandler";
	private String base;
	private long limit = 0;

	private String verb, folderOut;

	private DocumentBuilder builder;

	public AdministrativeDataHarvester(String verb, String folderOut) throws ParserConfigurationException {
		this(OAI_ICCD, verb, folderOut);
	}

	public long getLimit() {
		return limit;
	}

	public void setLimit(long limit) {
		this.limit = limit;
	}

	public AdministrativeDataHarvester(String endpoint, String verb, String folderOut)
			throws ParserConfigurationException {
		super();
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setValidating(true);
		factory.setIgnoringElementContentWhitespace(true);
		builder = factory.newDocumentBuilder();
		this.verb = verb;
		this.folderOut = folderOut;
		this.base = endpoint + "?verb=AdministrativeDataRecords&set=";
	}

	private static final int NUM_OF_ATTEMPTS = 3;

	public void downloadRecords() throws MalformedURLException {
		int cursor = 0;
		boolean stop = false;
		Document d;

		new File(folderOut).mkdirs();

		while (!stop) {
			if (limit > 0 && cursor > limit) {
				break;
			}

			URL url = new URL(base + verb + "&cursor=" + cursor);
			stop = true;
			for (int i = 0; i < NUM_OF_ATTEMPTS; i++) {
				try {
					logger.trace("Issuing request " + url.toString());
					String response = IOUtils.toString(url, Charset.forName("UTF-8"));
					d = builder.parse(new ByteArrayInputStream(response.getBytes()));
					String resumptionToken = Utils.getResumptionToken(d);
					if (resumptionToken != null) {
						int chunk = Integer.parseInt(resumptionToken.split(":")[2]);
						logger.trace("Chunk {}", chunk);
						stop = false;
						cursor = chunk;
					}

					NodeList rt = d.getElementsByTagName("administrativeDataRecord");
					for (int j = 0; j < rt.getLength(); j++) {
						Element e = (Element) rt.item(j);
						String identifier = e.getElementsByTagName("identifier").item(0).getTextContent();
						String recordString = Utils.nodeToString(rt.item(j), false, true);
						FileOutputStream fos = new FileOutputStream(new File(folderOut + "/" + identifier + ".xml"));
						fos.write(recordString.getBytes());
						fos.flush();
						fos.close();
					}

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

	}
}
