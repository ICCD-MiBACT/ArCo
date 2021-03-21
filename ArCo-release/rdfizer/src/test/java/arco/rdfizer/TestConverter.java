package arco.rdfizer;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.jena.graph.NodeFactory;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.Property;
import org.apache.jena.rdf.model.RDFNode;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestName;

import it.cnr.istc.stlab.arco.Converter;

public class TestConverter {

	@Rule
	public TestName name = new TestName();

	private static String ns = "https://w3id.org/arco/ontology/core/";

	@Test
	public void testContenitoriFisici() {
		Converter converter = new Converter();

		converter.addXSTLConverter(new File("src/main/resources/testXSTL/" + name.getMethodName() + ".xslt").toPath());

		try {
			InputStream inputStream = new FileInputStream(
					new File("src/main/resources/testResources/harvested_resources/records/0/ICCD14703539.xml"));
			Model model = converter.convert("ICCD14703539", "https://w3id.org/arco/resource/",
					"http://www.catalogo.beniculturali.it/sigecSSU_FE/dettaglioScheda.action?keycode=", inputStream);

			assertEquals("1470714155345",
					model.getGraph().find(null, NodeFactory.createURI(ns + name.getMethodName()), null).next()
							.getObject().getLiteral().toString());

//			System.out.println(
//					PreprocessedData.getInstance().getContenitoreFisicoSystemRecordCode2CCF().get("ICCD13963387"));
//
//			System.out.println(PreprocessedData.getInstance().getContenitoreFisicoSystemRecordCode2CCF().keySet()
//					.iterator().next());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			converter.destroy();
		}
	}

	@Test
	public void testContenitoriGiuridici() {
		Converter converter = new Converter();

		converter.addXSTLConverter(new File("src/main/resources/testXSTL/" + name.getMethodName() + ".xslt").toPath());

		try {
			InputStream inputStream = new FileInputStream(
					new File("src/main/resources/testResources/harvested_resources/records/0/ICCD14711365.xml"));
			Model model = converter.convert("ICCD14713458", "https://w3id.org/arco/resource/",
					"http://www.catalogo.beniculturali.it/sigecSSU_FE/dettaglioScheda.action?keycode=", inputStream);
			String actual = model.getGraph().find(null, NodeFactory.createURI(ns + name.getMethodName()), null).next()
					.getObject().getLiteral().toString();
//			System.out.println("Expected ICCD_CG_6292999854941 actual " + actual);
			assertEquals("ICCD_CG_6292999854941", actual);

//			System.out.println(
//					PreprocessedData.getInstance().getContenitoreGiuridicoSystemRecordCode2CCG().get("ICCD13432299"));

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			converter.destroy();
		}
	}
	
	
	@Test
	public void testCodiceEnteToNomeEnte() {
		Converter converter = new Converter();

		converter.addXSTLConverter(new File("src/main/resources/testXSTL/" + name.getMethodName() + ".xslt").toPath());

		try {
			InputStream inputStream = new FileInputStream(
					new File("src/main/resources/testResources/harvested_resources/records/0/ICCD14703539.xml"));
			Model model = converter.convert("ICCD14703539", "https://w3id.org/arco/resource/",
					"http://www.catalogo.beniculturali.it/sigecSSU_FE/dettaglioScheda.action?keycode=", inputStream);
			String actual = model.getGraph().find(null, NodeFactory.createURI(ns + name.getMethodName()), null).next()
					.getObject().getLiteral().toString();
			assertEquals("Soprintendenza per i Beni Storici Artistici ed Etnoantropologici della Puglia", actual);

//			System.out.println(
//					PreprocessedData.getInstance().getContenitoreGiuridicoSystemRecordCode2CCG().get("ICCD13432299"));

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			converter.destroy();
		}
	}


	@Test
	public void testConverterPrefix() {
		Converter converter = new Converter();
		try {
			String testNS = "http://arco.istc.cnr.it/ns/";
			InputStream inputStream = new FileInputStream(
					new File("src/main/resources/testResources/harvested_resources/records/0/ICCD14711365.xml"));
			Model model = converter.convert("ICCD14713458", testNS,
					"http://www.catalogo.beniculturali.it/sigecSSU_FE/dettaglioScheda.action?keycode=", inputStream);
			boolean actual = model
					.listStatements(model.createResource(testNS + "HistoricOrArtisticProperty/0500707052"),
							(Property) null, (RDFNode) null)
					.hasNext();

			assertTrue(actual);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			converter.destroy();
		}
	}

	@Test
	public void testRelatedWork() {
		Converter converter = new Converter();

		converter.addXSTLConverter(new File("src/main/resources/testXSTL/" + name.getMethodName() + ".xslt").toPath());

		try {
			InputStream inputStream = new FileInputStream(
					new File("src/main/resources/testResources/issue156/records/issue156-1.xml"));
			Model model = converter.convert("ICCD14703539", "https://w3id.org/arco/resource/",
					"http://www.catalogo.beniculturali.it/sigecSSU_FE/dettaglioScheda.action?keycode=", inputStream);
			
//			model.write(System.out,"TTL");

			int i = Integer.parseInt(model.getGraph().find(null, NodeFactory.createURI(ns + "count"), null).next()
					.getObject().getLiteralValue().toString());

			assertEquals(i, 8);
			
//			System.out.println(model.getGraph().find(null, NodeFactory.createURI(ns + "count"), null).next()
//			.getObject().getLiteralValue());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			converter.destroy();
		}
	}

	@Test
	public void testIssue188() {
		Converter converter = new Converter();

		try {
			InputStream inputStream = new FileInputStream(
					new File("src/main/resources/testResources/issue188/issue188.xml"));
			Model model = converter.convert("TEST", "https://w3id.org/arco/resource/",
					"http://www.catalogo.beniculturali.it/sigecSSU_FE/dettaglioScheda.action?keycode=", inputStream);

			System.out.println(model.size());

			//model.write(System.out,"TTL");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			converter.destroy();
		}
	}

}
