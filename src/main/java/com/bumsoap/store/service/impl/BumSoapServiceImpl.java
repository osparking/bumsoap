package com.bumsoap.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bumsoap.store.domain.Ingredient;
import com.bumsoap.store.domain.Soap;
import com.bumsoap.store.domain.SoapStock;
import com.bumsoap.store.repo.SoapRepo;
import com.bumsoap.store.service.BumSoapService;
import com.bumsoap.store.types.Shape_w;
import com.bumsoap.store.types.Shapes;

@Service
public class BumSoapServiceImpl implements BumSoapService{

	@Autowired
	SoapRepo bumSoapRepo;
	
	@Override
	public List<Soap> getSoaps(String root) {
		return bumSoapRepo.getSoaps(root);
	}

	@Override
	public int updateStock(SoapStock soapStock) {
		return bumSoapRepo.updateStock(soapStock);
	}

	@Override
	public List<SoapStock> getSoapStocks(String language) {
		return bumSoapRepo.getSoapStocks(language);
	}

	@Override
	public List<Ingredient> getIngredients() {
		return bumSoapRepo.getIngredients();
	}

  @Override
  public void updateSoap(Soap soap) {
    bumSoapRepo.updateSoap(soap);
  }
}
