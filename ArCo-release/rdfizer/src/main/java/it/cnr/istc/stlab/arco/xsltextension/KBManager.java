package it.cnr.istc.stlab.arco.xsltextension;

import org.apache.jena.query.Dataset;
import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.ResultSet;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.tdb.TDBFactory;

public class KBManager {

	private static KBManager singleton;
	private Dataset dataset;
	
	private KBManager() {
		
	}
	
	public void addNamedModel(String name, Model model) {
		dataset.addNamedModel(name, model);
	}
	
	public ResultSet executeSelect(Query query) {
		QueryExecution queryExecution = QueryExecutionFactory.create(query, dataset);
		return queryExecution.execSelect();
	}
	
	public ResultSet executeSelect(Query query, String modelName) {
		QueryExecution queryExecution = QueryExecutionFactory.create(query, dataset.getNamedModel(modelName));
		return queryExecution.execSelect();
	}
	
	public boolean modelExists(String name) {
		return dataset.containsNamedModel(name);
	}
	
	private void init() {
		dataset = TDBFactory.createDataset("ArCo-KB");
	}
	
	
	public static KBManager getInstance() {
		if(singleton == null) singleton = new KBManager();
		singleton.init();
		return singleton;
	}
}
