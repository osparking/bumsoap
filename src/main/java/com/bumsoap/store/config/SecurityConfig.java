package com.bumsoap.store.config;

import java.util.ArrayList;
import java.util.List;

//@formatter:off
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.
  authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.
  web.builders.HttpSecurity;
import org.springframework.security.config.annotation.
  web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.
  web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

import com.bumsoap.store.domain.BumUser;
import com.bumsoap.store.service.UserService;

//@formatter:off
@Configuration
@EnableWebSecurity
public class SecurityConfig 
              extends WebSecurityConfigurerAdapter {
  @Autowired
  private UserService userService;

  @Autowired
  public void configureGlobalSecurity(
      AuthenticationManagerBuilder auth) throws Exception {
  	auth.userDetailsService(inMemoryUserDetailsManager());
  }
  
	@Bean
	public InMemoryUserDetailsManager inMemoryUserDetailsManager() {
		List<UserDetails> userDetailsList = new ArrayList<>();
	  List<BumUser> users = userService.getAllUsers();
	  
	  for (BumUser u : users) {
	    var roles = new ArrayList<String>();
	    
	    switch (u.getRole()) {
	    case ROOT: 
	      roles.add("ROOT");
	    case ADMIN: 
	      roles.add("ADMIN");
	    default:
	      roles.add("USER");
	    }
	    userDetailsList.add(
	    		User.withUsername(u.getUserId())
	    				.password(u.getPassword())
	    				.roles(roles.toArray(new String[0])).build());
	  }		
		return new InMemoryUserDetailsManager(userDetailsList);
	}
  
  @Bean 
  public PasswordEncoder passwordEncoder() {
      return new BCryptPasswordEncoder();
  }

  @Override
  protected void configure(HttpSecurity httpSecurity) 
      throws Exception {
    httpSecurity.formLogin().loginPage("/login")
      .usernameParameter("userId")
      .passwordParameter("password");
    httpSecurity.formLogin()
      /**
       * In case of protected page trial,
       * user lands on that page. O.W., below Url. 
       */
      .defaultSuccessUrl("/soaps") 
      .failureUrl("/login?error");
    httpSecurity.logout().logoutSuccessUrl("/soaps");

    httpSecurity.exceptionHandling().accessDeniedPage(
      "/login?accessDenied");
    httpSecurity.authorizeRequests()
      .antMatchers("/").permitAll()
      .antMatchers("/**/update/**").access("hasRole('ADMIN')")
      .antMatchers("/**/history/**").access("hasRole('USER')");
    httpSecurity.csrf().disable();
  }
}
