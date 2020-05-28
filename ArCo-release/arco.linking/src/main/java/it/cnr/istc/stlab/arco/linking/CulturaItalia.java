package it.cnr.istc.stlab.arco.linking;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import org.apache.commons.configuration2.Configuration;
import org.apache.commons.configuration2.ConfigurationUtils;
import org.apache.commons.configuration2.builder.fluent.Configurations;
import org.apache.commons.configuration2.ex.ConfigurationException;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.vocabulary.OWL;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import it.cnr.istc.stlab.lgu.commons.semanticweb.querying.ResultSetRetrieverWithLimitAndOffset;
import tech.tablesaw.api.StringColumn;
import tech.tablesaw.api.Table;

public class CulturaItalia {

	private static Logger logger = LogManager.getLogger(CulturaItalia.class);

	//@f:off
	private static final String queryString = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n" + 
			"SELECT DISTINCT ?cp ?s ?l WHERE {\n" + 
			"  ?s rdfs:label ?l .\n" + 
			"  ?s a <http://erlangen-crm.org/current/E31_Document> .\n" +
			"  ?cp <http://erlangen-crm.org/current/P67i_is_referred_to_by> ?s ." + 
			"  FILTER (strStarts(str(?s), \"http://dati.culturaitalia.it/resource/thing/scheda-iccd-\"))\n" + 
			"} \n";
	//@f:on

	//@f:off
	private static final String queryStringArCo = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n" + 
			"SELECT DISTINCT ?cp ?cr ?ui ?ri WHERE {\n" + 
			"  ?cp <https://w3id.org/arco/ontology/catalogue/isDescribedByCatalogueRecord> ?cr . \n" +
			"  ?cp <https://w3id.org/arco/ontology/arco/uniqueIdentifier> ?ui . "+
			"  ?cp <https://w3id.org/arco/ontology/arco/regionIdentifier> ?ri . "+
			"}";
	//@f:on

	public static void main(String[] args) {
		try {
			Configurations configs = new Configurations();

			String configFile = "config.properties";
			if (args.length > 0) {
				configFile = args[0];
			}

			Configuration config = configs.properties(configFile);
			logger.info(ConfigurationUtils.toString(config));

			String culturaItaliaSparqlEndpoint = config.getString("culturaItaliaSparqlEndpoint");
			int culturaItaliaLimit = config.getInt("culturaItaliaLimit");

			String arcoSparqlEndpoint = config.getString("arcoSparqlEndpoint");
			int arcoLimit = config.getInt("arcoLimit");

			String output = config.getString("output");

			Table culturaItaliaTable = Table.create("culturaItaliaTable", StringColumn.create("cpCI"),
					StringColumn.create("crCI"), StringColumn.create("uiCI"));

			ResultSetRetrieverWithLimitAndOffset retriever = new ResultSetRetrieverWithLimitAndOffset(queryString,
					culturaItaliaSparqlEndpoint, culturaItaliaLimit);
			ResultSet rs;

			while ((rs = retriever.next()).hasNext()) {
				while (rs.hasNext()) {
					QuerySolution qs = rs.next();
					String label = qs.get("l").asLiteral().getValue().toString();
					Resource cp = qs.get("cp").asResource();

					String[] labelParts = label.split(":");
					String id = labelParts[1];
					if (id.contains("-")) {
						String regionId = id.substring(0, id.indexOf('-')).trim();
						String recordId = id.substring(id.indexOf('-') + 1).trim();
						culturaItaliaTable.column("cpCI").appendCell(cp.getURI());
						culturaItaliaTable.column("crCI").appendCell(qs.getResource("s").getURI());
						culturaItaliaTable.column("uiCI").appendCell((regionId + recordId));
					}
				}
			}

			Table arcoTable = Table.create("arcoTable", StringColumn.create("cp"), StringColumn.create("cr"),
					StringColumn.create("ui"));

			ResultSetRetrieverWithLimitAndOffset retrieverArco = new ResultSetRetrieverWithLimitAndOffset(
					queryStringArCo, arcoSparqlEndpoint, arcoLimit);

			while ((rs = retrieverArco.next()).hasNext()) {
				while (rs.hasNext()) {
					QuerySolution qs = rs.next();

					String ui = qs.get("ui").asLiteral().getValue().toString();
					Resource cp = qs.get("cp").asResource();
					Resource cr = qs.get("cr").asResource();

					arcoTable.column("cp").appendCell(cp.getURI());
					arcoTable.column("cr").appendCell(cr.getURI());
					arcoTable.column("ui").appendCell(ui);

				}
			}
			Model result = ModelFactory.createDefaultModel();

			logger.info("Joining");

			arcoTable.joinOn("ui").inner(culturaItaliaTable, "uiCI").forEach(row -> {
				result.add(result.createResource(row.getString("cp")), OWL.sameAs,
						result.createResource(row.getString("cpCI")));
				result.add(result.createResource(row.getString("cr")), OWL.sameAs,
						result.createResource(row.getString("crCI")));
			});

			result.write(new FileOutputStream(new File(output)), "NT");

			logger.info("End");

		} catch (ConfigurationException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
