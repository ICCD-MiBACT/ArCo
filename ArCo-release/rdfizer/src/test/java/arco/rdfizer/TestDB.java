package arco.rdfizer;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;

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

	private static void resetInstance()
			throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {
		Field privateStringField = PreprocessedData.class.getDeclaredField("instance");
		privateStringField.setAccessible(true);
		privateStringField.set(PreprocessedData.class, null);
	}

	@Test
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
