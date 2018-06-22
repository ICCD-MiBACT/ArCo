package it.cnr.istc.stlab.arco;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.jena.query.Dataset;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.tdb.TDBFactory;
import org.apache.jena.tdb.base.file.Location;

public class TDBMerger {

	
	public static void main(String[] args) {
		String inFolderString = args[0];
		String outFileString = args[1];
		File inFolder = new File(inFolderString);
		
		Location location = Location.create(outFileString);
		Dataset dataset = TDBFactory.createDataset(location);
		
		Model model = dataset.getDefaultModel();
		
		if(inFolder.exists() && inFolder.isDirectory() && !inFolder.isHidden()){
			File[] subFolders = inFolder.listFiles(f -> f.isDirectory() && !f.isHidden());
			
			for(File subFolder : subFolders){
				String subFolderName = subFolder.getName();
				
				File[] ttls = subFolder.listFiles(f -> f.isFile() && !f.isHidden() && f.getName().endsWith(".ttl"));
				
				
				
				List<File> ttlList = new ArrayList<File>();
				for(File ttl : ttls){
					ttlList.add(ttl);
				}
				
				
				ttlList.forEach(ttl -> {
					
					System.out.println(ttl.getName());
					Model modelTmp = ModelFactory.createDefaultModel();
					
					InputStream inputStream;
					try {
						inputStream = new FileInputStream(ttl);
						modelTmp.read(inputStream, null, "TURTLE");
						inputStream.close();
						
						model.add(modelTmp);
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("Error " + ttl.getAbsolutePath());
					}
					
					
				});	
			}
			
			dataset.close();
		}
		
		
	}
}
