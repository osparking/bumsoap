package com.bumsoap.store.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HistoryController {
  @RequestMapping(value = "/history", method = RequestMethod.GET)
  public String login(HttpServletRequest request, Model model, 
      Principal principal) {
    
    if (principal == null) {
      return "redirect:/login";
    } else {
      model.addAttribute("userId", principal.getName());
      return "history";
    }    
  }
}
