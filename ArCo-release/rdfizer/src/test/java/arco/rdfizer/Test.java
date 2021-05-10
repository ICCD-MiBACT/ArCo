package arco.rdfizer;

import it.cnr.istc.stlab.arco.preprocessing.PreprocessedData;

public class Test {
	public static void main(String[] args) {
		PreprocessedData pd = PreprocessedData.getInstance(false);
		
		System.out.println(pd.getFtan2URL().get("New_1401864636006"));
		System.out.println(pd.getFtan2URL().get("PZ_DRA_IGM_02"));
		System.out.println(pd.getFtan2URL().get("PZ_DEL_01"));
		
		
	}
}
