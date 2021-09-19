package com.bumsoap.store.config;

//@formatter:off
import org.springframework.web.servlet.support.
			AbstractAnnotationConfigDispatcherServletInitializer;

public class DispatcherServletInitializer extends 
			AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
        return new Class[] { WebApplicationConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
        return new String[] { "/" };
	}
}
