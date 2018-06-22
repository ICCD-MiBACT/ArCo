package it.cnr.istc.stlab.arco;

import java.util.HashMap;
import java.util.Map;

public class SpecificCulturalPropertyType {
	
private static Map<String, String> sheetPropertyTypeMap;
	
	static{
		sheetPropertyTypeMap = new HashMap<String, String>();
		
		sheetPropertyTypeMap.put("AT", "http://www.w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("CA", "http://www.w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("MA", "http://www.w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("RA", "http://www.w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("SAS", "http://www.w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("SI", "http://www.w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("TMA", "http://www.w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("A", "http://www.w3id.org/arco/core/ArchitecturalOrLandscapeHeritage");
		sheetPropertyTypeMap.put("CNS", "http://www.w3id.org/arco/core/ArchitecturalOrLandscapeHeritage");
		sheetPropertyTypeMap.put("PG", "http://www.w3id.org/arco/core/ArchitecturalOrLandscapeHeritage");
		sheetPropertyTypeMap.put("BDI", "http://www.w3id.org/arco/core/DemoEthnoAnthropologicalHeritage");
		sheetPropertyTypeMap.put("BDM", "http://www.w3id.org/arco/core/DemoEthnoAnthropologicalHeritage");
		sheetPropertyTypeMap.put("F", "http://www.w3id.org/arco/core/PhotographicHeritage");
		sheetPropertyTypeMap.put("FF", "http://www.w3id.org/arco/core/PhotographicHeritage");
		sheetPropertyTypeMap.put("SM", "http://www.w3id.org/arco/core/MusicHeritage");
		sheetPropertyTypeMap.put("SMO", "http://www.w3id.org/arco/core/MusicHeritage");
		sheetPropertyTypeMap.put("BNB", "http://www.w3id.org/arco/core/NaturalHeritage");
		sheetPropertyTypeMap.put("BNM", "http://www.w3id.org/arco/core/NaturalHeritage");
		sheetPropertyTypeMap.put("BNP", "http://www.w3id.org/arco/core/NaturalHeritage");
		sheetPropertyTypeMap.put("BNPE", "http://www.w3id.org/arco/core/NaturalHeritage");
		sheetPropertyTypeMap.put("BNPL", "http://www.w3id.org/arco/core/NaturalHeritage");
		sheetPropertyTypeMap.put("BNZ", "http://www.w3id.org/arco/core/NaturalHeritage");
		sheetPropertyTypeMap.put("NU", "http://www.w3id.org/arco/core/NumismaticProperty");
		sheetPropertyTypeMap.put("PST", "http://www.w3id.org/arco/core/ScientificOrTechnologicalHeritage");
		sheetPropertyTypeMap.put("D", "http://www.w3id.org/arco/core/HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("MI", "http://www.w3id.org/arco/core/HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("OA", "http://www.w3id.org/arco/core/HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("OAC", "http://www.w3id.org/arco/core/HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("S", "http://www.w3id.org/arco/core/HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("VeAC", "http://www.w3id.org/arco/core/HistoricOrArtisticProperty");

	}
	
	public static String getPropertyType(String sheetType){
		return sheetPropertyTypeMap.get(sheetType);
	}
}
