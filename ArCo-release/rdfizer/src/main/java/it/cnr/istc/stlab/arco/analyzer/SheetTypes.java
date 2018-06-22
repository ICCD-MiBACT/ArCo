package it.cnr.istc.stlab.arco.analyzer;

import java.util.HashMap;
import java.util.Map;

public class SheetTypes {

	private Map<String, VersionedSheets> sheetTypes;
	
	public SheetTypes() {
		this.sheetTypes = new HashMap<String, VersionedSheets>();
	}
	
	public void putVersionedSheet(String type, VersionedSheets versionedSheet){
		sheetTypes.put(type, versionedSheet);
	}
	
	public VersionedSheets getVersionedSheet(String type) {
		return sheetTypes.get(type);
	}
}
