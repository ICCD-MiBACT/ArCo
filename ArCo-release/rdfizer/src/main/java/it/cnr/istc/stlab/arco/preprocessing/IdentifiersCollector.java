package it.cnr.istc.stlab.arco.preprocessing;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;

import org.apache.jena.graph.Node;
import org.apache.jena.graph.NodeFactory;
import org.apache.jena.graph.Triple;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.riot.RDFFormat;
import org.apache.jena.riot.system.StreamRDF;
import org.apache.jena.riot.system.StreamRDFWriter;

import it.cnr.istc.stlab.lgu.commons.semanticweb.querying.QueryExecutionRetrieverWithLimitAndOffset;

public class IdentifiersCollector {

	/**
	 * Quick and dirty solution to update identifiers.ttl dataset
	 * 
	 * @param args
	 * @throws FileNotFoundException
	 */
	public static void main(String[] args) throws FileNotFoundException {
		QueryExecutionRetrieverWithLimitAndOffset rsr = new QueryExecutionRetrieverWithLimitAndOffset(
				"SELECT *  { ?cp	<https://w3id.org/arco/ontology/arco/uniqueIdentifier> ?id } ",
				"http://arco.istc.cnr.it/arco-pr/virtuoso/sparql", 10000);

		QueryExecution qexec;
		OutputStream os = new FileOutputStream(new File("/Users/lgu/Desktop/identifiers.ttl"));
		StreamRDF stream = StreamRDFWriter.getWriterStream(os, RDFFormat.TURTLE_FLAT);
		Node p = NodeFactory.createURI("https://w3id.org/arco/core/uniqueIdentifier");
		stream.prefix("core", "https://w3id.org/arco/core/");
		stream.prefix("a-ap", "https://w3id.org/arco/resource/ArchaeologicalProperty/");
		stream.prefix("a-deah", "https://w3id.org/arco/resource/DemoEthnoAnthropologicalHeritage/");
		stream.prefix("a-ph", "https://w3id.org/arco/resource/PhotographicHeritage/");
		stream.prefix("a-mh", "https://w3id.org/arco/resource/MusicHeritage/");
		stream.prefix("a-nh", "https://w3id.org/arco/resource/NaturalHeritage/");
		stream.prefix("a-np", "https://w3id.org/arco/resource/NumismaticProperty/");
		stream.prefix("a-sth", "https://w3id.org/arco/resource/ScientificOrTechnologicalHeritage/");
		stream.prefix("a-hap", "https://w3id.org/arco/resource/HistoricOrArtisticProperty/");
		stream.prefix("a-alh", "https://w3id.org/arco/resource/ArchitecturalOrLandscapeHeritage/");
		
		
		stream.start();
		boolean stop = false;
		while (!stop) {
			qexec = rsr.next();
			ResultSet rs = qexec.execSelect();
			if (!rs.hasNext()) {
				stop = true;
			}
			while (rs.hasNext()) {
				QuerySolution qs = rs.next();
				stream.triple(Triple.create(NodeFactory.createURI(qs.getResource("cp").getURI()), p,
						NodeFactory.createLiteral(qs.getLiteral("id").getString())));
			}
			qexec.close();
		}

		stream.finish();
	}

}
