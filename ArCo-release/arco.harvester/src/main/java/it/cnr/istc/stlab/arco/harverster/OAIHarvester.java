package it.cnr.istc.stlab.arco.harverster;

import java.io.IOException;

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

	public static void main(String[] args) {
		try {
			Configurations configs = new Configurations();
			Configuration config = configs.properties(args[0]);

			logger.info("OAI Harvester - ArCo Project");

			logger.info(ConfigurationUtils.toString(config));

			String outputFolder = config.getString("outputFolder");
			String oaiEndpoint = config.getString("oaiEndpoint");

			Harvester h = new Harvester(oaiEndpoint, outputFolder);

			h.getRecords();

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
