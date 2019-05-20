package it.cnr.istc.stlab.arco;

import java.util.HashMap;
import java.util.Map;

public class TopLevelCultruralPropertyType {

	private static Map<String, String> sheetPropertyTypeMap;
	
	private static final String NAMESPACE = "https://w3id.org/arco/ontology/arco/";
	
	static{
		sheetPropertyTypeMap = new HashMap<String, String>();
		
		sheetPropertyTypeMap.put("AT", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("CA", NAMESPACE + "ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("MA", NAMESPACE + "ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("RA", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("SAS", NAMESPACE + "ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("SI", NAMESPACE + "ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("TMA", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("A", NAMESPACE + "ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("CNS", NAMESPACE + "ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("PG", NAMESPACE + "ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("BDI", NAMESPACE + "IntangibleCulturalProperty");
		sheetPropertyTypeMap.put("BDM", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("F", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("FF", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("SM", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("SMO", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNB", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNM", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNP", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNPE", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNPL", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNZ", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("NU", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("PST", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("D", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("MI", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("OA", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("OAC", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("S", NAMESPACE + "MovableCulturalProperty");
		sheetPropertyTypeMap.put("VeAC", NAMESPACE + "MovableCulturalProperty");

	}
	
	public static String getPropertyType(String sheetType){
		return sheetPropertyTypeMap.get(sheetType);
	}
	

}
