package com.bumsoap.store.types;

import java.util.ArrayList;
import java.util.List;

public class Utility {
	public static List<String> getRoles(UserRole role) {
    var roles = new ArrayList<String>();
    
    switch (role) {
    case ROOT: 
      roles.add("ROOT");
    case ADMIN: 
      roles.add("ADMIN");
    default:
      roles.add("USER");
    }
		return roles;
	}
}
