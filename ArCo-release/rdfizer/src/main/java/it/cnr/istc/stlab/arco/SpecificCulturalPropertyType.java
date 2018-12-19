package it.cnr.istc.stlab.arco;

import java.util.HashMap;
import java.util.Map;

public class SpecificCulturalPropertyType {
	
private static Map<String, String> sheetPropertyTypeMap;
	
	static{
		sheetPropertyTypeMap = new HashMap<String, String>();
		
		sheetPropertyTypeMap.put("AT", "https://w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("CA", "https://w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("MA", "https://w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("RA", "https://w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("SAS", "https://w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("SI", "https://w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("TMA", "https://w3id.org/arco/core/ArchaeologicalProperty");
		sheetPropertyTypeMap.put("A", "https://w3id.org/arco/core/ArchitecturalOrLandscapeHeritage");
		sheetPropertyTypeMap.put("CNS", "https://w3id.org/arco/core/ArchitecturalOrLandscapeHeritage");
		sheetPropertyTypeMap.put("PG", "https://w3id.org/arco/core/ArchitecturalOrLandscapeHeritage");
		sheetPropertyTypeMap.put("BDI", "https://w3id.org/arco/core/DemoEthnoAnthropologicalHeritage");
		sheetPropertyTypeMap.put("BDM", "https://w3id.org/arco/core/DemoEthnoAnthropologicalHeritage");
		sheetPropertyTypeMap.put("F", "https://w3id.org/arco/core/PhotographicHeritage");
		sheetPropertyTypeMap.put("FF", "https://w3id.org/arco/core/PhotographicHeritage");
		sheetPropertyTypeMap.put("SM", "https://w3id.org/arco/core/MusicHeritage");
		sheetPropertyTypeMap.put("SMO", "https://w3id.org/arco/core/MusicHeritage");
		sheetPropertyTypeMap.put("BNB", "https://w3id.org/arco/core/NaturalHeritage");
		sheetPropertyTypeMap.put("BNM", "https://w3id.org/arco/core/NaturalHeritage");
		sheetPropertyTypeMap.put("BNP", "https://w3id.org/arco/core/NaturalHeritage");
		sheetPropertyTypeMap.put("BNPE", "https://w3id.org/arco/core/NaturalHeritage");
		sheetPropertyTypeMap.put("BNPL", "https://w3id.org/arco/core/NaturalHeritage");
		sheetPropertyTypeMap.put("BNZ", "https://w3id.org/arco/core/NaturalHeritage");
		sheetPropertyTypeMap.put("NU", "https://w3id.org/arco/core/NumismaticProperty");
		sheetPropertyTypeMap.put("PST", "https://w3id.org/arco/core/ScientificOrTechnologicalHeritage");
		sheetPropertyTypeMap.put("D", "https://w3id.org/arco/core/HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("MI", "https://w3id.org/arco/core/HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("OA", "https://w3id.org/arco/core/HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("OAC", "https://w3id.org/arco/core/HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("S", "https://w3id.org/arco/core/HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("VeAC", "https://w3id.org/arco/core/HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("E", "https://w3id.org/arco/core/DemoEthnoAnthropologicalHeritage");
	}
	
	public static String getPropertyType(String sheetType){
		return sheetPropertyTypeMap.get(sheetType);
	}
}
