package com.bumsoap.store.types;

import lombok.Getter;

@Getter
public enum Shapes {
	NORMAN(0, "보통비누"),
	MEAJOO(1, "메주비누"),
	WHITE(2, "백설공주");
	
	private final int ordVal;
	private final String descrp;
	private Shapes(final Integer ordVal, 
			final String descrp) {
	    this.ordVal = ordVal;
	    this.descrp = descrp;
	}
}
