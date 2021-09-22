package com.bumsoap.store.service;

import java.util.List;

import com.bumsoap.store.domain.BumSoap;
import com.bumsoap.store.types.Shape_w;
import com.bumsoap.store.types.Shapes;

public interface BumSoapService {
	List<BumSoap> getBumSoaps();
	int updateStock(Shapes shape, Shape_w shape_w, 
			int incBy);
}