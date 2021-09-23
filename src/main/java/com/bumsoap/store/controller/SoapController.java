package com.bumsoap.store.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bumsoap.store.domain.SoapStock;
import com.bumsoap.store.service.BumSoapService;
import com.bumsoap.store.types.Shape_w;
import com.bumsoap.store.types.Shapes;

@Controller
@RequestMapping("soaps")
public class SoapController {
	@Autowired
	private BumSoapService service;
	
	@RequestMapping
	public String list(HttpServletRequest request, Model model) {
		String root = request.getSession().
				getServletContext().getRealPath("/");
		
		model.addAttribute("soaps", service.getSoaps(root));
		addPriceStock(model);
		model.addAttribute("ingredients", service.getIngredients());
		return "soaps";
	}
	
	private void addPriceStock(Model model) {
		var wholeList = service.getSoapStocks();
		List<SoapStock> normalList = wholeList.stream().
				filter(s->s.getShape_w() == Shape_w.NORMAL).
				collect(Collectors.toList());
		List<SoapStock> smallList = wholeList.stream().
				filter(s->s.getShape_w() == Shape_w.SMALL2).
				collect(Collectors.toList()); 
		
		model.addAttribute("normals", normalList);
		model.addAttribute("smalls", smallList);
	}

	@RequestMapping(value="/update/stock", 
			method = RequestMethod.GET)
	public String updateStock(@ModelAttribute("soapStock") 
				SoapStock soapStock, Model model) {
		addPriceStock(model);
		return "update_stock";
	}
	
	@RequestMapping(value="/update/stock", 
			method = RequestMethod.POST)
	public String updateStockProcess(@ModelAttribute("soapStock")
				SoapStock soapStock) {
		
		int rc = service.updateStock(soapStock);
		System.out.println("갱신 행 수: " + rc);
		return "redirect:/soaps";
	}
}
