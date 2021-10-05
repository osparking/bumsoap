package com.bumsoap.store.types;

import lombok.Getter;

@Getter
public enum Shapes {
	NORMAL(0, "보통비누", "Normal"),
	MEAJOO(1, "메주비누", "MaeJoo"),
	WHITE(2, "백설공주", "SnowWhite");
	
	private final int ordVal;
	private final String descrp;
	private final String descrpE;
	private Shapes(final Integer ordVal, 
			final String descrp, final String descrpE) {
	    this.ordVal = ordVal;
	    this.descrp = descrp;
	    this.descrpE = descrpE;
	}
}
