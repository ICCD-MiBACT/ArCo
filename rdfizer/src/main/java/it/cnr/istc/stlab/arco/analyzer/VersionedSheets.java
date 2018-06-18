package it.cnr.istc.stlab.arco.analyzer;

import java.util.HashMap;
import java.util.Map;

public class VersionedSheets {

	private Map<String, Sheet> versionsMap;
	
	public VersionedSheets() {
		this.versionsMap = new HashMap<String, Sheet>();
	}
	
	public void putVersion(String version, Sheet sheet) {
		if(!versionsMap.containsKey(version))
			versionsMap.put(version, sheet);
	}
	
	public Sheet getSheet(String version) {
		return versionsMap.get(version);
	}
	
}
