package it.cnr.istc.stlab.arco.harvester.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.junit.Test;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import it.cnr.istc.stlab.arco.harverster.Harvester;

public class HarvesterTest {

	private static DocumentBuilderFactory dbf;
	private static DocumentBuilder db;

	@Test
	public void testDownloadContenitoriFisici() {
		try {
			Harvester h = new Harvester("http://catalogo.beniculturali.it/oaitarget/OAIHandler?", null);
			String actual = evaluateXPath(new ByteArrayInputStream(h.getContenitoreFisico("ICCD13678576").getBytes()),
					"/record/metadata/schede/CF/CD/CCF");
			assertEquals("ICCD_CF_0863175968051", actual);

			List<String> identifiers = h.downloadRecords(null, "/contenitori_fisici", "/xml/contenitori_fisici", false);

			assertTrue(identifiers.contains("ICCD13678576"));

		} catch (ParserConfigurationException | XPathExpressionException | IOException | SAXException
				| TransformerException e) {
			e.printStackTrace();
		}
	}

	static {
		dbf = DocumentBuilderFactory.newInstance();
		try {
			db = dbf.newDocumentBuilder();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
	}

	private static String evaluateXPath(InputStream is, String xpathString)
			throws SAXException, IOException, XPathExpressionException {
		Document xml = db.parse(is);

		// Get XPath
		XPathFactory xpf = XPathFactory.newInstance();
		XPath xpath = xpf.newXPath();

		return (String) xpath.evaluate(xpathString, xml, XPathConstants.STRING);

	}
}
