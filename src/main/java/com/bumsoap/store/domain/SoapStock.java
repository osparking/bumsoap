package com.bumsoap.store.domain;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Currency;
import java.util.Locale;

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
	
	@Setter(AccessLevel.NONE)
	private int stock;
	private String stockStr;
	private IncType incType;
	
	private static DecimalFormat df = new DecimalFormat("#,###");
	
	public void setPrice(double price, Locale lo) {
		this.price = price;
		var numFmt = NumberFormat.getCurrencyInstance(lo);
		this.setPriceStr(numFmt.format(price));
	}

	public void setStock(int stock) {
		this.stock = stock;
		this.setStockStr(df.format(stock));
	}
}
