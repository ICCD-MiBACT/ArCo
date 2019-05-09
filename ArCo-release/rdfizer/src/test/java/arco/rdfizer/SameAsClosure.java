package arco.rdfizer;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.jena.query.Syntax;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.rdf.model.Statement;
import org.apache.jena.rdf.model.StmtIterator;
import org.apache.jena.update.UpdateExecutionFactory;
import org.apache.jena.update.UpdateFactory;
import org.apache.jena.update.UpdateProcessor;
import org.apache.jena.update.UpdateRequest;

public class SameAsClosure {

	public static void main(String[] args) {
		try {
			Model model = ModelFactory.createDefaultModel();
			model.read(new FileInputStream(new File("/Users/andrea/Documents/CNR/ArCo/linking/cleaning/cleaning-authors.nt")), null, "N-TRIPLES");
			
			StmtIterator stmtIt = model.listStatements();
			
			Map<Resource, List<Resource>> sameAsMap = new HashMap<Resource, List<Resource>>();
			while(stmtIt.hasNext()) {
				Statement stmt = stmtIt.next();
				Resource subject = stmt.getSubject();
				Resource object = stmt.getObject().asResource();
				
				if(!subject.equals(object)) {
					List<Resource> sameAsSubj = sameAsMap.get(subject);
					if(sameAsSubj == null) {
						sameAsSubj = new ArrayList<Resource>();
						sameAsMap.put(subject, sameAsSubj);
					}
					
					List<Resource> sameAsObj = sameAsMap.get(object);
					if(sameAsObj == null) {
						sameAsObj = new ArrayList<Resource>();
						sameAsMap.put(object, sameAsObj);
					}
					
					sameAsSubj.add(subject);
					sameAsSubj.add(object);
					
					sameAsObj.add(subject);
					sameAsObj.add(object);
					
				
				}
			}
			
			
			for(Resource key : sameAsMap.keySet()) {
				List<Resource> sameAses = sameAsMap.get(key);
				sameAses.sort((a,b)->{return a.getURI().compareTo(b.getURI());});
				sameAses = sameAses.stream()
					.distinct()
					.sorted((a,b)->{return a.getURI().compareTo(b.getURI());})
					.collect(Collectors.toList());
				sameAsMap.put(key, sameAses);
			}
			
			List<List<Resource>> sameAses = sameAsMap.values().stream().distinct().collect(Collectors.toList());
			
			for(List<Resource> s : sameAses) {
				
				//Dataset dataset = new VirtDataset("http://wit.istc.cnr.it/arco/virtuoso", "dba", "dba");
				//Model m = VirtModel.openDatabaseModel("https://w3id.org/arco/data", "http://wit.istc.cnr.it/arco/virtuoso", "dba", "dba");
				
				Resource key = s.get(0);

				for(int i=1, j=s.size(); i<j; i++) { 
					Resource alt = s.get(i);
					String sparql = "with <https://w3id.org/arco/data> "
						+ "DELETE { <" + alt.getURI() + "> ?p1 ?o1 .  "
						+ "?s1 ?p2 <" + alt.getURI() + ">   } "
						+ "INSERT {"
						+ "<" + key.getURI() + "> ?p1 ?o1 .  "
						+ "?s1 ?p2 <" + key.getURI() + "> "
						+ "} "
						+ "WHERE "
						+ "{ <" + alt.getURI() + "> ?p1 ?o1 .  "
						+ "?s1 ?p2 <" + alt.getURI() + ">   } ";
					System.out.println(sparql);
					System.out.println("http://wit.istc.cnr.it/arco/virtuoso/sparql?query=" + URLEncoder.encode(sparql, "UTF-8"));
					URLConnection connection = new URL("http://wit.istc.cnr.it/arco/virtuoso/sparql?query=" + URLEncoder.encode(sparql, "UTF-8")).openConnection();
					
					connection.getInputStream();
					
					
					//UpdateProcessor processor = UpdateExecutionFactory.create(updateRequest, "	");
					//processor.execute();
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
