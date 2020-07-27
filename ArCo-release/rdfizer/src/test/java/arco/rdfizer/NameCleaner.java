package arco.rdfizer;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class NameCleaner {

	@Test
	public void test() {
		it.cnr.istc.stlab.arco.xsltextension.NameCleaner nc = it.cnr.istc.stlab.arco.xsltextension.NameCleaner
				.getInstance();
		assertEquals("Luigi Asprino", nc.nameCleaner("Luigi Asprino"));
		assertEquals("Luigi Maria Asprino", nc.nameCleaner("Luigi Maria Asprino"));
		assertEquals("Luigi Maria Asprino", nc.nameCleaner("Asprino Luigi Maria"));
		assertEquals("Luigi Maria Asprino", nc.nameCleaner("Asprino, Luigi Maria"));
		assertEquals("Luigi Maria Gennaro Asprino", nc.nameCleaner("Asprino Luigi Maria Gennaro"));
		assertEquals("Luigi Maria Gennaro Asprino", nc.nameCleaner("Asprino, Luigi Maria Gennaro"));
		assertEquals("Luigi Asprino", nc.nameCleaner("Asprino Luigi"));
		assertEquals("Luigi Asprino", nc.nameCleaner("Asprino, Luigi"));
		assertEquals("Luigi Asprino", nc.nameCleaner("Luigi, Asprino"));
		assertEquals("Luigi De Maria", nc.nameCleaner("Luigi De Maria"));
		assertEquals("Luigi Maria De Maria", nc.nameCleaner("Luigi Maria De Maria"));
		assertEquals("Luigi De Maria", nc.nameCleaner("De Maria, Luigi"));
		assertEquals("Luigi Sergio", nc.nameCleaner("Luigi Sergio"));
		assertEquals("Luigi Giovanni Sergio", nc.nameCleaner("Luigi Giovanni Sergio"));
		assertEquals("Xxx Aaaa", nc.nameCleaner("xxx aaaa"));
		assertEquals("Mario Rossi Bianchi", nc.nameCleaner("Bianchi, Mario Rossi"));
		assertEquals("Mario Rossi Bianchi", nc.nameCleaner("Rossi Bianchi, Mario"));
		assertEquals("Luigi Asprino", nc.nameCleaner("LUIGI ASPRINO"));
		assertEquals("Luigi Asprino", nc.nameCleaner("luigi asprino"));
		assertEquals("", nc.nameCleaner(""));
		assertEquals("", nc.nameCleaner(null));
	}

}
