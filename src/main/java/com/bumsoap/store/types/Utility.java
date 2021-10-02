package com.bumsoap.store.types;

import java.util.ArrayList;
import java.util.List;

public class Utility {
	public static List<String> getRoles(UserRole role) {
    var roles = new ArrayList<String>();
    
    switch (role) {
    case ROOT: 
      roles.add("ROLE_ROOT");
    case ADMIN: 
      roles.add("ROLE_ADMIN");
    default:
      roles.add("ROLE_USER");
    }
		return roles;
	}
}
