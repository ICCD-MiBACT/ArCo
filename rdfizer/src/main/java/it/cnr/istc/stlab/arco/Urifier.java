package it.cnr.istc.stlab.arco;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

public class Urifier {
	
	public static Map<String, String> map = new HashMap<String, String>();

	public static String toURI(String label) {
		// remove accents
		label = StringUtils.stripAccents(label);
		// lowercase:
		//label = label.substring(0, 1) + label.substring(1).toLowerCase();
		label = label.toLowerCase();
		// remove various characters:
		// '
		label = label.replaceAll("[\\']", "");
		// replace various characters with whitespace:
		// - + ( ) . , & " / ??? !
		label = label.replaceAll("[;.,&\\\"???!]", "");
		// squeeze whitespace to dashes:
		label = label.replaceAll("[ \\/]", "-");
		
		label = label.replaceAll("[\\(\\)]", "");

		label = label.replaceAll("\\-$", "");
        
        label = label.replaceAll("(\\-)+", "-");

		try {
			
			/*
			String[] labelParts = label.split("\\/");
			StringBuilder sb = new StringBuilder();
			for(String labelPart : labelParts){
				if(sb.length() > 0) sb.append("/");
				sb.append(URLEncoder.encode(labelPart, "UTF-8"));
			}
			return sb.toString();
			*/
			return URLEncoder.encode(label, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return label;
		}
	}
	
}
