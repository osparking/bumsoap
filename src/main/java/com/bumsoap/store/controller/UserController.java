package com.bumsoap.store.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bumsoap.store.domain.User;
import com.bumsoap.store.service.UserService;
import com.bumsoap.store.types.UserRoles;

@Controller
public class UserController {
  @Autowired
  private UserService userService;
  
  @RequestMapping(value = "/account", method = RequestMethod.GET)
  
  
  public String login(HttpServletRequest request, Model model, 
      @ModelAttribute User user, Principal principal) {
    
    if (principal == null) {
      return "redirect:/register";
    } else {
      model.addAttribute("userId", principal.getName());
      return "account";
    }
  }
  
  @RequestMapping(value = "/register",method = RequestMethod.GET)
  public String register(@ModelAttribute User user, Model model) {
    return "register";
  }
  
  @RequestMapping(value = "/register",method = RequestMethod.POST)
  public String register(@ModelAttribute User user, Model model,
      HttpServletRequest request) {
    String encdPwd = BCrypt.hashpw("1234", BCrypt.gensalt());
    user.setPassword(encdPwd);
    user.setRole(UserRoles.USER);
    
    userService.register(user);   
    return "accnt";
  }
}