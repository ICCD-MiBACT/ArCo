package it.cnr.istc.stlab.arco.preprocessing;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.mapdb.DB;
import org.mapdb.DBMaker;
import org.mapdb.Serializer;

public class PreprocessedData {

	public static String dbFileName = "db", dbURL = "http://arco.istc.cnr.it/preprocessing/db";

	private DB db;
	private static PreprocessedData instance;
	private Map<String, String> uniqueIdentifier2URI, ftan2URL, catalogueRecordIdentifier2URI;
	private static final Logger logger = Logger.getLogger(PreprocessedData.class);

	@SuppressWarnings("unchecked")
	private PreprocessedData() {

		if (!new File(dbFileName).exists()) {
			try {
				logger.info("Downloading preprocessed data from " + dbURL);
				FileUtils.copyURLToFile(new URL(dbURL), new File(dbFileName));

				logger.info(dbURL + " downloaded!");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		this.db = DBMaker.fileDB(dbFileName).make();

		this.uniqueIdentifier2URI = db.hashMap("uniqueIdentifier2URI").keySerializer(Serializer.STRING)
				.valueSerializer(Serializer.JAVA).createOrOpen();
		this.ftan2URL = db.hashMap("ftan2URL").keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA)
				.createOrOpen();
		this.catalogueRecordIdentifier2URI = db.hashMap("catalogueRecordIdentifier2URI")
				.keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA).createOrOpen();
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

	public Map<String, String> getCatalogueRecordIdentifier2URI() {
		return catalogueRecordIdentifier2URI;
	}

	public void commit() {
		db.commit();
	}

	public void close() {
		db.close();
	}

}
