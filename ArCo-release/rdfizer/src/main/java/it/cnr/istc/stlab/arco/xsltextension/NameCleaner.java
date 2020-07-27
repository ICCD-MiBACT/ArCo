package it.cnr.istc.stlab.arco.xsltextension;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.opencsv.CSVReader;

import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmArray;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmEmptySequence;
import net.sf.saxon.s9api.XdmValue;

public class NameCleaner implements ExtensionFunction {

	private static NameCleaner instance;
	private Set<String> firstNames;
	private static final Logger logger = LogManager.getLogger(NameCleaner.class);

	private NameCleaner() {
		try {
			firstNames = new HashSet<>();
			CSVReader csvReader = new CSVReader(new FileReader(new File("firstNames.csv")));
			String[] line;
			while ((line = csvReader.readNext()) != null) {
				firstNames.add(line[0].toLowerCase());
			}
			csvReader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public static NameCleaner getInstance() {
		if (instance == null)
			instance = new NameCleaner();
		return instance;
	}

	@Override
	public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
		String arg = ((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue();

		List<String> result = new ArrayList<>();
		result.add(nameCleaner(arg));

		if (result == null || result.isEmpty())
			return XdmEmptySequence.getInstance();
		else
			return XdmArray.makeArray(result.toArray());
	}

	public String nameCleaner(String name) {
		if (name == null) {
			return "";
		}
		String[] toSwap = name.split(",");
		if (toSwap.length == 2) {
			// case surname, name
			String first = toSwap[1];
			String second = toSwap[0];
			name = first.trim() + " " + second.trim();
		}

		String[] tokens = name.split("[\\s,]");
		boolean[] firstNamesFlags = new boolean[tokens.length];
		for (int i = 0; i < tokens.length; i++) {
			if (firstNames.contains(tokens[i].toLowerCase())) {
				firstNamesFlags[i] = true;
			}
		}

		// check if the firstnames are continuous
		boolean firstNamesNotContinuous = false;
		int lastFirstName = -1;
		for (int i = 0; i < firstNamesFlags.length; i++) {
			if (firstNamesFlags[i]) {
				if (lastFirstName > 0) {
					if (i != lastFirstName + 1) {
						firstNamesNotContinuous = true;
						break;
					} else {
						lastFirstName = i;
					}
				} else {
					lastFirstName = i;
				}
			}
		}

		// check if there are fist name tokens only
		boolean firstNameTokensOnly = true;
		boolean noFirstNameTokens = true;
		for (int i = 0; i < firstNamesFlags.length; i++) {
			if (!firstNamesFlags[i]) {
				firstNameTokensOnly = false;
			} else {
				noFirstNameTokens = false;
			}
		}

		List<String> tokensOrdered = new ArrayList<>(tokens.length);
		if (firstNamesNotContinuous || firstNameTokensOnly || noFirstNameTokens) {
			for (int i = 0; i < tokens.length; i++) {
				tokensOrdered.add(tokens[i]);
			}
		} else {
			int startFistNames = -1;
			int endFistNames = -1;
			List<String> tokensList = new ArrayList<>(tokens.length);
			for (int i = 0; i < firstNamesFlags.length; i++) {

				// identify range for first names
				if (firstNamesFlags[i]) {
					if (startFistNames >= 0) {
						endFistNames = i + 1;
					} else {
						startFistNames = i;
						endFistNames = i + 1;
					}
				}

				// populate the array
				tokensList.add(tokens[i]);
			}

			// Re order tokens
			logger.trace(name + " " + startFistNames + " -> " + endFistNames + " size: " + tokensList.size());
			List<String> firstNameTokens = tokensList.subList(startFistNames, endFistNames);
			List<String> familyNameTokens;
			if (endFistNames == tokensList.size()) {
				familyNameTokens = tokensList.subList(0, startFistNames);
			} else {
				familyNameTokens = tokensList.subList(endFistNames, tokensList.size());
			}
			tokensOrdered.addAll(firstNameTokens);
			tokensOrdered.addAll(familyNameTokens);
		}

		List<String> camelCased = new ArrayList<>(tokensOrdered.size());
		for (String t : tokensOrdered) {
			if (t.length() > 0) {
				camelCased.add(Character.toUpperCase(t.charAt(0)) + t.substring(1).toLowerCase());
			}
		}

		return String.join(" ", camelCased);
	}

	@Override
	public SequenceType[] getArgumentTypes() {
		return new SequenceType[] { SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE) };
	}

	@Override
	public QName getName() {
		return new QName("https://w3id.org/arco/saxon-extension", "name-cleaner");
	}

	@Override
	public SequenceType getResultType() {
		return SequenceType.makeSequenceType(ItemType.ANY_ARRAY, OccurrenceIndicator.ZERO_OR_MORE);
	}

}
