package it.cnr.istc.stlab.arco.preprocessing;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.mapdb.DB;
import org.mapdb.DBMaker;
import org.mapdb.Serializer;

public class PreprocessedData {

	public static final String dbFileName = "db", dbURL = "http://arco.istc.cnr.it/preprocessing/db",
			generatedURLString = "http://arco.istc.cnr.it/preprocessing/generated";

	private DB db;
	private static PreprocessedData instance;
	private Map<String, String> ftan2URL, catalogueRecordIdentifier2URI, contenitoreFisicoSystemRecordCode2CCF,
			contenitoreGiuridicoSystemRecordCode2CCG;
	private Map<String, List<String>> uniqueIdentifier2URIs;
	private static final Logger logger = Logger.getLogger(PreprocessedData.class);
	public static final String GENERATED = "GENERATED";

	private PreprocessedData(boolean download, String dbFileName, boolean forceCreate) {

		if (download) {
			if (!new File(dbFileName).exists()) {
				logger.info("Downloading preprocessed data from " + dbURL);
				try {
					FileUtils.copyURLToFile(new URL(dbURL), new File(dbFileName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				logger.info(dbURL + " downloaded!");
			} else {
				logger.info("Preprocessed data already exists! ");
			}
		} else {
			if (!new File(dbFileName).exists()) {
				logger.info("Preprocessed data does not exist! Creating Empty DB, dbname " + dbFileName);
			}
		}

		this.db = DBMaker.fileDB(dbFileName).make();
		initMaps();

		if (!forceCreate) {
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
					initMaps();
				}
			} catch (IOException e) {
				logger.info("Remote generated does not exist!");
			}
		}

	}

	@SuppressWarnings("unchecked")
	private void initMaps() {
		this.ftan2URL = db.hashMap("ftan2URL").keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA)
				.createOrOpen();
		this.catalogueRecordIdentifier2URI = db.hashMap("catalogueRecordIdentifier2URI")
				.keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA).createOrOpen();
		this.uniqueIdentifier2URIs = db.hashMap("uniqueIdentifier2URIs").keySerializer(Serializer.STRING)
				.valueSerializer(Serializer.JAVA).createOrOpen();
		this.contenitoreFisicoSystemRecordCode2CCF = db.hashMap("contenitoreFisicoSystemRecordCode2CCF")
				.keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA).createOrOpen();
		this.contenitoreGiuridicoSystemRecordCode2CCG = db.hashMap("contenitoreGiuridicoSystemRecordCode2CCG")
				.keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA).createOrOpen();

	}

	private Long readRemoteGenerated() throws IOException {
		String read = IOUtils.toString(new URL(generatedURLString), Charset.forName("UTF-8")).trim();
		logger.trace(read);
		return Long.parseLong(read);
	}

	public static PreprocessedData getInstance() {
		return getInstance(false, dbFileName, false);
	}

	public static PreprocessedData getInstance(boolean download) {
		return getInstance(download, dbFileName, false);
	}

	public static PreprocessedData getInstance(boolean download, String dbfilename, boolean forceCreate) {
		if (instance == null) {
			instance = new PreprocessedData(download, dbfilename, forceCreate);
		}
		return instance;
	}

	public Map<String, String> getFtan2URL() {
		return ftan2URL;
	}

	public Map<String, String> getCatalogueRecordIdentifier2URI() {
		return catalogueRecordIdentifier2URI;
	}

	public Map<String, String> getContenitoreFisicoSystemRecordCode2CCF() {
		return contenitoreFisicoSystemRecordCode2CCF;
	}

	public Map<String, String> getContenitoreGiuridicoSystemRecordCode2CCG() {
		return contenitoreGiuridicoSystemRecordCode2CCG;
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
