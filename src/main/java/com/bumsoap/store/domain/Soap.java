package com.bumsoap.store.domain;

import java.io.Serializable;
import java.util.List;

import com.bumsoap.store.types.Target;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor
@EqualsAndHashCode
public class Soap implements Serializable{
	private static final long serialVersionUID = -2297070845238815421L;
	private int bssn;
	private String bsName;
	private String ingridi1;
	private String fragrance;
	private String descrip;
	private String specFunc;
	private Target target;
	private String mallLink;
	private List<SoapPic> pics;
	private int thmIdx = 0; // thumb index
}
