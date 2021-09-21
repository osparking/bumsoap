package com.bumsoap.store.types;

import lombok.Getter;

@Getter 
public enum Target {
	HUMAN(0, "피부 및 두피"),
	KITCHEN(1, "식기세척"),
	LAUNDRY(2, "일반세탁");
	
	private final int ordVal;
	private final String descrp;
	private Target(final Integer ordVal, 
			final String descrp) {
	    this.ordVal = ordVal;
	    this.descrp = descrp;
	}
}
