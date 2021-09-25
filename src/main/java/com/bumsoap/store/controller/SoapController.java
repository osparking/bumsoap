package com.bumsoap.store.controller;

import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bumsoap.store.domain.Soap;
import com.bumsoap.store.domain.SoapStock;
import com.bumsoap.store.service.BumSoapService;
import com.bumsoap.store.types.Shape_w;

@Controller
@RequestMapping("soaps")
public class SoapController {
	@Autowired
	private BumSoapService service;
	
	@RequestMapping
	public String list(HttpServletRequest request, Model model) {
		String root = request.getSession().
				getServletContext().getRealPath("/");
		var soaps = service.getSoaps(root);
		model.addAttribute("soap", soaps.get(0));
		var language = request.getParameter("language");
		addPriceStock(model, language);
		model.addAttribute("ingredients", service.getIngredients());
		return "soaps";
	}
	
	private void addPriceStock(Model model, String language) {
		var wholeList = service.getSoapStocks(language);
		List<SoapStock> normalList = wholeList.stream().
				filter(s->s.getShape_w() == Shape_w.NORMAL).
				collect(Collectors.toList());
		List<SoapStock> smallList = wholeList.stream().
				filter(s->s.getShape_w() == Shape_w.SMALL2).
				collect(Collectors.toList()); 
		
		model.addAttribute("normals", normalList);
		model.addAttribute("smalls", smallList);
	}
	
	@RequestMapping(value="/update/soap", 
	    method = RequestMethod.GET)
	public String updateSoap(@ModelAttribute Soap soap, 
	    @RequestParam String bssn, Model model) {
	  var soaps = service.getSoaps(null);
	  Soap soapBfr = soaps.get(0);
	  
	  if (Integer.valueOf(bssn) == soap.getBssn()) {
	    model.addAttribute("soapBfr", soapBfr);
	  } 
	  return "updateSoap";
	}
	
	@RequestMapping(value="/update/soap", 
	    method = RequestMethod.POST)
	public String updateSoap(@ModelAttribute Soap soap) {
	  service.updateSoap(soap);
	  return "redirect:/soaps";
	}

	@RequestMapping(value="/update/stock", 
			method = RequestMethod.GET)
	public String updateStock(@ModelAttribute("soapStock") 
				SoapStock soapStock, Model model, 
				HttpServletRequest request ) {
    var language = request.getParameter("language");
    addPriceStock(model, language);	  

    return "update_stock";
	}
	
	@RequestMapping(value="/update/stock", 
			method = RequestMethod.POST)
	public String updateStock(@ModelAttribute("soapStock")
				SoapStock soapStock) {
		
		int rc = service.updateStock(soapStock);
		System.out.println("갱신 행 수: " + rc);
		return "redirect:/soaps";
	}
}
