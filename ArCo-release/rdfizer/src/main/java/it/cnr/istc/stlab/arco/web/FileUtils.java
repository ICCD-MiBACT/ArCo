package it.cnr.istc.stlab.arco.web;
public class FileUtils {

	public static String getNamePackage(Class<?> c) {

		String[] arr = c.getCanonicalName().split("\\.");
		StringBuilder sb = new StringBuilder();
		sb.append(arr[0]);
		for (int i = 1; i < arr.length - 1; i++) {
			sb.append("." + arr[i]);
		}

		return sb.toString();
	}

}