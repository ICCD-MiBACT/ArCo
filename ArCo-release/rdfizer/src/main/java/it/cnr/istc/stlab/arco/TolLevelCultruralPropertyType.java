package it.cnr.istc.stlab.arco;

import java.util.HashMap;
import java.util.Map;

public class TolLevelCultruralPropertyType {

	private static Map<String, String> sheetPropertyTypeMap;
	
	static{
		sheetPropertyTypeMap = new HashMap<String, String>();
		
		sheetPropertyTypeMap.put("AT", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("CA", "http://www.w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("MA", "http://www.w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("RA", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("SAS", "http://www.w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("SI", "http://www.w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("TMA", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("A", "http://www.w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("A", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("CNS", "http://www.w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("PG", "http://www.w3id.org/arco/core/ImmovableCulturalProperty");
		sheetPropertyTypeMap.put("BDI", "http://www.w3id.org/arco/core/IntangibleCulturalProperty");
		sheetPropertyTypeMap.put("BDM", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("F", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("FF", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("SM", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("SMO", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNB", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNM", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNP", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNPE", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNPL", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("BNZ", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("NU", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("PST", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("D", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("MI", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("OA", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("OAC", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("S", "http://www.w3id.org/arco/core/MovableCulturalProperty");
		sheetPropertyTypeMap.put("VeAC", "http://www.w3id.org/arco/core/MovableCulturalProperty");

	}
	
	public static String getPropertyType(String sheetType){
		return sheetPropertyTypeMap.get(sheetType);
	}
	

}
