package com.bumsoap.store.config;

import java.util.List;

//@formatter:off
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.
  authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.
  web.builders.HttpSecurity;
import org.springframework.security.config.annotation.
  web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.
  web.configuration.WebSecurityConfigurerAdapter;

import com.bumsoap.store.domain.User;
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

    List<User> users = userService.getAllUsers();
    for (User u : users) {
      if ("admin".equals(u.getUsername())) {
        auth.inMemoryAuthentication().withUser(u.getUsername()).
        password(u.getPassword()).roles("USER", "ADMIN");
      } else {
        auth.inMemoryAuthentication().withUser(u.getUsername()).
        password(u.getPassword()).roles("USER");
      }
    }
  }

  @Override
  protected void configure(HttpSecurity httpSecurity) 
      throws Exception {
    httpSecurity.formLogin().loginPage("/login").
      usernameParameter("userId").passwordParameter("password");
    httpSecurity.formLogin().defaultSuccessUrl(
      "/history").failureUrl("/login?error");
    httpSecurity.logout().logoutSuccessUrl("/login?logout");

    httpSecurity.exceptionHandling().accessDeniedPage(
      "/login?accessDenied");
    httpSecurity.authorizeRequests()
      .antMatchers("/").permitAll()
      .antMatchers("/**/add").access("hasRole('ADMIN')")
      .antMatchers("/**/history/**").access("hasRole('USER')");
    httpSecurity.csrf().disable();
  }
}
