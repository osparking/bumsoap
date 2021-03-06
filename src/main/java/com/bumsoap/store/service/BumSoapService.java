package com.bumsoap.store.service;

import java.util.List;

import com.bumsoap.store.domain.Ingredient;
import com.bumsoap.store.domain.Soap;
import com.bumsoap.store.domain.SoapStock;

public interface BumSoapService {
	List<Soap> getSoaps(String root);
	int updateStock(SoapStock soapStock);
	List<SoapStock> getSoapStocks(String language);
	List<Ingredient> getIngredients();
  void updateSoap(Soap soap);
}
