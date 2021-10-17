package com.bumsoap.store.config;


import javax.servlet.Filter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.filter.CharacterEncodingFilter;
//@formatter:off
import org.springframework.web.servlet.support.
			AbstractAnnotationConfigDispatcherServletInitializer;

public class DispatcherServletInitializer extends 
			AbstractAnnotationConfigDispatcherServletInitializer {
	
  @Override
  public void onStartup(final ServletContext servletContext) 
  		throws ServletException {

      // https://wiki.apache.org/tomcat/FAQ/CharacterEncoding
      servletContext.setRequestCharacterEncoding("UTF-8");
      servletContext.setResponseCharacterEncoding("UTF-8");

      super.onStartup(servletContext);
  }
	
  @Override
  protected Filter[] getServletFilters() {
      CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
      characterEncodingFilter.setEncoding("UTF-8");
      characterEncodingFilter.setForceEncoding(true);

      return new Filter[] { characterEncodingFilter };
  }

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootApplicationConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
        return new Class[] { WebApplicationConfig.class
        		, SecurityConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
        return new String[] { "/" };
	}
}
