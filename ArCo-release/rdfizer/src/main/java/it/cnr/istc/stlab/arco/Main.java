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
import java.util.zip.GZIPOutputStream;

import org.apache.jena.rdf.model.Model;

public class Main {

	
	public static void main(String[] args) {
		String inFolderString = args[0];
		String outNtriplesFile = args[1];
		File inFolder = new File(inFolderString);
		
		File outFolder = new File("ttls");
		outFolder.mkdirs();
		
		Converter converter = new Converter();
		
		try {
			BufferedWriter errorLog = new BufferedWriter(new FileWriter("error.log"));
		
			if(inFolder.exists() && inFolder.isDirectory() && !inFolder.isHidden()){
				File[] subFolders = inFolder.listFiles(f -> f.isDirectory() && !f.isHidden());
				for(File subFolder : subFolders){
					String subFolderName = subFolder.getName();
					File outSubFolder = new File(outFolder, subFolderName);
					
					//if(!outSubFolder.exists()){
					outSubFolder.mkdir();
					
					File[] xmls = subFolder.listFiles(f -> f.isFile() && !f.isHidden() && f.getName().endsWith(".xml"));
					
					System.out.println("XMLN " + outSubFolder +": "+ xmls.length);
					
					List<File> xmlList = new ArrayList<File>();
					for(File xml : xmls){
						xmlList.add(xml);
					}
					
					List<File> rdfFiles = xmlList.parallelStream().map(f -> {
						
						String itemName = f.getName().replace(".xml", "");
						
						File ret = new File(outSubFolder, itemName + ".nt.gz");
						
						if(!ret.exists()) {
						
							InputStream is = null;
							try {
								is = new FileInputStream(f);
							} catch (FileNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
							if(is != null){
								try{
									
									//System.out.println(itemName);
									Model model = converter.convert(itemName, is);
									
									OutputStream modelOut = new GZIPOutputStream(new FileOutputStream(ret));
									model.write(modelOut, "N-TRIPLES");
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
									System.err.println(itemName);
									e.printStackTrace();
								}
								
								
							}
						}
						
						return ret;
					}).collect(Collectors.toList());
					
					System.out.println("created");
					/*
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
							System.err.println(rdfFile.getName());
							e.printStackTrace();
						}
					});
					
					OutputStream outputStream = new FileOutputStream(new File(outSubFolder, outSubFolder.getName() + ".ttl"));
					model.write(outputStream, "TURTLE");
					outputStream.close();
					*/
					
					
					//}
					
				}
			}
			
			
			System.out.println("Producing the RDF dump");
			SingleFileWriterNTriples.serialize(outFolder, new File(outNtriplesFile));
			
			errorLog.flush();
			errorLog.close();
			
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		finally {
			converter.destroy();
		}
		
		
	}
}
