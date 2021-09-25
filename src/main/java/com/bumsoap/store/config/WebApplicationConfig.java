package com.bumsoap.store.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.bumsoap.store.interceptor.TimeLogInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan("com.bumsoap.store")
public class WebApplicationConfig extends WebMvcConfigurerAdapter {

  @Override
  public void addInterceptors(InterceptorRegistry registry) {      
    registry.addInterceptor(new TimeLogInterceptor());
  }

  @Override
  public void addResourceHandlers(
      ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/img/**").
      addResourceLocations("/resources/images/");
  }

  @Override
  public void configureDefaultServletHandling(
      DefaultServletHandlerConfigurer configurer) {
    configurer.enable();
  }

  @Bean
  public MessageSource messageSource() {
    ResourceBundleMessageSource resource = 
        new ResourceBundleMessageSource();
    resource.setBasename("msgs");
    resource.setDefaultEncoding("utf-8");
    return resource;
  }

  @Bean
  public InternalResourceViewResolver 
      getInternalResourceViewResolver() {
    InternalResourceViewResolver resolver = 
        new InternalResourceViewResolver();
    resolver.setViewClass(JstlView.class);
    resolver.setPrefix("/WEB-INF/views/");
    resolver.setSuffix(".jsp");

    return resolver;
  }

}
