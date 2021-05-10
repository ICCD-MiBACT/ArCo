package it.cnr.istc.stlab.arco.preprocessing;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPInputStream;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.mapdb.DB;
import org.mapdb.DBMaker;
import org.mapdb.Serializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PreprocessedData {

	public static final String dbFileName = "db", dbURL = "http://arco.istc.cnr.it/preprocessing/db.gz",
			generatedURLString = "http://arco.istc.cnr.it/preprocessing/generated";

	private DB db;
	private static PreprocessedData instance;
	private Map<String, String> ftan2URL, catalogueRecordIdentifier2URI, contenitoreFisicoSystemRecordCode2CCF,
			contenitoreGiuridicoSystemRecordCode2CCG, codiceEnteToNomeEnte;
	private Map<String, List<String>> uniqueIdentifier2URIs;
	private static final Logger logger = LoggerFactory.getLogger(PreprocessedData.class);
	public static final String GENERATED = "GENERATED";

	private PreprocessedData(boolean download, String dbFileName, boolean forceCreate) {

		if (download) {
			logger.info("Download " + dbURL);
			if (!new File(dbFileName).exists()) {
				logger.info("Downloading preprocessed data from " + dbURL);
				try {
					FileUtils.copyURLToFile(new URL(dbURL), new File(dbFileName + ".gz"));
					logger.info(dbURL + " downloaded!");
					logger.info("Unzipping " + dbFileName + ".gz");
					IOUtils.copy(new GZIPInputStream(new FileInputStream(new File(dbFileName + ".gz"))),
							new FileOutputStream(new File(dbFileName)));
					logger.info(dbFileName + ".gz unzipped");
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
					if (download) {
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
//		logger.trace("FTAN2URL {}", ftan2URL.size());
		
		this.catalogueRecordIdentifier2URI = db.hashMap("catalogueRecordIdentifier2URI")
				.keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA).createOrOpen();
//		logger.trace("catalogueRecordIdentifier2URI {}", catalogueRecordIdentifier2URI.size());
		
		this.uniqueIdentifier2URIs = db.hashMap("uniqueIdentifier2URIs").keySerializer(Serializer.STRING)
				.valueSerializer(Serializer.JAVA).createOrOpen();
//		logger.trace("uniqueIdentifier2URIs {}", uniqueIdentifier2URIs.size());
		
		this.contenitoreFisicoSystemRecordCode2CCF = db.hashMap("contenitoreFisicoSystemRecordCode2CCF")
				.keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA).createOrOpen();
//		logger.trace("contenitoreFisicoSystemRecordCode2CCF {}", contenitoreFisicoSystemRecordCode2CCF.size());
		
		this.contenitoreGiuridicoSystemRecordCode2CCG = db.hashMap("contenitoreGiuridicoSystemRecordCode2CCG")
				.keySerializer(Serializer.STRING).valueSerializer(Serializer.JAVA).createOrOpen();
//		logger.trace("contenitoreGiuridicoSystemRecordCode2CCG {}", contenitoreGiuridicoSystemRecordCode2CCG.size());
		
		this.codiceEnteToNomeEnte = db.hashMap("codiceEnteToNomeEnte").keySerializer(Serializer.STRING)
				.valueSerializer(Serializer.JAVA).createOrOpen();
//		logger.trace("codiceEnteToNomeEnte {}", codiceEnteToNomeEnte.size());

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

	public Map<String, String> getCodiceEnteToNomeEnte() {
		return codiceEnteToNomeEnte;
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

	public Long getGenerated() {
		return db.atomicLong(GENERATED).open().get();

	}

}
