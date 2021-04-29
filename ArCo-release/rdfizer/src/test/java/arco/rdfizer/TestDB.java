package arco.rdfizer;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;

import org.junit.Ignore;
import org.junit.Test;

import it.cnr.istc.stlab.arco.preprocessing.PreprocessedData;
import it.cnr.istc.stlab.arco.preprocessing.Preprocessor;

public class TestDB {

	@Test
	public void testCG() {
		String dbFile = "test_db";
		new File(dbFile).delete();
		PreprocessedData pd = PreprocessedData.getInstance(false, dbFile, true);
		String resourcePrefix = "https://w3id.org/arco/resources/";
		String testFolder = "src/main/resources/testResources/harvested_resources/";
		try {
			Preprocessor p = new Preprocessor(testFolder + "records", testFolder + "multimedia_records",
					testFolder + "contenitori_fisici", testFolder + "contenitori_giuridici", resourcePrefix);
			p.run();

			assertEquals("DBunicoCG104092", pd.getContenitoreGiuridicoSystemRecordCode2CCG().get("ICCD13077042"));
			assertEquals("1472695893404", pd.getContenitoreGiuridicoSystemRecordCode2CCG().get("ICCD12441797"));

			assertEquals("1478826914798", pd.getContenitoreFisicoSystemRecordCode2CCF().get("ICCD13056667"));
			assertEquals("1477207556295", pd.getContenitoreFisicoSystemRecordCode2CCF().get("ICCD13015785"));

			assertEquals("http://www.sigecweb.beniculturali.it/images/fullsize/ICCD1060938/ICCD13814908_F1_esterno.jpg",
					pd.getFtan2URL().get("3969"));

			new File(dbFile).delete();
			resetInstance();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testlinkEMM() {
		String dbFile = "test_db";
		new File(dbFile).delete();
		PreprocessedData pd = PreprocessedData.getInstance(false, dbFile, true);
		String resourcePrefix = "https://w3id.org/arco/resources/";
		String testFolder = "src/main/resources/testResources/harvested_resources/";
		try {
			Preprocessor p = new Preprocessor(testFolder + "records", testFolder + "multimedia_records",
					testFolder + "contenitori_fisici", testFolder + "contenitori_giuridici", resourcePrefix);
			p.run();

			assertEquals("http://www.sigecweb.beniculturali.it/images/fullsize/ICCD1038895/ICCD13814302_S239_57084.jpg", pd.getFtan2URL().get("S239_57084"));
			assertEquals("http://www.sigecweb.beniculturali.it/images/fullsize/ICCD1060774/ICCD13814308_konsoantenatosvestito.jpg", pd.getFtan2URL().get("New_1524205854815"));
			assertEquals("http://www.sigecweb.beniculturali.it/images/fullsize/ICCD1022624/ICCD11173579_CRDA00078_02.mp3", pd.getFtan2URL().get("New_1401358982589"));
			

			new File(dbFile).delete();
			resetInstance();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void issue156() {
		String dbFile = "test_db";
		new File(dbFile).delete();
		PreprocessedData pd = PreprocessedData.getInstance(false, dbFile, true);
		String resourcePrefix = "https://w3id.org/arco/resources/";
		String testFolder = "src/main/resources/testResources/issue156/";
		try {
			Preprocessor p = new Preprocessor(testFolder + "records", null, null, null, resourcePrefix);
			p.run();

			System.out.println("Preprocessed data");
			pd.getUniqueIdentifier2URIs().forEach((k, l) -> {
				for (String s : l) {
					System.out.println(k + " " + s);
				}
			});
			
			System.out.println(pd.getUniqueIdentifier2URIs().get("2000243934"));

//			assertEquals("DBunicoCG104092", pd.getContenitoreGiuridicoSystemRecordCode2CCG().get("ICCD13077042"));
//			assertEquals("1472695893404", pd.getContenitoreGiuridicoSystemRecordCode2CCG().get("ICCD12441797"));
//
//			assertEquals("1478826914798", pd.getContenitoreFisicoSystemRecordCode2CCF().get("ICCD13056667"));
//			assertEquals("1477207556295", pd.getContenitoreFisicoSystemRecordCode2CCF().get("ICCD13015785"));
//
//			assertEquals("http://www.sigecweb.beniculturali.it/images/fullsize/ICCD1060938/ICCD13814908_F1_esterno.jpg",
//					pd.getFtan2URL().get("3969"));

			new File(dbFile).delete();
			resetInstance();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testRelatedWorkSituation() {
		PreprocessedData pd = PreprocessedData.getInstance();
		System.out.println(pd.getUniqueIdentifier2URIs().get("2000243934"));
		System.out.println(pd.getUniqueIdentifier2URIs().get("2000243934-1"));
		System.out.println(pd.getUniqueIdentifier2URIs().get("2000243934-2"));
		System.out.println(pd.getUniqueIdentifier2URIs().get("2000243934-3"));
		System.out.println(pd.getUniqueIdentifier2URIs().get("2000243934-5"));
		System.out.println(pd.getUniqueIdentifier2URIs().get("2000243934-6"));
		System.out.println(pd.getUniqueIdentifier2URIs().get("2000243934-7"));

//		String dbFile = "test_db";
//		new File(dbFile).delete();
//		PreprocessedData pd = PreprocessedData.getInstance(false, dbFile, true);
//		String resourcePrefix = "https://w3id.org/arco/resources/";
//		String testFolder = "src/main/resources/testResources/harvested_resources/";
//		try {
//			Preprocessor p = new Preprocessor(testFolder + "records", testFolder + "multimedia_records",
//					testFolder + "contenitori_fisici", testFolder + "contenitori_giuridici", resourcePrefix);
//			p.run();
//
//			assertEquals("DBunicoCG104092", pd.getContenitoreGiuridicoSystemRecordCode2CCG().get("ICCD13077042"));
//			assertEquals("1472695893404", pd.getContenitoreGiuridicoSystemRecordCode2CCG().get("ICCD12441797"));
//
//			assertEquals("1478826914798", pd.getContenitoreFisicoSystemRecordCode2CCF().get("ICCD13056667"));
//			assertEquals("1477207556295", pd.getContenitoreFisicoSystemRecordCode2CCF().get("ICCD13015785"));
//
//			assertEquals("http://www.sigecweb.beniculturali.it/images/fullsize/ICCD1060938/ICCD13814908_F1_esterno.jpg",
//					pd.getFtan2URL().get("3969"));
//
//			new File(dbFile).delete();
//			resetInstance();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} catch (NoSuchFieldException e) {
//			e.printStackTrace();
//		} catch (SecurityException e) {
//			e.printStackTrace();
//		} catch (IllegalArgumentException e) {
//			e.printStackTrace();
//		} catch (IllegalAccessException e) {
//			e.printStackTrace();
//		}
	}

	private static void resetInstance()
			throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {
		Field privateStringField = PreprocessedData.class.getDeclaredField("instance");
		privateStringField.setAccessible(true);
		privateStringField.set(PreprocessedData.class, null);
	}

	@Test
	@Ignore
	public void testDownload() {
		String user = System.getenv("USER");
		if (user != null && System.getenv("USER").equals("lgu")) {
			String dbFile = "test_db";
			System.out.println("Test download");
			new File(dbFile).delete();
			PreprocessedData pd = PreprocessedData.getInstance(true, dbFile, false);
			assertTrue(pd.getGenerated() > 0);

			assertEquals("ICCD_CG_0445195133451", pd.getContenitoreGiuridicoSystemRecordCode2CCG().get("ICCD13954023"));

			assertEquals("ICCD_CF_0160885714451", pd.getContenitoreFisicoSystemRecordCode2CCF().get("ICCD13963387"));

			new File(dbFile).delete();
			try {
				resetInstance();
			} catch (NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
	}

}
