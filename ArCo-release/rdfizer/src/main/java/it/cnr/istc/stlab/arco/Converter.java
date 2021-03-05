package it.cnr.istc.stlab.arco;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.xml.transform.stream.StreamSource;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import it.cnr.istc.stlab.arco.xsltextension.Arcofy;
import it.cnr.istc.stlab.arco.xsltextension.CatalogueRecordIdentifierToCulturalProperty;
import it.cnr.istc.stlab.arco.xsltextension.CataloguingEntityFinder;
import it.cnr.istc.stlab.arco.xsltextension.CodiceEnteToNomeEnte;
import it.cnr.istc.stlab.arco.xsltextension.ContenitoreFisicoFinder;
import it.cnr.istc.stlab.arco.xsltextension.ContenitoreGiuridicoFinder;
import it.cnr.istc.stlab.arco.xsltextension.DefinitionMatcherForASheet;
import it.cnr.istc.stlab.arco.xsltextension.DefinitionMatcherForRASheet;
import it.cnr.istc.stlab.arco.xsltextension.ExtractUnit;
import it.cnr.istc.stlab.arco.xsltextension.ExtractValue;
import it.cnr.istc.stlab.arco.xsltextension.FindMaterialAndTechniqueLinker;
import it.cnr.istc.stlab.arco.xsltextension.FindMaterialLinker;
import it.cnr.istc.stlab.arco.xsltextension.ImageFinder;
import it.cnr.istc.stlab.arco.xsltextension.LinkEMMFinder;
import it.cnr.istc.stlab.arco.xsltextension.MeasurementMapper;
import it.cnr.istc.stlab.arco.xsltextension.NameCleaner;
import it.cnr.istc.stlab.arco.xsltextension.RelatedPropertyFinder;
import it.cnr.istc.stlab.arco.xsltextension.ScientificPropertyDefinitionLinker;
import it.cnr.istc.stlab.arco.xsltextension.Split;
import it.cnr.istc.stlab.arco.xsltextension.Uncamelizer;
import it.cnr.istc.stlab.arco.xsltextension.Urify;
import it.cnr.istc.stlab.arco.xsltextension.Utilities;
import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.Processor;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.Serializer;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmNode;
import net.sf.saxon.s9api.XdmValue;
import net.sf.saxon.s9api.XsltCompiler;
import net.sf.saxon.s9api.XsltExecutable;
import net.sf.saxon.s9api.XsltTransformer;

public class Converter {

	// private static final String XSLT_LOCATION = "META-INF/xslt/arco.xslt";
	private static final String XSLT_LOCATION = "META-INF/xslt";
	private static final Logger logger = LoggerFactory.getLogger(Converter.class);

	private Processor proc;
	private List<XSLTConverter> exps;
	private CataloguingEntityFinder cataloguingEntityFinder;

	public Converter() {

		init();

		ExtensionFunction md5 = new ExtensionFunction() {
			public QName getName() {
				return new QName("https://w3id.org/arco/saxon-extension", "md5");
			}

			public SequenceType getResultType() {
				return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
			}

			public net.sf.saxon.s9api.SequenceType[] getArgumentTypes() {
				return new SequenceType[] { SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE) };
			}

			public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
				String arg = ((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue();

				String digest = "";
				MessageDigest md;
				try {
					byte[] bytesOfMessage = arg.getBytes("UTF-8");
					md = MessageDigest.getInstance("MD5");
					byte[] thedigest = md.digest(bytesOfMessage);
					StringBuffer sb = new StringBuffer();
					for (int i = 0; i < thedigest.length; ++i) {
						sb.append(Integer.toHexString((thedigest[i] & 0xFF) | 0x100).substring(1, 3));
					}
					digest = sb.toString();
				} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				return new XdmAtomicValue(digest);
			}
		};

		ExtensionFunction sheetType2propertyType = new ExtensionFunction() {
			public QName getName() {
				return new QName("https://w3id.org/arco/saxon-extension", "getPropertyType");
			}

			public SequenceType getResultType() {
				return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
			}

			public net.sf.saxon.s9api.SequenceType[] getArgumentTypes() {
				return new SequenceType[] { SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE) };
			}

			public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
				String arg = ((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue();
				arg = TopLevelCultruralPropertyType.getPropertyType(arg);

				if (arg == null)
					arg = "https://w3id.org/arco/ontology/arco/CulturalProperty";
				return new XdmAtomicValue(arg);
			}
		};

		ExtensionFunction sheetType2SpecificPropertyType = new ExtensionFunction() {
			public QName getName() {
				return new QName("https://w3id.org/arco/saxon-extension", "getSpecificPropertyType");
			}

			public SequenceType getResultType() {
				return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
			}

			public net.sf.saxon.s9api.SequenceType[] getArgumentTypes() {
				return new SequenceType[] { SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE) };
			}

			public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
				String arg = ((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue();
				return new XdmAtomicValue(Utilities.getSpecificPropertyType(arg));
			}
		};

		ExtensionFunction localName = new ExtensionFunction() {
			public QName getName() {
				return new QName("https://w3id.org/arco/saxon-extension", "local-name");
			}

			public SequenceType getResultType() {
				return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
			}

			public net.sf.saxon.s9api.SequenceType[] getArgumentTypes() {
				return new SequenceType[] { SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE) };
			}

			public XdmValue call(XdmValue[] arguments) throws SaxonApiException {
				String arg = ((XdmAtomicValue) arguments[0].itemAt(0)).getStringValue();
				arg = Utilities.getLocalName(arg);
				return new XdmAtomicValue(arg);
			}
		};

		proc = new Processor(false);
		proc.registerExtensionFunction(new Urify());
		proc.registerExtensionFunction(Arcofy.getInstance());
		proc.registerExtensionFunction(md5);
		proc.registerExtensionFunction(sheetType2propertyType);
		proc.registerExtensionFunction(sheetType2SpecificPropertyType);
		proc.registerExtensionFunction(localName);
		proc.registerExtensionFunction(cataloguingEntityFinder);
		proc.registerExtensionFunction(DefinitionMatcherForRASheet.getInstance());
		proc.registerExtensionFunction(DefinitionMatcherForASheet.getInstance());
		// proc.registerExtensionFunction(DefinitionMatcherForBDMSheet.getInstance());
		proc.registerExtensionFunction(ScientificPropertyDefinitionLinker.getInstance());
		proc.registerExtensionFunction(FindMaterialLinker.getInstance());
		proc.registerExtensionFunction(FindMaterialAndTechniqueLinker.getInstance());
		proc.registerExtensionFunction(RelatedPropertyFinder.getInstance());
		proc.registerExtensionFunction(MeasurementMapper.getInstance());
		proc.registerExtensionFunction(Uncamelizer.getInstance());
		proc.registerExtensionFunction(ImageFinder.getInstance());
		proc.registerExtensionFunction(Split.getInstance());
		proc.registerExtensionFunction(ExtractValue.getInstance());
		proc.registerExtensionFunction(ExtractUnit.getInstance());
		proc.registerExtensionFunction(LinkEMMFinder.getInstance());
		proc.registerExtensionFunction(CatalogueRecordIdentifierToCulturalProperty.getInstance());
		proc.registerExtensionFunction(NameCleaner.getInstance());
		proc.registerExtensionFunction(ContenitoreFisicoFinder.getInstance());
		proc.registerExtensionFunction(ContenitoreGiuridicoFinder.getInstance());
		proc.registerExtensionFunction(CodiceEnteToNomeEnte.getInstance());

		XsltCompiler comp = proc.newXsltCompiler();

		ClassLoader loader = Converter.class.getClassLoader();

		URL url = loader.getResource(XSLT_LOCATION);
		URI uri;
		try {
			uri = url.toURI();
			Path xsltPath = null;
			if (uri.getScheme().equals("jar")) {
				FileSystem fileSystem = FileSystems.newFileSystem(uri, Collections.<String, Object>emptyMap());
				xsltPath = fileSystem.getPath(XSLT_LOCATION);
			} else {
				xsltPath = Paths.get(uri);
			}

			Files.walk(xsltPath, 1).forEach(path -> {

				if (path.toString().endsWith(".xslt")) {
					XsltExecutable exp;

					try {
						System.out.println("-- " + path.toString());
						exp = comp.compile(new StreamSource(Files.newInputStream(path)));
						exps.add(new XSLTConverter(path.toString(), exp));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			});

		} catch (URISyntaxException | IOException e1) {
			e1.printStackTrace();
		}

	}

	public void addXSTLConverter(Path path) {
		XsltExecutable exp;
		XsltCompiler comp = proc.newXsltCompiler();
		try {
			System.out.println("-- " + path.toString());
			exp = comp.compile(new StreamSource(Files.newInputStream(path)));
			exps.add(new XSLTConverter(path.toString(), exp));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Model convert(String item, String prefix, String sourcePrefix, InputStream sourceXml) throws Exception {

		Model model = ModelFactory.createDefaultModel();

		logger.trace("item {} prefix {}", item, prefix);

		StreamSource inputStreamSource = new StreamSource(sourceXml);
		XdmNode source = proc.newDocumentBuilder().build(inputStreamSource);

		// XsltTransformer trans = exp.load();
		for (XSLTConverter exp : exps) {
			ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
			Serializer out = proc.newSerializer(byteArrayOut);
			XsltTransformer trans = exp.executable.load();

			// System.out.println(exp.name);
			trans.setParameter(new QName("item"), new XdmAtomicValue(item));
			trans.setParameter(new QName("NS"), new XdmAtomicValue(prefix));
			trans.setParameter(new QName("SOURCE"), new XdmAtomicValue(sourcePrefix));
			trans.setInitialContextNode(source);
			trans.setDestination(out);
			trans.transform();
			trans.close();
			out.close();

			String rdfSource = new String(byteArrayOut.toByteArray());

			try {
				ByteArrayInputStream in = new ByteArrayInputStream(rdfSource.getBytes());
				Model localModel = ModelFactory.createDefaultModel();
				localModel.read(in, null, "RDF/XML");

				model.add(localModel);
			} catch (Exception e) {
				logger.error(rdfSource);
				throw e;
			}
		}

		return model;

	}

	private void init() {

		exps = new ArrayList<XSLTConverter>();
		cataloguingEntityFinder = CataloguingEntityFinder.create();
	}

	public void destroy() {
		cataloguingEntityFinder.destroy();
	}

	class XSLTConverter {
		String name;
		XsltExecutable executable;

		public XSLTConverter(String name, XsltExecutable executable) {
			this.name = name;
			this.executable = executable;
		}
	}

}
