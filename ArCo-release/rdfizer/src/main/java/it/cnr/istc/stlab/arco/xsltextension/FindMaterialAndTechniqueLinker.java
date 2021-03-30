package it.cnr.istc.stlab.arco.xsltextension;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.ResIterator;
import org.apache.jena.rdf.model.StmtIterator;
import org.apache.jena.vocabulary.SKOS;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.it.ItalianAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.queryparser.classic.QueryParserBase;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;

public class FindMaterialAndTechniqueLinker extends SKOSThesaurusLinker implements ExtensionFunction {

	private final String THESAURUS = "META-INF/datasets/materia-tecnica-reperti.rdf";
	private final String KB_NAMED_MODEL = "find-material-technique";
	private final String INDEX_PATH = "indexes/find-material-technique";
	
	private static FindMaterialAndTechniqueLinker instance;
	private IndexSearcher isearcher;
	
	private FindMaterialAndTechniqueLinker(){
		super();
		Path indexPath = null;
		Directory directory = null;
		try {
			indexPath = Files.createDirectories(Paths.get(INDEX_PATH));
			directory = FSDirectory.open(indexPath);
		} catch (IOException e2) {
			indexPath = Paths.get(INDEX_PATH);
		} 
		if(!kbManager.modelExists(KB_NAMED_MODEL)) {
			Model model = ModelFactory.createDefaultModel();
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream(THESAURUS);
			model.read(inputStream, null, "RDF/XML");
			
			kbManager.addNamedModel(KB_NAMED_MODEL, model);
			
			Analyzer analyzer = new ItalianAnalyzer();
			
		    try {
			    IndexWriterConfig config = new IndexWriterConfig(analyzer);
			    IndexWriter iwriter = new IndexWriter(directory, config);
				
				ResIterator resIterator = model.listSubjects();
				resIterator.forEachRemaining(res -> {
					Document doc = new Document();
					doc.add(new Field("id", res.getURI(), TextField.TYPE_STORED));
					
					StmtIterator stmtIterator = res.listProperties(SKOS.prefLabel);
					stmtIterator.forEachRemaining(stmt -> {
						String label = stmt.getObject().asLiteral().getLexicalForm();
						doc.add(new Field("label", label, TextField.TYPE_STORED));
					});
					
					stmtIterator = res.listProperties(SKOS.altLabel);
					stmtIterator.forEachRemaining(stmt -> {
						String label = stmt.getObject().asLiteral().getLexicalForm();
						doc.add(new Field("label", label, TextField.TYPE_STORED));
					});
					try {
						iwriter.addDocument(doc);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				});
				iwriter.close();
				
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}		
		DirectoryReader ireader;
		try {
			if(directory == null) directory = FSDirectory.open(indexPath);
			ireader = DirectoryReader.open(directory);
			isearcher = new IndexSearcher(ireader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	
	public static FindMaterialAndTechniqueLinker getInstance(){
		if(instance == null){//System.out.println("FindMaterialAndTechnique getInstance");
			instance = new FindMaterialAndTechniqueLinker();
		}
		return instance;
	}

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue)arguments[0].itemAt(0)).getStringValue().trim();
		
		QueryParser parser = new QueryParser("label", new ItalianAnalyzer());
		
		String ret = "";
	    try {
			Query query = parser.parse(QueryParserBase.escape(arg)); // System.out.println(isearcher);
			ScoreDoc[] hits = isearcher.search(query, 10).scoreDocs;
			if(hits.length > 0) {
				Document hitDoc = isearcher.doc(hits[0].doc);
				ret = hitDoc.getField("id").stringValue();
			}
					    
		} catch (ParseException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	    
		return new XdmAtomicValue(ret);
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[]{
			SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE)
		};
	}

	@Override
	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "mtc2-definition");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
	}

	@Override
	protected String getNamedModel() {
		return KB_NAMED_MODEL;
	}
	
}
