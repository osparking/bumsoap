package com.bumsoap.store.repo;

import java.util.List;

import com.bumsoap.store.domain.Ingredient;
import com.bumsoap.store.domain.Soap;
import com.bumsoap.store.domain.SoapStock;

public interface SoapRepo {
	List<Soap> getSoaps(String root);
	List<SoapStock> getSoapStocks(String language);
	int updateStock(SoapStock soapStock);
	List<Ingredient> getIngredients();
  void updateSoap(Soap soap);
}
