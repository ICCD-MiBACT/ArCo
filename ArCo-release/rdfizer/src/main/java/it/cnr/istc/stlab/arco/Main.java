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
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.zip.GZIPOutputStream;

import org.apache.jena.rdf.model.Model;

public class Main {

	public static void main(String[] args) {
		String inFolderString = args[0];
		String outNtriplesFolder = args[1];
		String outQuarantineNT = outNtriplesFolder + "/quarantine.nt.gz";
		File inFolder = new File(inFolderString);

		Set<String> catalogueRecordsToQuarantine = new HashSet<>();

		if (args.length > 2) {
			// A file listing the catalogue records to quarantine is provided
			try {
				BufferedReader br = new BufferedReader(new FileReader(new File(args[2])));
				String line;
				while ((line = br.readLine()) != null) {
					System.out.println(line+" goes to quarantine.");
					catalogueRecordsToQuarantine.add(line);
				}
				br.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		File outFolderTTLs = new File("ttls");
		outFolderTTLs.mkdirs();

		Converter converter = new Converter();

		try {
			BufferedWriter errorLog = new BufferedWriter(new FileWriter("error.log"));

			OutputStream osQuarantine = new GZIPOutputStream(new FileOutputStream(new File(outQuarantineNT)));

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

					xmlList.parallelStream().forEach(f -> {
						String itemName = f.getName().replace(".xml", "");
						File ret = new File(outSubFolder, itemName + ".nt.gz");
						if (!ret.exists()) {

							InputStream is = null;
							try {
								is = new FileInputStream(f);
							} catch (FileNotFoundException e) {
								e.printStackTrace();
							}

							if (is != null) {
								try {

									// System.out.println(itemName);
									Model model = converter.convert(itemName, is);

									if (catalogueRecordsToQuarantine.contains(itemName)) {
										model.write(osQuarantine, "N-TRIPLES");
										osQuarantine.flush();
									} else {
										OutputStream modelOut = new GZIPOutputStream(new FileOutputStream(ret));
										model.write(modelOut, "N-TRIPLES");
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
						}
					});

					System.out.println("created");

				}
			}

			osQuarantine.flush();
			osQuarantine.close();

			System.out.println("Producing the RDF dump");
			SingleFileWriterNTriples.serialize(outFolderTTLs, new File(outNtriplesFolder));

			errorLog.flush();
			errorLog.close();

		} catch (IOException e1) {
			e1.printStackTrace();
		} finally {
			converter.destroy();
		}

	}

}
