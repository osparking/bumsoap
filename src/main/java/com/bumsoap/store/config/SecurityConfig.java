package com.bumsoap.store.config;

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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

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
      if ("admin".equals(u.getUserId())) {
       auth.inMemoryAuthentication().withUser(u.getUserId())
       .password(u.getPassword()).roles("USER", "ADMIN")
       .and().passwordEncoder(passwordEncoder);
      } else {
       auth.inMemoryAuthentication().withUser(u.getUserId())
       .password(u.getPassword()).roles("USER")
       .and().passwordEncoder(passwordEncoder);
      }
    }
  }
  
  @Autowired
  private PasswordEncoder passwordEncoder;

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
