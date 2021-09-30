package com.bumsoap.store.config;

import javax.annotation.Resource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.
  authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.
  web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.
  web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

//@formatter:off
@Configuration
@EnableWebSecurity
public class SecurityConfig 
              extends WebSecurityConfigurerAdapter {
	@Resource
  private UserDetailsService userDetailsService;
  
  @Bean
  public DaoAuthenticationProvider authProvider() {
      var authProvider = new DaoAuthenticationProvider();
      authProvider.setUserDetailsService(userDetailsService);
      authProvider.setPasswordEncoder(passwordEncoder());
      return authProvider;
  }
  
  @Override
  protected void configure(AuthenticationManagerBuilder auth) 
  				throws Exception {
      auth.authenticationProvider(authProvider());
  }
  
  @Override
  protected void configure(HttpSecurity http) throws Exception {
      http.authorizeRequests()
      		.anyRequest().authenticated()
          .and().httpBasic();
  }
  
  @Bean
  public PasswordEncoder passwordEncoder() { 
  	return new BCryptPasswordEncoder();
  }
}









