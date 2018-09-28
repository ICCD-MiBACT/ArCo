package it.cnr.istc.stlab.arco.analyzer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class RSEAnalyzer {
	
	public VersionedSheet parse(File xmlFile){
		VersionedSheet vs = null;
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder;
		try {
			dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(xmlFile);
			
			Element root = doc.getDocumentElement();
			
			root.normalize();
			NodeList nl = root.getChildNodes();
			
			Element sheet = null;
			for(int i=0, j=nl.getLength(); i<j && sheet == null; i++){
				Node n = nl.item(i);
				
				if(n instanceof Element){
					sheet = (Element) n;
				}
			}
			
			
			//
			String sheetType = sheet.getTagName();
			String sheetVersion = sheet.getAttribute("version");
			
			it.cnr.istc.stlab.arco.analyzer.Node rootNode = visit(0, null, root);
			
			vs = new VersionedSheet(sheetVersion, sheetType, rootNode);
			
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vs;

	}
	
	private it.cnr.istc.stlab.arco.analyzer.Node visit(int level, it.cnr.istc.stlab.arco.analyzer.Node parent, Element element) {
		
		String name = element.getTagName();
		
		it.cnr.istc.stlab.arco.analyzer.Node node = new it.cnr.istc.stlab.arco.analyzer.Node(name);
		if(parent != null)
			parent.addChildren(node);
		
		NodeList nodeList = element.getChildNodes();
		for(int i=0, j=nodeList.getLength(); i<j; i++){
			Node childNode = nodeList.item(i);
			if(childNode instanceof Element){
				Element child = (Element) childNode;
				
				visit(level+1, node, child);
			}
		}
		
		return node;
	}
	
	public static void main(String[] args) {
		/*
		Analyzer analyzer = new Analyzer();
		VersionedSheet vs1 = analyzer.parse(new File("/Users/andrea/Documents/CNR/ArCo/state8/0/ICCD10006679.xml"));
		VersionedSheet vs2 = analyzer.parse(new File("/Users/andrea/Documents/CNR/ArCo/state8/0/ICCD10006680.xml"));
		vs1.merge(vs2);
		vs1.write(System.out);
		*/
		
		
		File state8Folder = new File("/Users/andrea/Documents/CNR/ArCo/state8");
		File[] rootFolders = state8Folder.listFiles(f->f.isDirectory() && !f.isHidden());
		
		Map<SheetPrototype,VersionedSheet> prototypesMap = new HashMap<SheetPrototype,VersionedSheet>();
		int count = 0;
		for(File rootFolder : rootFolders){
			File[] xmls = rootFolder.listFiles(f->f.isFile() && !f.isHidden() && f.getName().endsWith(".xml"));
			
			List<File> xmlFiles = Arrays.asList(xmls);
			List<VersionedSheet> versionedSheets = xmlFiles.parallelStream()
				.map(xmlFile -> {
					RSEAnalyzer analyzer = new RSEAnalyzer();
					VersionedSheet versionedSheet = analyzer.parse(xmlFile);
					return versionedSheet;
				})
				.collect(Collectors.toList());
			
			List<SheetPrototype> sheetPrototypes = versionedSheets.parallelStream()
				.map(vs -> {
					return new SheetPrototype(vs.getType(), vs.getVersion());
				})
				.distinct()
				.collect(Collectors.toList());
				
			sheetPrototypes.forEach(sheetPrototype -> {
				
				List<VersionedSheet> coherentVersionedSheets = versionedSheets.parallelStream()
					.filter(vs -> sheetPrototype.equals(vs.getPrototype()))
					.collect(Collectors.toList());
				
				VersionedSheet prototypicalVersionedSheet = coherentVersionedSheets.parallelStream()
					.reduce((vs1,vs2)->{
						return vs1.merge(vs2);
					})
					.get();
				
				VersionedSheet storedPrototypicalVersionedSheet = prototypesMap.get(sheetPrototype);
				if(storedPrototypicalVersionedSheet == null)
					prototypesMap.put(sheetPrototype, prototypicalVersionedSheet);
				else storedPrototypicalVersionedSheet.merge(prototypicalVersionedSheet);
				
				
			});
			count++;
			//if(count==10) break;
			System.out.println(count);
		}
		
		System.out.println(prototypesMap.size());
		
		for(SheetPrototype sheetPrototype : prototypesMap.keySet()){
			VersionedSheet versionedSheet = prototypesMap.get(sheetPrototype);
			String version = versionedSheet.getVersion();
			File versionFolder = new File(version);
			versionFolder.mkdirs();
			File sheet = new File(versionFolder, versionedSheet.getType() + ".tsv");
			FileOutputStream fos;
			try {
				fos = new FileOutputStream(sheet);
				versionedSheet.write(fos);
				fos.flush();
				fos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
	}

}
