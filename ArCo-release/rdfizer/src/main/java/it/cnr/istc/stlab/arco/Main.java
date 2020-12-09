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
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import org.apache.jena.rdf.model.Model;

public class Main {

	public static void main(String[] args) {
		String inFolderString = args[0];
		String outNtriplesFolder = args[1];
		String prefix = args[2];
		String sourceprefix = args[3];
		String quarantineList = args[4];

		File inFolder = new File(inFolderString);

		Set<String> catalogueRecordsToQuarantine = new HashSet<>();

		if (args.length > 4) {
			// A file listing the catalogue records to quarantine is provided
			try {
				BufferedReader br = new BufferedReader(new FileReader(new File(quarantineList)));
				String line;
				while ((line = br.readLine()) != null) {
					System.out.println(line + " goes to quarantine.");
					catalogueRecordsToQuarantine.add(line);
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
