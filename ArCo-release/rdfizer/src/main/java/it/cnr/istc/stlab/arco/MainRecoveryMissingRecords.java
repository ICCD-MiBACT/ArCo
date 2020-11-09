package it.cnr.istc.stlab.arco;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.jena.rdf.model.Model;

import com.google.common.collect.Lists;

public class MainRecoveryMissingRecords {

	
	public static void main(String[] args) {
		String inFolderString = args[0];
		String outFolderString = args[1];
		String missingListFileString = args[2];
		File inFolder = new File(inFolderString);
		File outFolder = new File(outFolderString);
		File missingListFile = new File(missingListFileString);
		
		outFolder.mkdirs();
		
		Converter converter = new Converter();
		
		try {
			
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(missingListFile), Charset.forName("UTF-8")));
			
			System.out.println("Reading already processed items...");
			String line = null;
			Set<String> processed = new HashSet<String>();
			while((line = bufferedReader.readLine()) != null) {
				String content = line.trim();
				processed.add(content);
			}
			bufferedReader.close();
			
			System.out.println("Creating the full map of XMLs available from the input data source.");
			Map<String, String> xmlMap = new ConcurrentHashMap<String, String>();
			
			int[] counter = new int[]{0};
			if(inFolder.exists() && inFolder.isDirectory() && !inFolder.isHidden()){
				File[] subFolders = inFolder.listFiles(f -> f.isDirectory() && !f.isHidden());
				for(File subFolder : subFolders) {
					File[] xmls = subFolder.listFiles(f -> f.isFile() && !f.isHidden() && f.getName().endsWith(".xml"));
					
					Lists.newArrayList(xmls).parallelStream()
						.forEach(xml -> {
							counter[0] = counter[0]+1;
							String recordID = xml.getName().replaceAll("\\.xml$", "");
							if(!processed.contains(recordID))
								xmlMap.put(recordID, subFolder.getName());
						});

				}
				
			}
			
			Set<String> keys = xmlMap.keySet();
			
			System.out.println("The full data source contains " + counter[0] + " items.");
			System.out.println("The list of missing XML contains " + keys.size() + " items.");
			
			for(String key : keys) {
				String subFolderName = xmlMap.get(key);
				
				File subFolder = new File(inFolder, subFolderName);
				File xmlFile = new File(subFolder, key + ".xml");
				InputStream is = new FileInputStream(xmlFile);
				Model model = converter.convert(key,"https://w3id.org/arco/resource/","http://www.catalogo.beniculturali.it/sigecSSU_FE/dettaglioScheda.action?keycode=", is);
				
				File ret = new File(outFolder, key + ".nt");
				OutputStream modelOut = new FileOutputStream(ret);
				model.write(modelOut, "N-TRIPLES");
				modelOut.close();
				
				System.out.println("Converted " + key);
			}
			
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			converter.destroy();
		}
		
		
	}
}
