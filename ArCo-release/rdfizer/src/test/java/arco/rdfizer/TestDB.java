package arco.rdfizer;

import static org.junit.Assert.assertEquals;

import java.io.File;
import java.io.IOException;

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

		} catch (IOException e) {
			e.printStackTrace();
		}
		new File(dbFile).delete();
	}

}
