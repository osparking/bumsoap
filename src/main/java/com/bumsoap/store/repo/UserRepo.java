package com.bumsoap.store.repo;

import java.util.List;

import com.bumsoap.store.domain.User;

public interface UserRepo {
  List<User> getAllUsers();
}
