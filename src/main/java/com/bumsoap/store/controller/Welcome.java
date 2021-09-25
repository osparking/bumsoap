package com.bumsoap.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Welcome {
    @GetMapping("/")
    public String welcome(Model model) {
        return "welcome";
    }
    
    @RequestMapping("intro")
    public String intro(Model model) {
    	return "intro";
    }
}
