package com.bumsoap.store.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bumsoap.store.domain.BumUser;
import com.bumsoap.store.service.UserService;
import com.bumsoap.store.types.UserRoles;

@Controller
public class UserController {
  @Autowired
  private UserService userService;
  
	@Autowired
	public InMemoryUserDetailsManager inMemoryUserDetailsManager;
	
	@Autowired
	public PasswordEncoder passwordEncoder;	
  
  @RequestMapping(value = "/account", method = RequestMethod.GET)
  
  
  public String login(HttpServletRequest request, Model model, 
      @ModelAttribute BumUser user, Principal principal) {
    
    if (principal == null) {
      return "redirect:/register";
    } else {
      model.addAttribute("userId", principal.getName());
      return "account";
    }
  }
  
  @RequestMapping(value = "/register",method = RequestMethod.GET)
  public String register(@ModelAttribute BumUser user, Model model) {
    return "register";
  }
  
  @RequestMapping(value = "/register",method = RequestMethod.POST)
  public String register(@ModelAttribute BumUser user, Model model,
      HttpServletRequest request) {
    user.setPassword(passwordEncoder.encode(user.getPassword()));
    user.setRole(UserRoles.USER);
    
		ArrayList<GrantedAuthority> grantedAuthoritiesList 
				= new ArrayList<>();
		grantedAuthoritiesList.add(
				new SimpleGrantedAuthority(user.getRole().toString()));
    inMemoryUserDetailsManager.createUser(
    		new User(user.getUserId(), user.getPassword(),
    				grantedAuthoritiesList));
    
    userService.register(user);   
    return "accnt";
  }
}










