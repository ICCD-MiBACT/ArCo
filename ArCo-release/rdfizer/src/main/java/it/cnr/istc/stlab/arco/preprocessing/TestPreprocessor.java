package it.cnr.istc.stlab.arco.preprocessing;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class TestPreprocessor {

	public static void main(String[] args) {
		Map<String, String> ftan2URL = PreprocessedData.getInstance(true).getFtan2URL(),
//				uniqueIdentifier2URI = PreprocessedData.getInstance().getUniqueIdentifier2URI(),
				cat2URI = PreprocessedData.getInstance(true).getCatalogueRecordIdentifier2URI();
//		System.out.println(uniqueIdentifier2URI.get("0800196607"));
		System.out.println(ftan2URL.get("OAC-5i010-00006_02"));
//		System.out.println(cat2URI.get("0800196607"));

		List<String> uris = PreprocessedData.getInstance(true).getUniqueIdentifier2URIs().get("0500436575");

//		System.out.println(PreprocessedData.getInstance(true).getUniqueIdentifier2URIs());

		Set<String> keys = PreprocessedData.getInstance(true).getUniqueIdentifier2URIs().keySet();

		System.out.println("\"" + keys.iterator().next() + "\"");

		if (uris == null) {
			System.out.println("null");
		} else {
			System.out.println(uris.size());
		}
	}

}
