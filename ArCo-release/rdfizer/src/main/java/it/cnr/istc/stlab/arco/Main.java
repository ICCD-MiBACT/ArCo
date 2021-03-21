package it.cnr.istc.stlab.arco;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import org.apache.jena.rdf.model.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Main {

	private static final Logger logger = LoggerFactory.getLogger(Main.class);

	static void usage() {
		System.err.println("parameters: <inFolderString> <outNtriplesFolder> [prefix="+Converter.defaultPrefix+" [sourcePrefix="+Converter.defaultSourcePrefix+" [quarantineList=null]] -xslt:<custom stylesheet>]"); 
		System.exit(-1);
	}
	public static void main(String[] args) {
		if (args.length<2) usage();
		String xslt = null;
		String inFolderString = args[0];
		String outNtriplesFolder = args[1];
		String dp = Converter.defaultPrefix;
		String dsp = Converter.defaultSourcePrefix;
		String quarantineList = null;
		for (int j=2;j<args.length;j++) {
			if (args[j].startsWith("-xslt:")) { xslt = args[j].substring(6); continue; }
			if (j==2) { dp = args[j]; continue; }
			if (j==3) { dsp = args[j]; continue; }
			if (j==4) { quarantineList = args[j]; continue; }
			usage();
		}
		String prefix = dp;
		String sourceprefix = dsp;
		logger.trace("inFolder {}, outFolder {}, prefix {}, sourcePrefix {}", inFolderString, outNtriplesFolder, prefix, sourceprefix);

		File inFolder = new File(inFolderString);

		Set<String> catalogueRecordsToQuarantine = new HashSet<>();

		if (quarantineList!=null) {
			// A file listing the catalogue records to quarantine is provided
			try {
				BufferedReader br = new BufferedReader(new FileReader(new File(quarantineList)));
				String line;
				while ((line = br.readLine()) != null) {
					logger.info("{} goes to quarantine.", line);
					catalogueRecordsToQuarantine.add(line.trim());
				}
				br.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		File quarantineTempFolder = new File("quarantine-cards");
		quarantineTempFolder.mkdirs();
		File outFolderTTLs = new File("ttls");
		outFolderTTLs.mkdirs();

		Converter converter = new Converter();
		if (xslt!=null) converter.addXSTLConverter(Paths.get(xslt));

		try {
			BufferedWriter errorLog = new BufferedWriter(new FileWriter("error.log"));

			File folderOut = new File(outNtriplesFolder);
			folderOut.mkdirs();

			if (inFolder.exists() && inFolder.isDirectory() && !inFolder.isHidden()) {
				File[] subFolders = inFolder.listFiles(f -> f.isDirectory() && !f.isHidden());
				for (File subFolder : subFolders) {
					String subFolderName = subFolder.getName();
					File outSubFolder = new File(outFolderTTLs, subFolderName);

					// if(!outSubFolder.exists()){
					outSubFolder.mkdir();

					File[] xmls = subFolder.listFiles(f -> f.isFile() && !f.isHidden() && f.getName().endsWith(".xml"));

					System.out.println("XMLN " + outSubFolder + ": " + xmls.length);
					

					List<File> xmlList = new ArrayList<File>();
					for (File xml : xmls) {
						xmlList.add(xml);
					}

					xmlList.forEach(f -> {
						String itemName = f.getName().replace(".xml", "");
						File ret = new File(outSubFolder, itemName + ".nt.gz");
						logger.trace("Processing file {}",f.getAbsolutePath());
						if (!ret.exists()) {

							InputStream is = null;
							try {
								is = new FileInputStream(f);
							} catch (FileNotFoundException e) {
								e.printStackTrace();
							}

							if (is != null) {
								try {

									//System.out.println(itemName);
									logger.trace("Convert {}",itemName);
									Model model = converter.convert(itemName, prefix, sourceprefix, is);

									if (catalogueRecordsToQuarantine.contains(itemName)) {
										OutputStream osQuarantine = new GZIPOutputStream(new FileOutputStream(
												new File(quarantineTempFolder, itemName + ".nt.gz")));
										model.write(osQuarantine, "N-TRIPLES");
										osQuarantine.flush();
										osQuarantine.close();
									} else {
										OutputStream modelOut = new GZIPOutputStream(new FileOutputStream(ret));
										model.write(modelOut, "N-TRIPLES");
										modelOut.flush();
										modelOut.close();
									}

								} catch (Exception e) {
									try {
										// System.err.println("_--- " + f.getAbsolutePath());
										errorLog.write(f.getAbsolutePath());
										errorLog.newLine();
										errorLog.flush();
									} catch (IOException e1) {
										e1.printStackTrace();
									}
									System.err.println(itemName);
									e.printStackTrace();
								}

							}
						}else {
							logger.trace("{} already exists",f.getAbsolutePath());
						}
					});

					System.out.println("created");

				}
			}

			System.out.println("Producing the RDF dump");
			SingleFileWriterNTriples.serialize(outFolderTTLs, new File(outNtriplesFolder));

			BufferedWriter bw_quarantine = new BufferedWriter(new OutputStreamWriter(
					new GZIPOutputStream(new FileOutputStream(outNtriplesFolder + "/quarantine.nt.gz")),
					Charset.forName("UTF-8")));

			for (File f : quarantineTempFolder.listFiles()) {
				if (f.getName().endsWith(".nt.gz")) {

					BufferedReader br = new BufferedReader(new InputStreamReader(
							new GZIPInputStream(new FileInputStream(f)), Charset.forName("UTF-8")));
					String line = null;
					while ((line = br.readLine()) != null) {

						bw_quarantine.append(line);
						bw_quarantine.newLine();

					}
					br.close();
					bw_quarantine.flush();

				}

			}

			bw_quarantine.flush();
			bw_quarantine.close();

			errorLog.flush();
			errorLog.close();

		} catch (IOException e1) {
			e1.printStackTrace();
		} finally {
			converter.destroy();
		}

	}

}
