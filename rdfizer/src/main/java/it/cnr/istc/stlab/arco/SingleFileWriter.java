package it.cnr.istc.stlab.arco;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;

import org.apache.jena.query.Dataset;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.tdb.TDBFactory;
import org.apache.jena.tdb.base.file.Location;

public class SingleFileWriter {

	
	public static void main(String[] args) {
		String inFolderString = args[0];
		String outFileString = args[1];
		File outFile = new File(outFileString);
		
		Location location = Location.create(inFolderString);
		Dataset dataset = TDBFactory.createDataset(location);
		
		OutputStream outputStream;
		try {
			outputStream = new FileOutputStream(outFile);
			Model model = dataset.getDefaultModel();
			
			model.write(outputStream, "N-TRIPLES");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		dataset.close();
		
		
	}
}
