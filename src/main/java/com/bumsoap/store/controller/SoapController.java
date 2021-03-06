package com.bumsoap.store.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
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
import com.bumsoap.store.domain.SoapPic;
import com.bumsoap.store.domain.SoapStock;
import com.bumsoap.store.service.BumSoapService;
import com.bumsoap.store.types.Shape_w;

@Controller
@RequestMapping("soaps")
public class SoapController {
	@Autowired
	private BumSoapService service;
	
	@RequestMapping
	public String list(HttpServletRequest request, Model model,
	    Principal principal) {
		String root = request.getSession().
				getServletContext().getRealPath("/");
		var soaps = service.getSoaps(root);
		var language = request.getParameter("language");
		
		language = (language == null ? "ko" : language); 
		addPriceStock(model, language);
		model.addAttribute("soap", soaps.get(0));
		model.addAttribute("ingredients", service.getIngredients());
		if (principal != null) {
		  model.addAttribute("userId", principal.getName());
		}
		
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
	    @RequestParam String bssn, Model model, 
	    Principal principal) {
	  var soaps = service.getSoaps(null);
	  Soap soapBfr = soaps.get(0);
	  
		if (principal != null) {
		  model.addAttribute("userId", principal.getName());
		}	  
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
	
	@RequestMapping(value="/update/imgOrder", 
	    method = RequestMethod.GET)
	public String updateImgOrder(@ModelAttribute Soap soap, 
	    @RequestParam String bssn, Model model, 
	    Principal principal) {
	  var soaps = service.getSoaps(null);
	  Soap soapBfr = soaps.get(0);
	  
		if (principal != null) {
		  model.addAttribute("userId", principal.getName());
		}	  
	  if (Integer.valueOf(bssn) == soap.getBssn()) {
	    model.addAttribute("soapPics", soapBfr.getPics());
	  } 
	  return "updatePics";
	}

	@RequestMapping(value="/update/imgOrder", 
	    method = RequestMethod.POST)
	public String updateImgOrder(@ModelAttribute Soap soap) {
	  service.updateSoap(soap);
	  return "redirect:/soaps";
	}

	@RequestMapping(value="/update/stock", 
			method = RequestMethod.GET)
	public String updateStock(@ModelAttribute("soapStock") 
				SoapStock soapStock, Model model, 
				HttpServletRequest request ) {
    var language = request.getParameter("language");
    language = (language == null ? "ko" : language);     
    addPriceStock(model, language);	  

    return "update_stock";
	}
	
	@RequestMapping(value="/update/stock", 
			method = RequestMethod.POST)
	public String updateStock(@ModelAttribute("soapStock")
				SoapStock soapStock) {
		
		int rc = service.updateStock(soapStock);
		System.out.println("?????? ??? ???: " + rc);
		return "redirect:/soaps";
	}
}
