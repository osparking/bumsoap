package com.bumsoap.store.repo;

import java.util.List;

import com.bumsoap.store.domain.BumSoap;
import com.bumsoap.store.domain.SoapStock;
import com.bumsoap.store.types.Shape_w;
import com.bumsoap.store.types.Shapes;

public interface BumSoapRepo {
	List<BumSoap> getBumSoaps();
	List<SoapStock> getSoapStocks();
	int updateStock(SoapStock soapStock);
}
