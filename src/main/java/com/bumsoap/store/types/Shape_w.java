package com.bumsoap.store.types;

import lombok.Getter;

@Getter
public enum Shape_w {
	NORMAL(0, "정상중량"), 
	SMALL2(1, "백설공주");

	private final int ordVal;
	private final String descrp;

	private Shape_w(final Integer ordVal, 
			final String descrp) {
	    this.ordVal = ordVal;
	    this.descrp = descrp;
	}
}