package it.cnr.istc.stlab.arco.harverster;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.xpath.XPathExpressionException;

import org.apache.commons.configuration2.Configuration;
import org.apache.commons.configuration2.ConfigurationUtils;
import org.apache.commons.configuration2.builder.fluent.Configurations;
import org.apache.commons.configuration2.ex.ConfigurationException;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.xml.sax.SAXException;

public class OAIHarvester {

	private static final Logger logger = LogManager.getLogger(OAIHarvester.class);

	public static final String catalogue_records = "catalogue_records", multimedia_records = "multimedia_records",
			contenitori_fisici = "contenitori_fisici", contenitori_giuridici = "contenitori_giuridici",
			authority_files = "authority_files", altre_normative = "altre_normative", enti_base = "enti_base",
			enti_completo = "enti_completo", assegnazione = "assegnazione", progetti = "progetti",
			campagne = "campagne", attivita = "attivita";

	public static void main(String[] args) {
		try {
			Configurations configs = new Configurations();
			Configuration config = configs.properties(args[0]);

			logger.info("OAI Harvester - ArCo Project");

			logger.info(ConfigurationUtils.toString(config));

			String outputFolder = config.getString("outputFolder");
			String oaiEndpoint = config.getString("oaiEndpoint");
			Long limit = config.getLong("limit", Long.MAX_VALUE);

//			config.getList(key, defaultValue)
			List<String> allRecords = new ArrayList<>();
			allRecords.add(catalogue_records);
			allRecords.add(multimedia_records);
			allRecords.add(contenitori_fisici);
			allRecords.add(contenitori_giuridici);
			allRecords.add(authority_files);
			allRecords.add(altre_normative);
			allRecords.add(enti_base);
			allRecords.add(enti_completo);
			allRecords.add(assegnazione);
			allRecords.add(progetti);
			allRecords.add(campagne);
			allRecords.add(attivita);

			List<String> toDownload = config.getList(String.class, "records_to_download", allRecords);

			logger.trace(toDownload.toString() + " " + toDownload.size());

			Harvester h = new Harvester(oaiEndpoint, outputFolder);
			h.setLimit(limit);

			if (toDownload.contains(catalogue_records)) {
				h.setRecords(true);
				logger.trace("Download records");
			}

			if (toDownload.contains(multimedia_records)) {
				h.setMultimedia_records(true);
				logger.trace("Download multimedia records");
			}

			if (toDownload.contains(contenitori_fisici)) {
				h.setContenitoriFisici(true);
				logger.trace("Download contenitori fisici");
			}

			if (toDownload.contains(contenitori_giuridici)) {
				h.setContenitoriGiuridici(true);
				logger.trace("Download contenitori giuridici");
			}

			if (toDownload.contains(authority_files)) {
				h.setAuthorityFiles(true);
				logger.trace("Download authority files");
			}

			if (toDownload.contains(altre_normative)) {
				h.setAltreNormative(true);
				logger.trace("Download altre normative");
			}

			h.getRecords();

			// Download adminstrative data

			if (toDownload.contains(enti_base)) {
				logger.trace("Download enti base");
				AdministrativeDataHarvester adh = new AdministrativeDataHarvester(enti_base,
						outputFolder + "/" + enti_base);
				adh.setLimit(limit);
				adh.downloadRecords();
			}

			if (toDownload.contains(enti_completo)) {
				logger.trace("Download enti completo");
				AdministrativeDataHarvester adh = new AdministrativeDataHarvester(enti_completo,
						outputFolder + "/" + enti_completo);
				adh.setLimit(limit);
				adh.downloadRecords();
			}

			if (toDownload.contains(assegnazione)) {
				logger.trace("Download assegnazione");
				AdministrativeDataHarvester adh = new AdministrativeDataHarvester(assegnazione,
						outputFolder + "/" + assegnazione);
				adh.setLimit(limit);
				adh.downloadRecords();
			}

			if (toDownload.contains(campagne)) {
				logger.trace("Download campagne");
				AdministrativeDataHarvester adh = new AdministrativeDataHarvester(campagne,
						outputFolder + "/" + campagne);
				adh.setLimit(limit);
				adh.downloadRecords();
			}

			if (toDownload.contains(attivita)) {
				logger.trace("Download attività");
				AdministrativeDataHarvester adh = new AdministrativeDataHarvester(attivita,
						outputFolder + "/" + attivita);
				adh.setLimit(limit);
				adh.downloadRecords();
			}

			if (toDownload.contains(progetti)) {
				logger.trace("Download progetti");
				AdministrativeDataHarvester adh = new AdministrativeDataHarvester(progetti,
						outputFolder + "/" + progetti);
				adh.setLimit(limit);
				adh.downloadRecords();
			}

		} catch (ConfigurationException e) {
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (XPathExpressionException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (TransformerException e) {
			e.printStackTrace();
		}
	}

}
