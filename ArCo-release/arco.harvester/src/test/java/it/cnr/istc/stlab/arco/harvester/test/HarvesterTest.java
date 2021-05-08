package it.cnr.istc.stlab.arco.harvester.test;

import static org.junit.Assert.assertEquals;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

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
			Harvester h = new Harvester("http://www.catalogo-old.beniculturali.it/oaitarget/OAIHandler?", null);

			String actual = evaluateXPath(new ByteArrayInputStream(h.getContenitoreFisico("ICCD13678576").getBytes()),
					"/record/metadata/schede/CF/CD/CCF");

			assertEquals("ICCD_CF_0863175968051", actual);

			String actual2 = evaluateXPath(new ByteArrayInputStream(h.getContenitoreFisico("ICCD13963387").getBytes()),
					"/record/metadata/schede/CF/CD/CCF");

			assertEquals("ICCD_CF_0160885714451", actual2);

		} catch (ParserConfigurationException | XPathExpressionException | IOException | SAXException
				| TransformerException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testDownloadContenitoriGiuridici() {
		try {
			Harvester h = new Harvester("http://www.catalogo-old.beniculturali.it/oaitarget/OAIHandler?", null);

			String actual = evaluateXPath(
					new ByteArrayInputStream(h.getContenitoreGiuridico("ICCD13954023").getBytes()),
					"/record/metadata/schede/CG/CD/CCG");

			assertEquals("ICCD_CG_0445195133451", actual);

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
