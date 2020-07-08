package it.cnr.istc.stlab.arco.preprocessing;

import java.util.Map;


public class TestPreprocessor {

	public static void main(String[] args) {
		Map<String, String> ftan2URL = PreprocessedData.getInstance().getFtan2URL(),
				uniqueIdentifier2URI = PreprocessedData.getInstance().getUniqueIdentifier2URI(),
				cat2URI = PreprocessedData.getInstance().getCatalogueRecordIdentifier2URI();
		System.out.println(uniqueIdentifier2URI.get("0800196607"));
		System.out.println(ftan2URL.get("PD_Bacch2018_00009"));
		System.out.println(cat2URI.get("0800196607"));
	}

}
