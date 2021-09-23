package com.bumsoap.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bumsoap.store.domain.Ingredient;
import com.bumsoap.store.domain.Soap;
import com.bumsoap.store.domain.SoapStock;
import com.bumsoap.store.repo.BumSoapRepo;
import com.bumsoap.store.service.BumSoapService;
import com.bumsoap.store.types.Shape_w;
import com.bumsoap.store.types.Shapes;

@Service
public class BumSoapServiceImpl implements BumSoapService{

	@Autowired
	BumSoapRepo bumSoapRepo;
	
	@Override
	public List<Soap> getSoaps(String root) {
		return bumSoapRepo.getSoaps(root);
	}

	@Override
	public int updateStock(SoapStock soapStock) {
		return bumSoapRepo.updateStock(soapStock);
	}

	@Override
	public List<SoapStock> getSoapStocks() {
		return bumSoapRepo.getSoapStocks();
	}

	@Override
	public List<Ingredient> getIngredients() {
		return bumSoapRepo.getIngredients();
	}
}
