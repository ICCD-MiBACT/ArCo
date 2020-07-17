package it.cnr.istc.stlab.arco.preprocessing;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

import it.cnr.istc.stlab.arco.Urifier;
import it.cnr.istc.stlab.arco.xsltextension.Utilities;

public class Preprocessor {

	private String recordsFolder, resourcePrefix, multimediaRecordsFolder;

	private static final Logger logger = Logger.getLogger(Preprocessor.class);
	private AtomicInteger countRecords = new AtomicInteger(0);
	private AtomicInteger countMultimediaRecords = new AtomicInteger(0);
	private Map<String, String> ftan2URL, catalogueRecordIdentifier2URI;
	private Map<String, List<String>> uniqueIdentifier2URIs;
	private PreprocessedData pd;

	public Preprocessor(String recordsFolder, String multimediaRecordsFolder, String resourcePrefix)
			throws MalformedURLException, IOException {
		super();
		this.recordsFolder = recordsFolder;
		this.resourcePrefix = resourcePrefix;
		this.multimediaRecordsFolder = multimediaRecordsFolder;
		this.pd = PreprocessedData.getInstance(false);
		this.uniqueIdentifier2URIs = pd.getUniqueIdentifier2URIs();
		this.ftan2URL = pd.getFtan2URL();
		this.catalogueRecordIdentifier2URI = pd.getCatalogueRecordIdentifier2URI();
	}

	public void run() {

		try {
			Files.walk(Paths.get(recordsFolder)).parallel()
					.filter(f -> FilenameUtils.isExtension(f.getFileName().toAbsolutePath().toString(), "xml"))
					.forEach(f -> preprocessRecord(f));

			Files.walk(Paths.get(multimediaRecordsFolder)).parallel()
					.filter(f -> FilenameUtils.isExtension(f.getFileName().toAbsolutePath().toString(), "xml"))
					.forEach(f -> preprocessMultimediaRecord(f));

			pd.commit();
			pd.close();

			logger.info("Preprocessing ended");

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void preprocessMultimediaRecord(Path f) {

		if (this.countMultimediaRecords.get() % 10000 == 0) {
			logger.info("Processed " + this.countMultimediaRecords + " multimedia records");
		}
		this.countMultimediaRecords.incrementAndGet();

		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document xml = db.parse(f.toFile());

			// Get XPath
			XPathFactory xpf = XPathFactory.newInstance();
			XPath xpath = xpf.newXPath();

			String ftan = getFTANFromEMM(xpath, xml);
			String link = getLinkEMMFromEMM(xpath, xml);

			logger.trace(f.toFile().getAbsolutePath() + " - " + ftan + " - " + link);

			if (validateField(ftan) && validateField(link)) {
				this.ftan2URL.put(ftan, link);
			}

		} catch (SAXException | IOException | ParserConfigurationException | XPathExpressionException e) {
			e.printStackTrace();
		} catch (Exception e) {
			logger.info("Error while processing " + f.toFile().getAbsolutePath() + " " + e.getMessage());
		}

	}

	private boolean validateField(String field) {
		return field != null && field.trim().length() > 0;
	}

	private void preprocessRecord(Path f) {

		if (this.countRecords.get() % 10000 == 0) {
			logger.info("Processed " + this.countRecords);
		}

		this.countRecords.incrementAndGet();

		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document xml = db.parse(f.toFile());

			// Get XPath
			XPathFactory xpf = XPathFactory.newInstance();
			XPath xpath = xpf.newXPath();

			String uriObjectOfDescription = getObjectOfDescription(xpath, xml);
			String uniqueIdentifier = getUniqueIdentifier(xpath, xml);
			String catalogueRecordIdentifier = getCatalogueRecordIdentifier(xpath, xml);

			List<String> uris = uniqueIdentifier2URIs.get(uniqueIdentifier);

			if (uris == null) {
				uris = new ArrayList<>();
			}
			uniqueIdentifier2URIs.put(uniqueIdentifier, uris);

			catalogueRecordIdentifier2URI.put(catalogueRecordIdentifier, uriObjectOfDescription);

		} catch (SAXException | IOException | ParserConfigurationException | XPathExpressionException e) {
			e.printStackTrace();
		} catch (Exception e) {
			logger.info("Error while processing " + f.toFile().getAbsolutePath() + " " + e.getMessage());

		}

	}

	private String getFTANFromEMM(XPath xpath, Document xml) throws XPathExpressionException {
		return (String) xpath.evaluate("//FTAN", xml, XPathConstants.STRING);
	}

	private String getLinkEMMFromEMM(XPath xpath, Document xml) throws XPathExpressionException {
		return (String) xpath.evaluate("//linkEmm", xml, XPathConstants.STRING);
	}

	private String getUniqueIdentifier(XPath xpath, Document xml) throws XPathExpressionException {
		return (String) xpath.evaluate(
				"concat(/record/metadata/schede/*/CD/NCT/NCTR, /record/metadata/schede/*/CD/NCT/NCTN, /record/metadata/schede/*/CD/NCT/NCTS)",
				xml, XPathConstants.STRING);
	}

	private String getCulturalPropertyURI(XPath xpath, Document xml) throws XPathExpressionException {
		Node schede = (Node) xpath.evaluate("/record/metadata/schede/*", xml, XPathConstants.NODE);
		String specificPropertyType = Utilities.getLocalName(Utilities.getSpecificPropertyType(schede.getNodeName()));
		return resourcePrefix + specificPropertyType + "/" + getItemLocalName(xpath, xml);
	}

	private String getObjectOfDescription(XPath xpath, Document xml) throws XPathExpressionException {
		String OGTP = (String) xpath.evaluate("/record/metadata/schede/*/OG/OGT/OGTP", xml, XPathConstants.STRING);
		String sheetVersion = getSheetVersion(xpath, xml);
		if (((OGTP != null) && OGTP.length() > 0)
				&& (sheetVersion.equalsIgnoreCase("4.00_ICCD0") || sheetVersion.equalsIgnoreCase("4.00"))) {
			return getCulturalPropertyComponentURI(xpath, xml);
		} else {

			return getCulturalPropertyURI(xpath, xml);
		}

	}

	private String getSheetVersion(XPath xpath, Document xml) throws XPathExpressionException {
		return (String) xpath.evaluate("/record/metadata/schede/*/@version", xml, XPathConstants.STRING);
	}

	private String getCulturalPropertyComponentURI(XPath xpath, Document xml) throws XPathExpressionException {
		Node schede = (Node) xpath.evaluate("/record/metadata/schede/*", xml, XPathConstants.NODE);
		return resourcePrefix + Utilities.getLocalName(Utilities.getSpecificPropertyType(schede.getNodeName())) + "/"
				+ getItemLocalName(xpath, xml) + "-component";
	}

	private String getItemLocalName(XPath xpath, Document xml) throws XPathExpressionException {

		String RVEL = (String) xpath.evaluate("/record/metadata/schede/*/RV/RVE/RVEL", xml, XPathConstants.STRING);

		if (RVEL != null && RVEL.length() > 0) {
			return ((String) xpath.evaluate(
					"concat(/record/metadata/schede/*/CD/NCT/NCTR, /record/metadata/schede/*/CD/NCT/NCTN, /record/metadata/schede/*/CD/NCT/NCTS)",
					xml, XPathConstants.STRING)) + "-" + Urifier.toURI(RVEL);
		} else {
			return ((String) xpath.evaluate(
					"concat(/record/metadata/schede/*/CD/NCT/NCTR, /record/metadata/schede/*/CD/NCT/NCTN, /record/metadata/schede/*/CD/NCT/NCTS)",
					xml, XPathConstants.STRING));
		}

	}

	private String getCatalogueRecordIdentifier(XPath xpath, Document xml) throws XPathExpressionException {

		String RVEL = (String) xpath.evaluate("/record/metadata/schede/*/RV/RVE/RVEL", xml, XPathConstants.STRING);

		if (RVEL != null && RVEL.length() > 0) {
			return ((String) xpath.evaluate(
					"concat(/record/metadata/schede/*/CD/NCT/NCTR, /record/metadata/schede/*/CD/NCT/NCTN, /record/metadata/schede/*/CD/NCT/NCTS, '-', /record/metadata/schede/*/RV/RVE/RVEL)",
					xml, XPathConstants.STRING));
		} else {
			return ((String) xpath.evaluate(
					"concat(/record/metadata/schede/*/CD/NCT/NCTR, /record/metadata/schede/*/CD/NCT/NCTN, /record/metadata/schede/*/CD/NCT/NCTS)",
					xml, XPathConstants.STRING));
		}

	}

	public static void main(String[] args) throws MalformedURLException, IOException {
		logger.info("ArCo Preprocessor");
		Preprocessor p = new Preprocessor(args[0], args[1], args[2]);
		p.run();
	}

}
