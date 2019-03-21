package arco.rdfizer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.ResourceFactory;
import org.apache.jena.vocabulary.RDFS;

import com.opencsv.CSVReader;

import it.cnr.istc.stlab.arco.Urifier;

public class KeywordExtraction {

	
	public static void main(String[] args) {
		Model model = ModelFactory.createDefaultModel();
		try {
			CSVReader reader = new CSVReader(new FileReader(new File("extracted-keywords.txt")));
			reader.forEach(row -> {
				String label = row[0];
				
				String uri = "https://w3id.org/arco/resource/Keyword/" + Urifier.toURI(label);
				model.add(ResourceFactory.createResource(uri), RDFS.label, ResourceFactory.createLangLiteral(label, "it"));
			});
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			model.write(new FileWriter("keywords.ttl"), "TURTLE");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
