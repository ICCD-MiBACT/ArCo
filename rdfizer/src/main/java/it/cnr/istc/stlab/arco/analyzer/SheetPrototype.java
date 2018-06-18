package it.cnr.istc.stlab.arco.analyzer;

public class SheetPrototype {

	private String sheetType, sheetVersion;
	
	public SheetPrototype(String sheetType, String sheetVersion) {
		this.sheetType = sheetType;
		this.sheetVersion = sheetVersion;
	}
	
	public String getSheetType() {
		return sheetType;
	}
	
	public String getSheetVersion() {
		return sheetVersion;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof SheetPrototype)
			return (sheetType + sheetVersion).equals(((SheetPrototype)obj).sheetType + ((SheetPrototype)obj).sheetVersion);
		
		return false;
	}
	
	@Override
	public int hashCode() {
		return (sheetType + sheetVersion).hashCode();
	}
	
	@Override
	public String toString() {
		return sheetType + sheetVersion;
	}
	
}
