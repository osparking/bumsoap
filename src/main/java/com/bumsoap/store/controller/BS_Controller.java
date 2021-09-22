package com.bumsoap.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bumsoap.store.repo.BumSoapRepo;
import com.bumsoap.store.service.BumSoapService;
import com.bumsoap.store.types.Shape_w;
import com.bumsoap.store.types.Shapes;

@Controller
public class BS_Controller {
	@Autowired
	private BumSoapService service;
	
	@RequestMapping("/bumsoaps")
	public String list(Model model) {
		model.addAttribute("bumsoaps", service.getBumSoaps());
		return "bumsoaps";
	}
	
	@RequestMapping("/update/stock")
	public String updateStock(Model model) {
		Shapes sp = Shapes.NORMAL;
		Shape_w spw = Shape_w.NORMAL;
		
		int rc = service.updateStock(sp, spw, 1);
		System.out.println("갱신 행 수: " + rc);
		model.addAttribute("bumsoaps", service.getBumSoaps());
		return "redirect:/bumsoaps";
	}
}
