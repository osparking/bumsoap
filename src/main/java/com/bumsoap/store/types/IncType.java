package com.bumsoap.store.types;

import lombok.Getter;

@Getter
public enum IncType {
	Absolute(0, "절대값"),
	Relative(1, "상대값");
	
	private final int ordVal;
	private final String descrp;
	private IncType(final Integer ordVal, 
			final String descrp) {
	    this.ordVal = ordVal;
	    this.descrp = descrp;
	}
}