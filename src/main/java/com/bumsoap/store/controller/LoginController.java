package com.bumsoap.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String login() {
    return "login";
  }
//  
//  @Autowired
//  AuthenticationProvider ap;
//  
//  @RequestMapping(value = "/login", method = RequestMethod.POST)
//  public String loginProc() {
//  	ap.authenticate(null);
//  	return "login";
//  }
}
