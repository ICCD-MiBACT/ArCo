package it.cnr.istc.stlab.arco.harvester.test;

import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;

import org.junit.Test;

import it.cnr.istc.stlab.arco.harverster.Harvester;

public class CheckExistenceInIdentifierList {

	@Test
	public void testDownloadContenitoriFisici() {
		try {
			Harvester h = new Harvester("http://www.catalogo-old.beniculturali.it/oaitarget/OAIHandler?", null);

			List<String> identifiers = h.downloadRecords(null, "/contenitori_fisici", "/xml/contenitori_fisici", false, null,null);

			System.out.println("Numero di contenitori fisici: " + identifiers.size());
			assertTrue(identifiers.contains("ICCD13678576"));
			assertTrue(identifiers.contains("ICCD13963387"));

		} catch (ParserConfigurationException | IOException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testDownloadContenitoriGiuridici() {
		try {
			Harvester h = new Harvester("http://www.catalogo-old.beniculturali.it/oaitarget/OAIHandler?", null);

			List<String> identifiers = h.downloadRecords(null, "/contenitori_giuridici", "/xml/contenitori_giuridici",
					false, null, null);

			assertTrue(identifiers.contains("ICCD13954023"));

		} catch (ParserConfigurationException | IOException e) {
			e.printStackTrace();
		}
	}

}
