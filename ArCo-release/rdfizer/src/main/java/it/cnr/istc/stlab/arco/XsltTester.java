package it.cnr.istc.stlab.arco;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.Iterator;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.commons.cli.Option.Builder;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.io.FilenameUtils;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.riot.RDFDataMgr;
import org.apache.jena.sparql.util.ModelUtils;
import org.eclipse.rdf4j.model.util.Models;

public class XsltTester {

	private static final String VERBOSE_FILE = "v";
	private static final String VERBOSE_FILE_LONG = "verbose";

	public static void main(String[] args) throws IOException {
		Converter converter = new Converter();

		try {
			/*
			 * Set-up the options for the command line parser.
			 */
			Options options = new Options();

			Builder optionBuilder = Option.builder(VERBOSE_FILE);
			Option outputFileOption = optionBuilder.argName("verbose").required(false)
					.desc("OPTIONAL - Print the differences between generated file and expected result, and viceversa.")
					.longOpt(VERBOSE_FILE_LONG).build();

			options.addOption(outputFileOption);

			CommandLine commandLine = null;

			CommandLineParser cmdLineParser = new DefaultParser();
			try {
				commandLine = cmdLineParser.parse(options, args);
			} catch (ParseException e) {
				HelpFormatter formatter = new HelpFormatter();
				formatter.printHelp("process", options);
			}

			boolean verbose = commandLine.hasOption(VERBOSE_FILE);

			if (commandLine != null) {
				String[] arguments = commandLine.getArgs();
				if (arguments != null && arguments.length > 0) {
					File testDescriptionFile = new File(arguments[0]);
					if (testDescriptionFile.exists() && testDescriptionFile.isFile()) {
						processTestFile(converter, testDescriptionFile, verbose);
					} else {
						System.err.println("file passato come parametro non è un file di descrizione");
					}
				} else {
					System.err.println("No TSV file provided as input.");
				}
			}
		} finally {
			converter.destroy();
		}

	}

	private static void processTestFile(Converter converter, File testDescriptionFile, boolean verbose)
			throws FileNotFoundException, IOException {
		Reader in = new FileReader(testDescriptionFile);
		int lineNumber = 0;
		Iterator<CSVRecord> records = CSVFormat.DEFAULT.withHeader("XML", "RDF").parse(in).iterator();
		while (records.hasNext()) {
			CSVRecord csvRecord = (CSVRecord) records.next();
			if (csvRecord.size() != 2) {
				System.err.println(String.format("Wrong format at line %s", lineNumber));
				continue;
			}
			File xmlIn = new File(csvRecord.get("XML").trim());
			doTest(converter, lineNumber, xmlIn, csvRecord.get("RDF"), verbose);
			lineNumber++;
		}
	}

	private static void doTest(Converter converter, int lineNumber, File xmlIn, String expectedResultFile,
			boolean verbose) throws FileNotFoundException {
		if (xmlIn.exists()) {
			if (xmlIn.isFile()) {
				if (xmlIn.getName().endsWith(".xml")) {
					String fileNameInXML = xmlIn.getName().replace(".xml", "");
					InputStream inputStream = new FileInputStream(xmlIn);

					Model generatedModel = null;
					try {
						generatedModel = converter.convert(fileNameInXML, inputStream);
					} catch (Exception e) {
						e.printStackTrace();
					}

					Model expectedResult = ModelFactory.createDefaultModel();
					RDFDataMgr.read(expectedResult, expectedResultFile);

					if (expectedResult.isIsomorphicWith(generatedModel)) {
						System.out.println(String.format("\nPASSED %s %s %s", lineNumber, xmlIn.getName(),
								FilenameUtils.getName(expectedResultFile)));
					} else {
						System.out.println(String.format("\nFAILED %s %s %s", lineNumber, xmlIn.getName(),
								FilenameUtils.getName(expectedResultFile)));

						if (verbose) {
							Model generatedMinusExpected = ModelFactory.createDefaultModel();
							generatedMinusExpected.add(generatedModel);
							generatedMinusExpected.remove(expectedResult);
							System.out.println("\nGenerated\\Exepected (to add to expected)");
							generatedMinusExpected.write(System.out, "NT");

							Model expectedMinusGenerated = ModelFactory.createDefaultModel();
							expectedMinusGenerated.add(expectedResult);
							expectedMinusGenerated.remove(generatedModel);
							System.out.println("\nExepected\\Generated (to remove from expected)");
							expectedMinusGenerated.write(System.out,"NT");
						}

					}

				} else {
					System.err.println(String.format(
							"The XML file provided at line %s is not XML: the application processes only file with .xml extension.",
							lineNumber));
				}
			} else {
				System.err.println(
						String.format("The XML file provided at line %s does not exist is not a file.", lineNumber));
			}
		} else {
			System.err.println(String.format("The XML file provided at line %s does not exist.", lineNumber));
		}
	}

}
