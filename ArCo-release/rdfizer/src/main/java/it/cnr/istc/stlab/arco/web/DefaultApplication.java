package it.cnr.istc.stlab.arco.web;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.core.Application;

import it.cnr.istc.stlab.arco.web.api.RestApi;

public class DefaultApplication extends Application {
	
	@Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> classes = new HashSet<Class<?>>();
        // resources contributed buy other bundles
        classes.add(RestApi.class);
        //TODO check if clerezza rdf.jaxrs prvoder fits the purpose
        // message body writers, hard-coded for now
        classes.add(ModelWriter.class);
        return classes;
    }

}
