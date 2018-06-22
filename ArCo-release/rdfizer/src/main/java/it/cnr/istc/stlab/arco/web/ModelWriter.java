package it.cnr.istc.stlab.arco.web;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.ext.MessageBodyWriter;
import javax.ws.rs.ext.Provider;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.riot.Lang;
import org.apache.jena.riot.RDFDataMgr;

/**
 * 
 * @author Andrea Nuzzolese
 *
 */

@Provider
public class ModelWriter implements MessageBodyWriter<Model>{
	
	public static final Set<String> supportedMediaTypes;
	static {
		Set<String> types = new HashSet<String>();
		types.add("text/turtle");
		types.add("application/rdf+xml");
		types.add("application/n-triples");
		types.add("text/n3");
		types.add("application/json-ld");
		supportedMediaTypes = Collections.unmodifiableSet(types);
	}

	@Override
	public boolean isWriteable(Class<?> type, Type genericType, Annotation[] annotations, MediaType mediaType) {
		String mediaTypeString = mediaType.getType()+'/'+mediaType.getSubtype();
		return Model.class.isAssignableFrom(type) && supportedMediaTypes.contains(mediaTypeString);
	}

	@Override
	public long getSize(Model t, Class<?> type, Type genericType, Annotation[] annotations, MediaType mediaType) {
		return -1;
	}

	@Override
	public void writeTo(Model t, Class<?> type, Type genericType, Annotation[] annotations, MediaType mediaType,
			MultivaluedMap<String, Object> httpHeaders, OutputStream entityStream)
			throws IOException, WebApplicationException {
		
		Lang lang = null;
		
		if(mediaType.equals(new MediaType("text", "n3")))
			lang = Lang.N3;
		else if(mediaType.equals(new MediaType("application", "n-triples")))
			lang = Lang.NTRIPLES;
		else if(mediaType.equals(new MediaType("application", "rdf+xml")))
			lang = Lang.RDFJSON;
		else if(mediaType.equals(new MediaType("application", "json-ld")))
			lang = Lang.JSONLD;
		else lang = Lang.TURTLE;
		
		RDFDataMgr.write(entityStream, t, lang);
		
	}

}
