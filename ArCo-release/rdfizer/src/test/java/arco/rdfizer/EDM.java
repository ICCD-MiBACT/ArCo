package arco.rdfizer;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.ResourceFactory;
import org.apache.jena.vocabulary.RDFS;

import com.opencsv.CSVParser;
import com.opencsv.CSVParserBuilder;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

public class EDM {
	public static void main(String[] args) {
		InputStreamReader isr;
		try {
			isr = new InputStreamReader(new FileInputStream(new File("edm-it.txt")), "UTF-16");
			CSVParser parser = new CSVParserBuilder().withSeparator('\t').build();
			CSVReader reader = new CSVReaderBuilder(isr).withCSVParser(parser).build();
			
			Model model = ModelFactory.createDefaultModel();
			reader.forEach(row -> {
				String uri = row[0];
				String itLabel = row[2];
				if(uri.startsWith("http://")) {
					model.add(ResourceFactory.createResource(uri.trim()), RDFS.label, ResourceFactory.createLangLiteral(itLabel, "it"));
				}
			});
			
			model.write(new FileOutputStream(new File("edm-it-labels.rdf")));
		} catch (UnsupportedEncodingException | FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
