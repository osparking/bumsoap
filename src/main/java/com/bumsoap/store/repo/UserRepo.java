package com.bumsoap.store.repo;

import java.util.List;

import com.bumsoap.store.domain.BumUser;

public interface UserRepo {
  List<BumUser> getAllUsers();
  void register(BumUser user);
	BumUser loadUserByUsername(String username);
}
