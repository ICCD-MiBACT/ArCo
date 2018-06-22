package it.cnr.istc.stlab.arco.analyzer;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashSet;
import java.util.Set;

public class Node {

	private String tagName;
	private Set<Node> children;
	
	public Node(String tagName) {
		this.tagName = tagName;
		this.children = new HashSet<Node>();
	}
	
	public String getTagName() {
		return tagName;
	}
	
	public void addChildren(Node sheet) {
		children.add(sheet);
	}
	
	public Set<Node> getChildren() {
		return children;
	}
	
	public void write(OutputStream out){
		writeAux(out, 0);
	}
	
	protected void write(OutputStream out, int level){
		writeAux(out, level);
	}
	
	private void writeAux(OutputStream out, int level){
		try {
			
			for(int i=0; i<level; i++){
				out.write(new String(new char[]{'\t'}).getBytes());
			}
			
			out.write(tagName.getBytes());
			out.write(new String(new char[]{'\n'}).getBytes());
			
			for(Node child : children)
				child.write(out, level+1);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Node){
			Node n = (Node) obj;
			if(this.tagName.equals(n.tagName))
				return true;
		}
		
		return false;
	}
	
	public synchronized Node merge(Node n) {
		if(!n.children.isEmpty()){
			for(Node c2 : n.children){
				boolean found = false;
				for(Node c1 : this.children){	
					if(c1.equals(c2)){
						found = true;
						children.add(c1.merge(c2));
					}
				}
				
				if(!found) {
					children.add(c2);
				}
			}
		}
		
		return this;
	}
	
	
}
