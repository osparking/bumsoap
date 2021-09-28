package com.bumsoap.store.service;

import java.util.List;

import com.bumsoap.store.domain.BumUser;

public interface UserService {
  List<BumUser> getAllUsers();
  void register(BumUser user);
}
