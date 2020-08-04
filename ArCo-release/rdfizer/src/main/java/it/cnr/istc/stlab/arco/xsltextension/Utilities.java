package it.cnr.istc.stlab.arco.xsltextension;

import it.cnr.istc.stlab.arco.SpecificCulturalPropertyType;

public class Utilities {

	public static String getLocalName(String arg) {
		int lastSlash = arg.lastIndexOf("/");
		int lastHash = arg.lastIndexOf("#");

		if (lastHash > lastSlash)
			arg = arg.substring(lastHash + 1);
		else if (lastSlash > lastHash)
			arg = arg.substring(lastSlash + 1);
		return arg;
	}
	
	public static String getSpecificPropertyType(String arg) {
		arg = SpecificCulturalPropertyType.getPropertyType(arg);
        
        if(arg == null) arg = "http://www.w3id.org/arco/core/CulturalProperty";
        
        return arg;
	}
	
	public static void main(String[] args) {
		System.out.println(getSpecificPropertyType("S"));
	}
	

}
