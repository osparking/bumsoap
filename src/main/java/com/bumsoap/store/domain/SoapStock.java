package com.bumsoap.store.domain;

import java.text.DecimalFormat;

import com.bumsoap.store.types.IncType;
import com.bumsoap.store.types.Shape_w;
import com.bumsoap.store.types.Shapes;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class SoapStock {
	private Shape_w shape_w;
	private Shapes shape;
	@Setter(AccessLevel.NONE)
	private double price;
	private String priceStr;
	private int stock;
	private IncType incType;
	
	public void setPrice(double price) {
		this.price = price;
		DecimalFormat df = new DecimalFormat("#,###");
		this.setPriceStr(df.format(price));
	}	
}
