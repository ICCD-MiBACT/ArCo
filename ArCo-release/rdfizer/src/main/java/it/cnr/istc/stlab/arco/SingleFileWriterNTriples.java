package it.cnr.istc.stlab.arco;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

public class SingleFileWriterNTriples {

	private static final long PART_SIZE = 10 * 1000 * 1000;

	public static void serialize(File inFolder, File folderOut) {
		try {

			String baseName = folderOut.getName();

			folderOut.mkdir();

			BufferedWriter bw_whole = new BufferedWriter(new OutputStreamWriter(
					new GZIPOutputStream(new FileOutputStream(folderOut.getAbsoluteFile() + "/" + baseName + ".nt.gz")),
					Charset.forName("UTF-8")));

			File[] subFolders = inFolder.listFiles(f -> f.isDirectory() && !f.isHidden());
			int counter = 0, outFileCounter = 0;

			BufferedWriter bw_part = new BufferedWriter(new OutputStreamWriter(
					new GZIPOutputStream(new FileOutputStream(
							folderOut.getAbsoluteFile() + "/" + baseName + "_part_" + outFileCounter + ".nt.gz")),
					Charset.forName("UTF-8")));

			long lineCounter = 0;

			for (File subFolder : subFolders) {
				File[] ttls = subFolder.listFiles(file -> {
					return file.getName().endsWith(".nt.gz") ? true : false;
				});

				for (File ttl : ttls) {
					BufferedReader br = new BufferedReader(new InputStreamReader(
							new GZIPInputStream(new FileInputStream(ttl)), Charset.forName("UTF-8")));
					String line = null;
					while ((line = br.readLine()) != null) {

						lineCounter++;

						if (lineCounter % PART_SIZE == 0) {
							outFileCounter++;
							bw_part.flush();
							bw_part.close();
							bw_part = new BufferedWriter(new OutputStreamWriter(
									new GZIPOutputStream(new FileOutputStream(folderOut.getAbsoluteFile() + "/"
											+ baseName + "_part_" + outFileCounter + ".nt.gz")),
									Charset.forName("UTF-8")));
						}

						bw_whole.append(line);
						bw_whole.newLine();

						bw_part.append(line);
						bw_part.newLine();

					}
					br.close();
					bw_whole.flush();
					bw_part.flush();

					counter++;

					//System.out.println(counter);
				}

				bw_part.flush();
				bw_whole.flush();

			}

			bw_part.flush();
			bw_part.close();
			bw_whole.flush();
			bw_whole.close();

		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}

	public static void main(String[] args) {
		String inFolderString = args[0];
		String outFileString = args[1];
		File outFile = new File(outFileString);

		try {
			BufferedWriter bw = new BufferedWriter(
					new OutputStreamWriter(new FileOutputStream(outFile), Charset.forName("UTF-8")));

			File inFolder = new File(inFolderString);

			File[] subFolders = inFolder.listFiles(f -> f.isDirectory() && !f.isHidden());
			int counter = 0;
			for (File subFolder : subFolders) {
				File[] ttls = subFolder.listFiles(file -> {
					return file.getName().endsWith(".nt") ? true : false;
				});

				for (File ttl : ttls) {
					BufferedReader br = new BufferedReader(
							new InputStreamReader(new FileInputStream(ttl), Charset.forName("UTF-8")));
					String line = null;
					while ((line = br.readLine()) != null) {
						bw.append(line);
						bw.newLine();
					}
					br.close();
					bw.flush();

					counter++;

					System.out.println(counter);
				}

				bw.flush();

			}

			bw.flush();
			bw.close();

		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}
}
