package it.cnr.istc.stlab.arco.analyzer;

import java.io.IOException;
import java.io.OutputStream;

public class VersionedSheet extends Sheet {

	private String version;
	
	public VersionedSheet(String version, String type, Node root) {
		super(type, root);
		this.version = version;
	}
	
	public String getVersion() {
		return version;
	}
	
	public void write(OutputStream out){
		try {
			out.write(version.getBytes());
			out.write(new String(new char[]{'\n'}).getBytes());
			super.write(out);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public synchronized VersionedSheet merge(Sheet s){
		if(s instanceof VersionedSheet){
			VersionedSheet vs = (VersionedSheet) s;
			if(this.version.equals(vs.version))
				super.merge(vs);
		}
		
		return this;
			
	}
	
	public SheetPrototype getPrototype() {
		return new SheetPrototype(type, version);
	}
}
