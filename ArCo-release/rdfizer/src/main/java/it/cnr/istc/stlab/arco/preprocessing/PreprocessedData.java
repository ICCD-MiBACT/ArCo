package it.cnr.istc.stlab.arco.preprocessing;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.mapdb.DB;
import org.mapdb.DBMaker;
import org.mapdb.Serializer;

public class PreprocessedData {

	public static String dbFileName = "db", dbURL = "http://arco.istc.cnr.it/preprocessing/db",
			generatedURLString = "http://arco.istc.cnr.it/preprocessing/generated";

	private DB db;
	private static PreprocessedData instance;
	private Map<String, String> ftan2URL, catalogueRecordIdentifier2URI;
	private Map<String, List<String>> uniqueIdentifier2URIs;
	private static final Logger logger = Logger.getLogger(PreprocessedData.class);
	public static final String GENERATED = "GENERATED";

	@SuppressWarnings("unchecked")
	private PreprocessedData(boolean download) {

		if (download && !new File(dbFileName).exists()) {
			try {
				logger.info("Downloading preprocessed data from " + dbURL);
				FileUtils.copyURLToFile(new URL(dbURL), new File(dbFileName));
				logger.info(dbURL + " downloaded!");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			logger.info("Preprocessed data already exists! ");
		}
		this.db = DBMaker.fileDB(dbFileName).make();
		this.ftan2URL = db.hashMap("ftan2URL").keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA)
				.createOrOpen();
		this.catalogueRecordIdentifier2URI = db.hashMap("catalogueRecordIdentifier2URI")
				.keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA).createOrOpen();
		this.uniqueIdentifier2URIs = db.hashMap("uniqueIdentifier2URIs").keySerializer(Serializer.STRING)
				.valueSerializer(Serializer.JAVA).createOrOpen();

		try {
			org.mapdb.Atomic.Long generated = db.atomicLong(GENERATED).createOrOpen();
			Long remoteGenerated = readRemoteGenerated();
			logger.info("The timestamp of the remote db is " + remoteGenerated);
			logger.info("The timestamp of the local db is " + generated);
			if (remoteGenerated > generated.longValue()) {
				logger.info("Updating the DB");
				this.db.commit();
				this.db.close();
				new File(dbFileName).delete();
				logger.info("Downloading preprocessed data from " + dbURL);
				FileUtils.copyURLToFile(new URL(dbURL), new File(dbFileName));
				logger.info(dbURL + " downloaded!");
				this.db = DBMaker.fileDB(dbFileName).make();
				this.ftan2URL = db.hashMap("ftan2URL").keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA)
						.createOrOpen();
				this.catalogueRecordIdentifier2URI = db.hashMap("catalogueRecordIdentifier2URI")
						.keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA).createOrOpen();
				this.uniqueIdentifier2URIs = db.hashMap("uniqueIdentifier2URIs").keySerializer(Serializer.STRING)
						.valueSerializer(Serializer.JAVA).createOrOpen();
			}
		} catch (IOException e) {
			logger.info("Remote generated does not exist!");
		}

	}

	private Long readRemoteGenerated() throws IOException {
		URL generatedURL = new URL(generatedURLString);
		BufferedReader in = new BufferedReader(new InputStreamReader(generatedURL.openStream()));

		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = in.readLine()) != null) {
			sb.append(line);
		}
		in.close();
		return Long.parseLong(sb.toString());
	}

	public static PreprocessedData getInstance(boolean download) {
		if (instance == null) {
			instance = new PreprocessedData(download);
		}
		return instance;
	}

	public Map<String, String> getFtan2URL() {
		return ftan2URL;
	}

	public Map<String, String> getCatalogueRecordIdentifier2URI() {
		return catalogueRecordIdentifier2URI;
	}

	public void commit() {
		Long generated = System.currentTimeMillis();
		org.mapdb.Atomic.Long generatedDB = db.atomicLong(GENERATED, generated).createOrOpen();
		generatedDB.set(generated);
		try {
			FileOutputStream fos = new FileOutputStream(new File("generated"));
			fos.write((generated + "\n").getBytes());
			fos.flush();
			fos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		db.commit();
	}

	public void close() {
		db.close();
	}

	public Map<String, List<String>> getUniqueIdentifier2URIs() {
		return uniqueIdentifier2URIs;
	}

}
