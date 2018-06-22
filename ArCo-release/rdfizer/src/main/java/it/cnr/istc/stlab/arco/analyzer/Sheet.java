package it.cnr.istc.stlab.arco.analyzer;

import java.io.OutputStream;

public class Sheet {

	protected String type;
	protected Node root;
	
	public Sheet(String type, Node root) {
		this.type = type;
		this.root = root;
	}
	
	
	public String getType() {
		return type;
	}
	
	public Node getRoot() {
		return root;
	}	
	
	public void write(OutputStream out){
		root.write(out);
	}
	
	public synchronized Sheet merge(Sheet s){
		if(this.type.equals(s.type)){
			if(root.equals(s.root)){
				root = root.merge(s.root);
			}
		}
		
		return this;
			
	}
}
