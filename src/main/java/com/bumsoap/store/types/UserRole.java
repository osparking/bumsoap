package com.bumsoap.store.types;

import lombok.Getter;

@Getter
public enum UserRole {
	ROOT(0, "관리관"),
	ADMIN(1, "근무자"),
	USER(2, "사용자");
	
	private final int ordVal;
	private final String descrp;
	private UserRole(final Integer ordVal, 
			final String descrp) {
	    this.ordVal = ordVal;
	    this.descrp = descrp;
	}
}
