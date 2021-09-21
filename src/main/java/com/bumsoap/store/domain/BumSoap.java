package com.bumsoap.store.domain;

import java.io.Serializable;

import com.bumsoap.store.types.Target;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor
@EqualsAndHashCode
public class BumSoap implements Serializable{
	private static final long serialVersionUID = -2297070845238815421L;
	private int BSSN;
	private String bs_Name;
	private String ingridi_1;
	private String mall_Name;
	private String fragrance;
	private String descrip;
	private String spec_func;
	private Target target;
}
