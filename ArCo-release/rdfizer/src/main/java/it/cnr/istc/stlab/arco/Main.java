package it.cnr.istc.stlab.arco;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;

public class Main {

	
	public static void main(String[] args) {
		String inFolderString = args[0];
		String outFolderString = args[1];
		File inFolder = new File(inFolderString);
		File outFolder = new File(outFolderString);
		outFolder.mkdirs();
		
		Converter converter = new Converter();
		
		try {
			BufferedWriter errorLog = new BufferedWriter(new FileWriter("error.log"));
		
			if(inFolder.exists() && inFolder.isDirectory() && !inFolder.isHidden()){
				File[] subFolders = inFolder.listFiles(f -> f.isDirectory() && !f.isHidden());
				for(File subFolder : subFolders){
					String subFolderName = subFolder.getName();
					File outSubFolder = new File(outFolder, subFolderName);
					
					if(!outSubFolder.exists()){
						outSubFolder.mkdir();
						
						File[] xmls = subFolder.listFiles(f -> f.isFile() && !f.isHidden() && f.getName().endsWith(".xml"));
						
						System.out.println("XMLN " + outSubFolder +": "+ xmls.length);
						
						List<File> xmlList = new ArrayList<File>();
						for(File xml : xmls){
							xmlList.add(xml);
						}
						
						List<File> rdfFiles = xmlList.parallelStream().map(f -> {
							
							File ret = null;
							InputStream is = null;
							try {
								is = new FileInputStream(f);
							} catch (FileNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
							String itemName = f.getName().replace(".xml", "");
							if(is != null){
								try{
									
									Model model = converter.convert(itemName, is);
									
									ret = new File(outSubFolder, itemName + ".ttl");
									OutputStream modelOut = new FileOutputStream(ret);
									model.write(modelOut, "TURTLE");
									modelOut.close();
									
								} catch(Exception e){
									try {
										//System.err.println("_--- " + f.getAbsolutePath());
										errorLog.write(f.getAbsolutePath());
										errorLog.newLine();
										errorLog.flush();
									} catch (IOException e1) {
										// TODO Auto-generated catch block
										e1.printStackTrace();
									}
								}
								
								
							}
							
							return ret;
						}).collect(Collectors.toList());
						
						
						Model model = ModelFactory.createDefaultModel();
						rdfFiles.forEach(rdfFile -> {
							Model modelTmp = ModelFactory.createDefaultModel();
							InputStream is;
							try {
								is = new FileInputStream(rdfFile);
								modelTmp.read(is, null, "TURTLE");
								
								is.close();
								
								model.add(modelTmp);
								
								rdfFile.delete();
							} catch (Exception e) {
								//e.printStackTrace();
							}
						});
						
						OutputStream outputStream = new FileOutputStream(new File(outSubFolder, outSubFolder.getName() + ".ttl"));
						model.write(outputStream, "TURTLE");
						outputStream.close();
						
						
					}
					
				}
			}
			
			errorLog.flush();
			errorLog.close();
			
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
	}
}
