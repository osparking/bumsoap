package com.bumsoap.store.domain;

import java.text.DecimalFormat;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Ingredient {
	private int ing_SN;
	private String ing_Name;
	private String effects;
	
	@Setter(AccessLevel.NONE)
	private float weight;
	private String weightStr;
	
	@Setter(AccessLevel.NONE)
	private float percent;
	private String percentStr;
	
	private static DecimalFormat df = new DecimalFormat("#,###.00");

	public void setWeight(float weight) {
		this.weight = weight;
		this.setWeightStr(df.format(weight));
	}

	public void setPercent(float percent) {
		this.percent = percent;
		this.setPercentStr(df.format(percent));
	}
}
