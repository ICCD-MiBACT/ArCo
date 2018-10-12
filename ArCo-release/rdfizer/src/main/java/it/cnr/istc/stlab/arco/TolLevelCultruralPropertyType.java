package it.cnr.istc.stlab.arco;

import java.util.HashMap;
import java.util.Map;

public class TolLevelCultruralPropertyType {

	private static Map<String, String> sheetPropertyTypeMap;
	
	static{
		sheetPropertyTypeMap = new HashMap<String, String>();
		
		sheetPropertyTypeMap.put("AT", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("CA", "https://w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("MA", "https://w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("RA", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("SAS", "https://w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("SI", "https://w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("TMA", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("A", "https://w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("A", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("CNS", "https://w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("PG", "https://w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("BDI", "https://w3id.org/arco/core/IntangibleCulturalProperty");
		sheetPropertyTypeMap.put("BDM", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("F", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("FF", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("SM", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("SMO", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNB", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNM", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNP", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNPE", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNPL", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNZ", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("NU", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("PST", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("D", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("MI", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("OA", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("OAC", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("S", "https://w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("VeAC", "https://w3id.org/arco/core/MovableCulturalProperty");

	}
	
	public static String getPropertyType(String sheetType){
		return sheetPropertyTypeMap.get(sheetType);
	}
	

}
