package it.cnr.istc.stlab.arco.harvester.test;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.xpath.XPathExpressionException;

import org.apache.commons.io.FileUtils;
import org.junit.Test;
import org.xml.sax.SAXException;

import it.cnr.istc.stlab.arco.harverster.Harvester;

public class TestDownload {

	@Test
	public void downloadResources() {
		try {
			FileUtils.deleteDirectory(new File("src/main/resources/test_harvesting"));
			Harvester h = new Harvester("http://www.catalogo-old.beniculturali.it/oaitarget/OAIHandler?",
					"src/main/resources/test_harvesting");
			h.setLimit(100);

			h.setRecords(true);
			h.setMultimedia_records(true);
			h.setContenitoriFisici(true);
			h.setContenitoriGiuridici(true);
			h.setAuthorityFiles(true);
			h.setAltreNormative(true);
			h.getRecords();

			assertTrue(new File("src/main/resources/test_harvesting/records/0").listFiles().length == 100);
			assertTrue(new File("src/main/resources/test_harvesting/multimedia_records/0").listFiles().length == 100);
			assertTrue(new File("src/main/resources/test_harvesting/contenitori_fisici/0").listFiles().length == 100);
			assertTrue(
					new File("src/main/resources/test_harvesting/contenitori_giuridici/0").listFiles().length == 100);
			assertTrue(new File("src/main/resources/test_harvesting/altre_normative/0").listFiles().length == 100);
			assertTrue(new File("src/main/resources/test_harvesting/authority_file/0").listFiles().length == 100);

			FileUtils.deleteDirectory(new File("src/main/resources/test_harvesting"));

		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (XPathExpressionException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (TransformerException e) {
			e.printStackTrace();
		}

	}

}
