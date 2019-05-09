package arco.rdfizer;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;

import org.apache.jena.query.ParameterizedSparqlString;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.RDFNode;
import org.apache.jena.vocabulary.OWL2;

public class Linking {

	
	public static void main(String[] args) {
		
		/* 
		 * Zeri e LODE = "http://data.fondazionezeri.unibo.it/sparql?"
		 * EDM = "http://sparql.europeana.eu"
		 * DBpedia = "http://dbpedia.org/sparql"
		*/
		
		String endpoint = "http://dbpedia.org/sparql";
		
		String filename = "/Users/andrea/Documents/CNR/ArCo/linking/dbpedia/dbpedia-luoghi.nt";
		String out = "/Users/andrea/Documents/CNR/ArCo/linking/dbpedia/sameas-autori.nt";
		
		
		String sparql = "PREFIX owl: <" + OWL2.NS + "> "
				+ "SELECT DISTINCT ?sameas "
				+ "WHERE {"
				+ " ?x owl:sameAs ?sameas "
				+ "}";
		
		Model model = ModelFactory.createDefaultModel();
		try {
			model.read(new FileInputStream(new File(filename)), null, "N-TRIPLE");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(!model.isEmpty()) {
			try {
				
				Model outModel = ModelFactory.createDefaultModel();
				model.listStatements()
					.toList()
					.stream()
					.distinct()
					.forEach(stmt -> {
						
						String objUri = stmt.getObject().asResource().getURI();
						
						ParameterizedSparqlString pss = new ParameterizedSparqlString(sparql);
						pss.setIri("x", objUri);
						System.out.println(pss.toString());
						Query query = pss.asQuery();
						QueryExecution queryExecution = QueryExecutionFactory.createServiceRequest(endpoint, query);
						ResultSet resultSet = queryExecution.execSelect();
						while(resultSet.hasNext()) {
							QuerySolution querySolution = resultSet.next();
							RDFNode sameas = querySolution.get("sameas");
							if(sameas.isURIResource())
								outModel.add(stmt.getSubject(), OWL2.sameAs, sameas);
						}
					});
				
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(out)), Charset.forName("UTF-8")));
				outModel.write(bw, "N-TRIPLE");
				bw.flush();
				bw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
	}
}
