package com.bumsoap.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HistoryController {
  @RequestMapping(value = "/history", method = RequestMethod.GET)
  public String login() {
    return "history";
  }
}
