package it.cnr.istc.stlab.arco.xsltextension;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.concurrent.ConcurrentMap;

import org.mapdb.DB;
import org.mapdb.DBMaker;

import com.opencsv.CSVParser;
import com.opencsv.CSVParserBuilder;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;

public class CataloguingEntityFinder implements ExtensionFunction {
	
	private static final String ENTI_SCHEDATORI_CSV = "META-INF/datasets/enti-schedatori.tsv";
	
	private ConcurrentMap<String,String> entiSchedatori;
	private DB db;
	
	private static CataloguingEntityFinder instance;
	
	private CataloguingEntityFinder() {
		db = DBMaker
    	        .fileDB("enti_schedatori.db")
    	        .fileMmapEnable()
    	        .make();
    	entiSchedatori = db
    	        .hashMap("map", org.mapdb.Serializer.STRING, org.mapdb.Serializer.STRING)
    	        .createOrOpen();
    	if(entiSchedatori.isEmpty()){
    		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(ENTI_SCHEDATORI_CSV);
    		Reader r;
			try {
				r = new InputStreamReader(inputStream, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				r = null;
			}
			if(r != null){
	    		CSVParser parser = new CSVParserBuilder().withSeparator('\t').build();
	    		CSVReader reader = new CSVReaderBuilder(r).withCSVParser(parser).build();
	    		
	    		String[] row = null; 
	    		try {
					while((row = reader.readNext()) != null){
						String label = row[1];
						String id = row[2];
						entiSchedatori.put(id, label);
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
    	}
	}
	
	public static CataloguingEntityFinder create(){
		if(instance == null)
			instance = new CataloguingEntityFinder();
		return instance;
	}
	
	@Override
	public QName getName()
    {
        return new QName("http://w3id.org/arco/saxon-extension", "cataloguing-entity");
    }
    
	@Override
    public SequenceType getResultType()
    {
        return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
    }
    
	@Override
    public net.sf.saxon.s9api.SequenceType[] getArgumentTypes()
    {
        return new SequenceType[]
            {
                SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE)
            };
    }

	@Override
    public XdmValue call(XdmValue[] arguments) throws SaxonApiException
    {
        String arg = ((XdmAtomicValue)arguments[0].itemAt(0)).getStringValue();
        String argTmp = entiSchedatori.get(arg);
        if(argTmp != null && !argTmp.isEmpty()) arg = argTmp;
        return new XdmAtomicValue(arg);
    }
	
	public void destroy(){
		db.close();
	}

}
