package it.cnr.istc.stlab.arco.preprocessing;

import java.util.Map;

import org.mapdb.DB;
import org.mapdb.DBMaker;
import org.mapdb.Serializer;

public class PreprocessedData {

	public static String dbFileName = "db";
	private DB db;
	private static PreprocessedData instance;
	private Map<String, String> uniqueIdentifier2URI, ftan2URL,catalogueRecordIdentifier2URI;

	@SuppressWarnings("unchecked")
	private PreprocessedData() {
		this.db = DBMaker.fileDB("db").make();

		this.uniqueIdentifier2URI = db.hashMap("uniqueIdentifier2URI").keySerializer(Serializer.STRING)
				.valueSerializer(Serializer.JAVA).createOrOpen();
		this.ftan2URL = db.hashMap("ftan2URL").keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA)
				.createOrOpen();
		this.catalogueRecordIdentifier2URI = db.hashMap("catalogueRecordIdentifier2URI").keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA)
				.createOrOpen();
	}

	public static PreprocessedData getInstance() {
		if (instance == null) {
			instance = new PreprocessedData();
		}
		return instance;
	}

	public Map<String, String> getUniqueIdentifier2URI() {
		return uniqueIdentifier2URI;
	}

	public Map<String, String> getFtan2URL() {
		return ftan2URL;
	}
	
	public Map<String,String> getCatalogueRecordIdentifier2URI(){
		return catalogueRecordIdentifier2URI;
	}

	public void commit() {
		db.commit();
	}

	public void close() {
		db.close();
	}

}
