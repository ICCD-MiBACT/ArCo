package it.cnr.istc.stlab.arco;

import java.util.HashMap;
import java.util.Map;

public class SpecificCulturalPropertyType {
	
	private static Map<String, String> sheetPropertyTypeMap;

	private static final String NAMESPACE = "https://w3id.org/arco/ontology/arco/";
	
	static{
		sheetPropertyTypeMap = new HashMap<String, String>();
		
		/*  Catalogue records for MODI
		 *  archeologico --> ArchaeologicalProperty
            architettonico e paesaggistico -->  ArchitecturalOrLandscapeHeritage 
            etnoantropologico --> DemoEthnoAnthropologicalHeritage
            storico artistico --> HistoricOrArtisticProperty
            non individuabile --> CulturalProperty
		 */
		sheetPropertyTypeMap.put("archeologico", NAMESPACE + "ArchaeologicalProperty");
		sheetPropertyTypeMap.put("architettonico e paesaggistico", NAMESPACE + "ArchitecturalOrLandscapeHeritage");
		sheetPropertyTypeMap.put("etnoantropologico", NAMESPACE + "DemoEthnoAnthropologicalHeritage");
		sheetPropertyTypeMap.put("storico artistico", NAMESPACE + "HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("storico e artistico", NAMESPACE + "HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("non individuabile", NAMESPACE + "CulturalProperty");
		
		/*
		 *  Property types for catalogue records
		 */
		
		sheetPropertyTypeMap.put("AT", NAMESPACE + "NaturalHeritage");
		sheetPropertyTypeMap.put("CA", NAMESPACE + "ArchaeologicalProperty");
		sheetPropertyTypeMap.put("MA", NAMESPACE + "ArchaeologicalProperty");
		sheetPropertyTypeMap.put("RA", NAMESPACE + "ArchaeologicalProperty");
		sheetPropertyTypeMap.put("SAS", NAMESPACE + "ArchaeologicalProperty");
		sheetPropertyTypeMap.put("SI", NAMESPACE + "ArchaeologicalProperty");
		sheetPropertyTypeMap.put("TMA", NAMESPACE + "ArchaeologicalProperty");
		sheetPropertyTypeMap.put("A", NAMESPACE + "ArchitecturalOrLandscapeHeritage");
		sheetPropertyTypeMap.put("CNS", NAMESPACE + "ArchitecturalOrLandscapeHeritage");
		sheetPropertyTypeMap.put("PG", NAMESPACE + "ArchitecturalOrLandscapeHeritage");
		sheetPropertyTypeMap.put("BDI", NAMESPACE + "DemoEthnoAnthropologicalHeritage");
		sheetPropertyTypeMap.put("BDM", NAMESPACE + "DemoEthnoAnthropologicalHeritage");
		sheetPropertyTypeMap.put("F", NAMESPACE + "PhotographicHeritage");
		sheetPropertyTypeMap.put("FF", NAMESPACE + "PhotographicHeritage");
		sheetPropertyTypeMap.put("SM", NAMESPACE + "MusicHeritage");
		sheetPropertyTypeMap.put("SMO", NAMESPACE + "MusicHeritage");
		sheetPropertyTypeMap.put("BNB", NAMESPACE + "NaturalHeritage");
		sheetPropertyTypeMap.put("BNM", NAMESPACE + "NaturalHeritage");
		sheetPropertyTypeMap.put("BNP", NAMESPACE + "NaturalHeritage");
		sheetPropertyTypeMap.put("BNPE", NAMESPACE + "NaturalHeritage");
		sheetPropertyTypeMap.put("BNPL", NAMESPACE + "NaturalHeritage");
		sheetPropertyTypeMap.put("BNZ", NAMESPACE + "NaturalHeritage");
		sheetPropertyTypeMap.put("NU", NAMESPACE + "NumismaticProperty");
		sheetPropertyTypeMap.put("PST", NAMESPACE + "ScientificOrTechnologicalHeritage");
		sheetPropertyTypeMap.put("D", NAMESPACE + "HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("MI", NAMESPACE + "HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("OA", NAMESPACE + "HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("OAC", NAMESPACE + "HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("S", NAMESPACE + "HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("VeAC", NAMESPACE + "HistoricOrArtisticProperty");
		sheetPropertyTypeMap.put("E", NAMESPACE + "DemoEthnoAnthropologicalHeritage");
	}
	
	public static String getPropertyType(String sheetType){
		return sheetPropertyTypeMap.get(sheetType);
	}
}
