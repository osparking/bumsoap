package com.bumsoap.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bumsoap.store.domain.BumSoap;
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
	public List<BumSoap> getBumSoaps() {
		return bumSoapRepo.getBumSoaps();
	}

	@Override
	public int updateStock(Shapes shape, Shape_w shape_w, 
			int incBy) {
		return bumSoapRepo.updateStock(shape, shape_w, incBy);
	}

	@Override
	public List<SoapStock> getSoapStocks() {
		return bumSoapRepo.getSoapStocks();
	}
}
