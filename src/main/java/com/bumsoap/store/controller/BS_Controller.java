package com.bumsoap.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bumsoap.store.domain.repo.BumSoapRepo;

@Controller
public class BS_Controller {
	@Autowired
	private BumSoapRepo bumSoapRepo;
	
	@RequestMapping("/bumsoaps")
	public String list(Model model) {
		model.addAttribute("bumsoaps", bumSoapRepo.getBumSoaps());
		return "bumsoaps";
	}
}
