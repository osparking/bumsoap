package com.bumsoap.store.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Welcome {
  @GetMapping("/")
  public String welcome(Model model, Principal principal) {
    if (principal != null) {
      model.addAttribute("userId", principal.getName());
    }
    return "welcome";
  }

  @RequestMapping("intro")
  public String intro(Model model, Principal principal) {
    if (principal != null) {
      model.addAttribute("userId", principal.getName());
    }
    return "intro";
  }
}
