package com.bumsoap.store.domain;

import com.bumsoap.store.types.Shapes;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class SoapPic {
	private int picSn;
	private int bssn;
	private short dpOrder;
	private String extName;
	private Shapes shape;
	
	@Getter(AccessLevel.NONE)
	private String fName;

	public String getFName() {
		var sb = new StringBuilder("i");
		
		sb.append(getBssn());
		sb.append("_");
		sb.append(getDpOrder());
		sb.append(".png");
		
		return sb.toString();
	}
}
