package it.cnr.istc.stlab.arco.web;

import org.eclipse.jetty.server.Handler;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.ContextHandler;
import org.eclipse.jetty.server.handler.ContextHandlerCollection;
import org.eclipse.jetty.server.handler.ResourceHandler;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;
import org.eclipse.jetty.util.resource.Resource;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.servlet.ServletContainer;

import it.cnr.istc.stlab.arco.web.api.RestApi;

public class WebApp {
	
	public static void main(String[] args) throws Exception {// Jetty server
		Server jettyServer = new Server(8080);

		

		// Servlets
		ResourceConfig config = new ResourceConfig();
		config.register(RestApi.class);
		config.register(ModelWriter.class);
		config.register(MultiPartFeature.class);
		ServletHolder servletHolder = new ServletHolder(new ServletContainer(config));
		servletHolder.setInitOrder(1);
		servletHolder.setInitParameter("jersey.config.server.provider.packages", FileUtils.getNamePackage(RestApi.class));
		servletHolder.setInitParameter("jersey.config.server.wadl.disableWadl", "true");
		servletHolder.setInitParameter("jersey.config.server.provider.classnames", "org.glassfish.jersey.jackson.JacksonFeature");
		//servletHolder.setInitParameter("org.eclipse.jetty.servlet.Default.resourceBase", "./src/main/resources/META-INF/webapp");
		
		ResourceHandler resourceHandler = new ResourceHandler();
		
		ContextHandler contextHandler = new ContextHandler();
        contextHandler.setContextPath("/static");
        contextHandler.setBaseResource(Resource.newResource("./webapp"));
        contextHandler.setHandler(resourceHandler);
		
		// Main context handler
        
        
		ServletContextHandler context = new ServletContextHandler(jettyServer, "/");
		context.addServlet(servletHolder, "/*");
		
		ContextHandlerCollection contexts = new ContextHandlerCollection();
        contexts.setHandlers(new Handler[] { contextHandler, context});
        
        jettyServer.setHandler(contexts);
		
		System.out.println("ArCo service will be available at " + "http://localhost:8080/*");
		
		

		// add main context to Jetty
		//jettyServer.setHandler(servletContextHandler);
		
		
		try {
			jettyServer.start();
			System.out.println("Done! Jetty Server is up and running!");
			jettyServer.join();
		} finally {
			try {
				jettyServer.destroy();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	} 
}
