package com.bumsoap.store.repo;

import java.util.List;

import com.bumsoap.store.domain.Ingredient;
import com.bumsoap.store.domain.Soap;
import com.bumsoap.store.domain.SoapStock;

public interface BumSoapRepo {
	List<Soap> getBumSoaps();
	List<SoapStock> getSoapStocks();
	int updateStock(SoapStock soapStock);
	List<Ingredient> getIngredients();
}
