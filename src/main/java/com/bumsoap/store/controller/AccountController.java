package com.bumsoap.store.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bumsoap.store.domain.User;

@Controller
public class AccountController {
  @RequestMapping(value = "/account", method = RequestMethod.GET)
  public String login(HttpServletRequest request, Model model, 
      @ModelAttribute User user, Principal principal) {
    
    if (principal == null) {
      return "register";
    } else {
      model.addAttribute("userId", principal.getName());
      return "account";
    }
  }
  
  @RequestMapping(value = "/register",method = RequestMethod.POST)
  public String register(@ModelAttribute User user, Model model,
      HttpServletRequest request) {
    
    return "accnt";
  }
}