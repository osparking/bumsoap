package com.bumsoap.store.types;

public enum Target {
	HUMAN(0),
	KITCHEN(1),
	LAUNDRY(2);
	
	private final int ordVal;
	private Target(final Integer ordVal) {
	    this.ordVal = ordVal;
	}
}
