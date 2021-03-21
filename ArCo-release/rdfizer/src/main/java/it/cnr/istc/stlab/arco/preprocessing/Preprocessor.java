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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

import it.cnr.istc.stlab.arco.Converter;
import it.cnr.istc.stlab.arco.Urifier;
import it.cnr.istc.stlab.arco.xsltextension.Utilities;

public class Preprocessor {

	private String recordsFolder, contenitoreFisicoFolder, resourcePrefix, multimediaRecordsFolder,
			contenitoreGiuridicoFolder, assegnazioneFolder, attivitaFolder, campagneFolder, enti_baseFolder,
			enti_completoFolder, progettiFolder;

	private static final Logger logger = LoggerFactory.getLogger(Preprocessor.class);
	private AtomicInteger countRecords = new AtomicInteger(0);
    private AtomicInteger countCFRecords = new AtomicInteger(0);
    private AtomicInteger countCGRecords = new AtomicInteger(0);
	private AtomicInteger countMultimediaRecords = new AtomicInteger(0);
	private AtomicInteger countEntiBaseRecords = new AtomicInteger(0);
	private AtomicInteger countEntiCompletoRecords = new AtomicInteger(0);
	private Map<String, String> ftan2URL, catalogueRecordIdentifier2URI, contenitoreFisicoSystemRecordCode2CCF,
			contenitoreGiuridicoSystemRecordCode2CCG, codiceEnteToNomeEnte;
	private Map<String, List<String>> uniqueIdentifier2URIs;
	private PreprocessedData pd = null;	
	
	public Preprocessor(String recordsFolder, String multimediaRecordsFolder, String contenitoreFisicoFolder,
			String contenitoreGiuridicoFolder) throws MalformedURLException, IOException {
		this(recordsFolder, multimediaRecordsFolder, contenitoreFisicoFolder,
				contenitoreGiuridicoFolder, Converter.defaultPrefix);
	}
	public Preprocessor(String recordsFolder, String multimediaRecordsFolder, String contenitoreFisicoFolder,
			String contenitoreGiuridicoFolder, String resourcePrefix) throws MalformedURLException, IOException {
		super();
		this.recordsFolder = recordsFolder;
		this.contenitoreFisicoFolder = contenitoreFisicoFolder;
		this.contenitoreGiuridicoFolder = contenitoreGiuridicoFolder;
		this.resourcePrefix = resourcePrefix;
		this.multimediaRecordsFolder = multimediaRecordsFolder;
		this.pd = PreprocessedData.getInstance(false);
		this.uniqueIdentifier2URIs = pd.getUniqueIdentifier2URIs();
		this.ftan2URL = pd.getFtan2URL();
		this.catalogueRecordIdentifier2URI = pd.getCatalogueRecordIdentifier2URI();
		this.contenitoreFisicoSystemRecordCode2CCF = pd.getContenitoreFisicoSystemRecordCode2CCF();
		this.contenitoreGiuridicoSystemRecordCode2CCG = pd.getContenitoreGiuridicoSystemRecordCode2CCG();
		this.codiceEnteToNomeEnte = pd.getCodiceEnteToNomeEnte();
	}

	public String getRecordsFolder() {
		return recordsFolder;
	}

	public void setRecordsFolder(String recordsFolder) {
		this.recordsFolder = recordsFolder;
	}

	public String getContenitoreFisicoFolder() {
		return contenitoreFisicoFolder;
	}

	public void setContenitoreFisicoFolder(String contenitoreFisicoFolder) {
		this.contenitoreFisicoFolder = contenitoreFisicoFolder;
	}

	public String getMultimediaRecordsFolder() {
		return multimediaRecordsFolder;
	}

	public void setMultimediaRecordsFolder(String multimediaRecordsFolder) {
		this.multimediaRecordsFolder = multimediaRecordsFolder;
	}

	public String getContenitoreGiuridicoFolder() {
		return contenitoreGiuridicoFolder;
	}

	public void setContenitoreGiuridicoFolder(String contenitoreGiuridicoFolder) {
		this.contenitoreGiuridicoFolder = contenitoreGiuridicoFolder;
	}

	public String getAssegnazioneFolder() {
		return assegnazioneFolder;
	}

	public void setAssegnazioneFolder(String assegnazioneFolder) {
		this.assegnazioneFolder = assegnazioneFolder;
	}

	public String getAttivitaFolder() {
		return attivitaFolder;
	}

	public void setAttivitaFolder(String attivitaFolder) {
		this.attivitaFolder = attivitaFolder;
	}

	public String getCampagneFolder() {
		return campagneFolder;
	}

	public void setCampagneFolder(String campagneFolder) {
		this.campagneFolder = campagneFolder;
	}

	public String getEnti_baseFolder() {
		return enti_baseFolder;
	}

	public void setEnti_baseFolder(String enti_baseFolder) {
		this.enti_baseFolder = enti_baseFolder;
	}

	public String getEnti_completoFolder() {
		return enti_completoFolder;
	}

	public void setEnti_completoFolder(String enti_completoFolder) {
		this.enti_completoFolder = enti_completoFolder;
	}

	public String getProgettiFolder() {
		return progettiFolder;
	}

	public void setProgettiFolder(String progettiFolder) {
		this.progettiFolder = progettiFolder;
	}

	public void run() {

		try {
			if (recordsFolder != null) {
				Files.walk(Paths.get(recordsFolder)).parallel()
						.filter(f -> FilenameUtils.isExtension(f.getFileName().toAbsolutePath().toString(), "xml"))
						.forEach(f -> preprocessRecord(f));
		        if (this.countRecords.get()!=0) logger.info("Processed " + this.countRecords + " records");
			}
	        if (multimediaRecordsFolder != null) {
				Files.walk(Paths.get(multimediaRecordsFolder)).parallel()
						.filter(f -> FilenameUtils.isExtension(f.getFileName().toAbsolutePath().toString(), "xml"))
						.forEach(f -> preprocessMultimediaRecord(f));
				if (this.countMultimediaRecords.get()!=0) logger.info("Processed " + this.countMultimediaRecords + " multimedia records");
	        }
			if (contenitoreFisicoFolder != null) {
	            Files.walk(Paths.get(contenitoreFisicoFolder)).parallel()
	                    .filter(f -> FilenameUtils.isExtension(f.getFileName().toAbsolutePath().toString(), "xml"))
	                    .forEach(f -> preprocessContenitoreFisico(f));
	            if (this.countCFRecords.get()!=0) logger.info("Processed " + this.countCFRecords + " CF records");
			}
			if (contenitoreGiuridicoFolder != null) {
	            Files.walk(Paths.get(contenitoreGiuridicoFolder)).parallel()
	                    .filter(f -> FilenameUtils.isExtension(f.getFileName().toAbsolutePath().toString(), "xml"))
	                    .forEach(f -> preprocessContenitoreGiuridico(f));
	            if (this.countCGRecords.get()!=0) logger.info("Processed " + this.countCGRecords + " CG records");
			}
			if (enti_baseFolder != null) {
				Files.walk(Paths.get(enti_baseFolder)).parallel()
						.filter(f -> FilenameUtils.isExtension(f.getFileName().toAbsolutePath().toString(), "xml"))
						.forEach(f -> preprocessEntiBase(f));
	            if (this.countEntiBaseRecords.get()!=0) logger.info("Processed " + this.countEntiBaseRecords + " enti base records");
			}
			if (enti_completoFolder != null) {
				Files.walk(Paths.get(enti_completoFolder)).parallel()
						.filter(f -> FilenameUtils.isExtension(f.getFileName().toAbsolutePath().toString(), "xml"))
						.forEach(f -> preprocessEntiCompleto(f));
	            if (this.countEntiCompletoRecords.get()!=0) logger.info("Processed " + this.countEntiCompletoRecords + " enti completo records");
			}
			pd.commit();

			//logger.info("Preprocessing ended");

		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
    public void commit() { if (pd!=null) pd.commit(); }
	public void close() { if (pd!=null) pd.close();	}

	private void preprocessMultimediaRecord(Path f) {

		if (this.countMultimediaRecords.get()!=0 && (this.countMultimediaRecords.get() % 10000) == 0) {
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

		if (this.countRecords.get()!=0 && (this.countRecords.get() % 10000) == 0) {
			logger.info("Processed " + this.countRecords + " records");
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
				uris.add(uriObjectOfDescription);
                uniqueIdentifier2URIs.put(uniqueIdentifier, uris);
			}
			else if (!uris.contains(uriObjectOfDescription)) uris.add(uriObjectOfDescription);
			catalogueRecordIdentifier2URI.put(catalogueRecordIdentifier, uriObjectOfDescription);

		} catch (SAXException | IOException | ParserConfigurationException | XPathExpressionException e) {
			e.printStackTrace();
		} catch (Exception e) {
			logger.info("Error while processing " + f.toFile().getAbsolutePath() + " " + e.getMessage());

		}

	}

	private void preprocessContenitoreFisico(Path f) {

		if (this.countCFRecords.get()!=0 && (this.countCFRecords.get() % 10000) == 0) {
			logger.info("Processed " + this.countCFRecords + " CF records");
		}

		this.countCFRecords.incrementAndGet();

		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document xml = db.parse(f.toFile());

			// Get XPath
			XPathFactory xpf = XPathFactory.newInstance();
			XPath xpath = xpf.newXPath();

			this.contenitoreFisicoSystemRecordCode2CCF.put(FilenameUtils.getBaseName(f.toFile().getName()),
					getCCF(xpath, xml));

		} catch (SAXException | IOException | ParserConfigurationException | XPathExpressionException e) {
			e.printStackTrace();
		} catch (Exception e) {
			logger.info("Error while processing " + f.toFile().getAbsolutePath() + " " + e.getMessage());

		}

	}

	private void preprocessContenitoreGiuridico(Path f) {

		if (this.countCGRecords.get()!=0 && (this.countCGRecords.get() % 10000) == 0) {
			logger.info("Processed " + this.countCGRecords + " CG records");
		}

		this.countCGRecords.incrementAndGet();

		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document xml = db.parse(f.toFile());

			// Get XPath
			XPathFactory xpf = XPathFactory.newInstance();
			XPath xpath = xpf.newXPath();

			logger.trace("Adding CG map " + FilenameUtils.getBaseName(f.toFile().getName()) + " -> " + getCCG(xpath, xml));

			this.contenitoreGiuridicoSystemRecordCode2CCG.put(FilenameUtils.getBaseName(f.toFile().getName()),
					getCCG(xpath, xml));

		} catch (SAXException | IOException | ParserConfigurationException | XPathExpressionException e) {
			e.printStackTrace();
		} catch (Exception e) {
			logger.info("Error while processing " + f.toFile().getAbsolutePath() + " " + e.getMessage());

		}

	}

	private void preprocessEntiBase(Path f) {
		// TODO
		if (this.countEntiBaseRecords.get()!=0 && (this.countEntiBaseRecords.get() % 10000) == 0) {
			logger.info("Processed " + this.countEntiBaseRecords + " enti base records");
		}

		this.countEntiBaseRecords.incrementAndGet();

		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document xml = db.parse(f.toFile());

			// Get XPath
			XPathFactory xpf = XPathFactory.newInstance();
			XPath xpath = xpf.newXPath();

			String codiceEnte = getCodiceEnte(xpath, xml);
			String nomeEnte = getNomeEnte(xpath, xml);

			logger.trace("{} {} -> {}", f.toFile().getName(), codiceEnte, nomeEnte);

			this.codiceEnteToNomeEnte.put(codiceEnte, nomeEnte);

		} catch (SAXException | IOException | ParserConfigurationException | XPathExpressionException e) {
			e.printStackTrace();
		} catch (Exception e) {
			logger.info("Error while processing " + f.toFile().getAbsolutePath() + " " + e.getMessage());

		}

	}

	private void preprocessEntiCompleto(Path f) {
		if (this.countEntiCompletoRecords.get()!=0 && (this.countEntiCompletoRecords.get() % 10000) == 0) {
			logger.info("Processed " + this.countEntiCompletoRecords + " enti completo records");
		}

		this.countEntiCompletoRecords.incrementAndGet();

		try {
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document xml = db.parse(f.toFile());

			// Get XPath
			XPathFactory xpf = XPathFactory.newInstance();
			XPath xpath = xpf.newXPath();

			String codiceEnte = getCodiceEnte(xpath, xml);
			String nomeEnte = getNomeEnte(xpath, xml);

			logger.trace("{} {} -> {}", f.toFile().getName(), codiceEnte, nomeEnte);

			this.codiceEnteToNomeEnte.put(codiceEnte, nomeEnte);

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

	private String getCCF(XPath xpath, Document xml) throws XPathExpressionException {
		String CCF = (String) xpath.evaluate("/record/metadata/schede/CF/CD/CCF", xml, XPathConstants.STRING);
		return CCF;

	}

	private String getCCG(XPath xpath, Document xml) throws XPathExpressionException {
		String CCF = (String) xpath.evaluate("/record/metadata/schede/CG/CD/CCG", xml, XPathConstants.STRING);
		return CCF;

	}

	private String getCodiceEnte(XPath xpath, Document xml) throws XPathExpressionException {
		return (String) xpath.evaluate("/administrativeDataRecord/metadata/ente/codiceEnte", xml,
				XPathConstants.STRING);
	}

	private String getNomeEnte(XPath xpath, Document xml) throws XPathExpressionException {
		return (String) xpath.evaluate("/administrativeDataRecord/metadata/ente/nomeEnte", xml, XPathConstants.STRING);
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
		Preprocessor p = new Preprocessor(args[0], args[1], args[2], args[3], args[4]);
		p.run();
		PreprocessedData.getInstance().close();
	}

}
