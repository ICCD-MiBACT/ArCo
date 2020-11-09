package it.cnr.istc.stlab.arco;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Option.Builder;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.riot.RDFDataMgr;

public class XsltSingleTester {

	private static final String EXPECTED_RESULT = "e";
	private static final String EXPECTED_RESULT_LONG = "expected";

	private static final String PREFIX = "prefix";
	private static final String PREFIX_LONG = "prefix";

	public static void main(String[] args) throws FileNotFoundException {
		Converter converter = new Converter();

		try {
			/*
			 * Set-up the options for the command line parser.
			 */
			Options options = new Options();

			Builder optionBuilder = Option.builder(EXPECTED_RESULT);
			Option outputFileOption = optionBuilder.argName("file").hasArg().required(true)
					.desc("An RDF file containing the result expected from the transformation of the input file.")
					.longOpt(EXPECTED_RESULT_LONG).build();

			Option prefixOption = Option.builder(PREFIX).argName("string").hasArg().required(false)
					.desc("OPTIONAL - Prefix for generated resources [default: https://w3id.org/arco/resource/].")
					.longOpt(PREFIX_LONG).build();

			options.addOption(outputFileOption);
			options.addOption(prefixOption);
			
			CommandLine commandLine = null;

			CommandLineParser cmdLineParser = new DefaultParser();
			try {
				commandLine = cmdLineParser.parse(options, args);
			} catch (ParseException e) {
				HelpFormatter formatter = new HelpFormatter();
				formatter.printHelp("process", options);
			}

			if (commandLine != null) {

				String[] arguments = commandLine.getArgs();
				if (arguments != null && arguments.length > 0) {
					File xmlIn = new File(arguments[0]);
					if (xmlIn.exists()) {
						if (xmlIn.isFile()) {
							if (xmlIn.getName().endsWith(".xml")) {
								String fileNameInXML = xmlIn.getName().replace(".xml", "");
								InputStream inputStream = new FileInputStream(xmlIn);

								String expectedResultFile = commandLine.getOptionValue(EXPECTED_RESULT);
								String prefix = commandLine.getOptionValue(PREFIX,"https://w3id.org/arco/resource/");

								Model generatedModel = null;
								try {
									generatedModel = converter.convert(fileNameInXML,prefix, inputStream);
								} catch (Exception e) {
									e.printStackTrace();
								}

								Model expectedResult = ModelFactory.createDefaultModel();
								RDFDataMgr.read(expectedResult, expectedResultFile);

								if (expectedResult.isIsomorphicWith(generatedModel)) {
									System.out.println(
											String.format("PASSED %s %s", xmlIn.getName(), expectedResultFile));
								} else {
									System.out.println(
											String.format("FAILED %s %s", xmlIn.getName(), expectedResultFile));
								}

							} else {
								System.err.println(
										"The XML file provided as input is not XML: the application processes only file with .xml extension.");
							}
						} else {
							System.err.println("The XML file provided as input does not exist is not a file.");
						}
					} else {
						System.err.println("The XML file provided as input does not exist.");
					}
				} else {
					System.err.println("No XML file provided as input.");
				}
			}
		}

		finally {
			converter.destroy();
		}

	}

}
