package it.cnr.istc.stlab.arco.xsltextension;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import it.cnr.istc.stlab.arco.Urifier;
import net.sf.saxon.functions.NormalizeSpace_1;
import net.sf.saxon.s9api.ExtensionFunction;
import net.sf.saxon.s9api.ItemType;
import net.sf.saxon.s9api.OccurrenceIndicator;
import net.sf.saxon.s9api.QName;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.SequenceType;
import net.sf.saxon.s9api.XdmAtomicValue;
import net.sf.saxon.s9api.XdmValue;
import net.sf.saxon.value.StringValue;

public class Arcofy implements ExtensionFunction {
	
	private static Arcofy instance;
	
	private Arcofy() {
		
	}
	
	public static Arcofy getInstance() {
		if(instance == null) instance = new Arcofy();
		return instance;
	}
    
	public QName getName()
    {
        return new QName("https://w3id.org/arco/saxon-extension", "arcofy");
    }
    
    public SequenceType getResultType()
    {
        return SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE);
    }
    
    public net.sf.saxon.s9api.SequenceType[] getArgumentTypes()
    {
    	return new SequenceType[]
            {
                SequenceType.makeSequenceType(ItemType.STRING, OccurrenceIndicator.ONE)
            };
        
    }

    public XdmValue call(XdmValue[] arguments) throws SaxonApiException
    {
    	StringBuilder sb = new StringBuilder();
    	
    	for(XdmValue argument : arguments) {
    		
    		String arg = ((XdmAtomicValue)argument.itemAt(0)).getStringValue();
    		
    		arg = NormalizeSpace_1.normalizeSpace(new StringValue(arg)).getStringValue();
	        
	        if(sb.length()>0) sb.append(" ");
	        sb.append(arg);
	        
    	}
    	
    	
    	String[] argParts = sb.toString().split("( )+");
        List<String> args = Arrays.asList(argParts);
        String arg = args.stream()
        		.map(a -> {return a.toLowerCase();})
        		.sorted().reduce((a,b) ->{
        			return a + " " + b;
        			}).get();
        
        arg = md5(Urifier.toURI(arg.toLowerCase()));
        
        return new XdmAtomicValue(arg);
    }
    
    private String md5(String arg) {
    	String digest = "";
        MessageDigest md;
		try {
			byte[] bytesOfMessage = arg.getBytes("UTF-8");
			md = MessageDigest.getInstance("MD5");
			byte[] thedigest = md.digest(bytesOfMessage);
			StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < thedigest.length; ++i) {
	          sb.append(Integer.toHexString((thedigest[i] & 0xFF) | 0x100).substring(1,3));
	       }
	        digest = sb.toString();
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return digest;
    }
    
    
    public static String arcofy(String in) {

    	String[] argParts = in.split("( )+");
        List<String> argS = Arrays.asList(argParts);
        String arg = argS.stream()
        		.map(a -> {return a.toLowerCase();})
        		.sorted().reduce((a,b) ->{
        			return a + " " + b;
        			}).get();
        
        arg = Urifier.toURI(arg.toLowerCase());
        
        /*
        String digest = "";
        MessageDigest md;
		try {
			byte[] bytesOfMessage = arg.getBytes("UTF-8");
			md = MessageDigest.getInstance("MD5");
			byte[] thedigest = md.digest(bytesOfMessage);
			StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < thedigest.length; ++i) {
	          sb.append(Integer.toHexString((thedigest[i] & 0xFF) | 0x100).substring(1,3));
	       }
	        digest = sb.toString();
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		return UUID.nameUUIDFromBytes(arg.getBytes()).toString();
	
    }
    public static void main(String[] args) {
    	
    	String in = "Bianchi Ferrari, Francesco";
    	
    	System.out.println("UIID 0: " + UUID.nameUUIDFromBytes("Bianchi Ferrari, Francesco".getBytes()));
    	System.out.println("UIID 1: " + UUID.nameUUIDFromBytes("Bianchi Ferrari, Francesco".getBytes()).getLeastSignificantBits());
    	System.out.println("UIID 2: " + UUID.nameUUIDFromBytes("Bianchi Ferrari, Francesco".getBytes()).getMostSignificantBits());
    	
    	String[] argParts = in.split("( )+");
        List<String> argS = Arrays.asList(argParts);
        String arg = argS.stream()
        		.map(a -> {return a.toLowerCase();})
        		.sorted().reduce((a,b) ->{
        			return a + " " + b;
        			}).get();
        
        arg = Urifier.toURI(arg.toLowerCase());
        System.out.println(arg);
        String digest = "";
        MessageDigest md;
		try {
			byte[] bytesOfMessage = arg.getBytes("UTF-8");
			md = MessageDigest.getInstance("MD5");
			byte[] thedigest = md.digest(bytesOfMessage);
			StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < thedigest.length; ++i) {
	          sb.append(Integer.toHexString((thedigest[i] & 0xFF) | 0x100).substring(1,3));
	       }
	        digest = sb.toString();
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(digest);
	}

}

