package com.bumsoap.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bumsoap.store.domain.BumUser;
import com.bumsoap.store.repo.UserRepo;
import com.bumsoap.store.service.UserService;

@Service
public class UserServiceImpl implements UserService {
  @Autowired
  UserRepo userRepo;

  @Override
  public List<BumUser> getAllUsers() {
    return userRepo.getAllUsers();
  }

  @Override
  public void register(BumUser user) {
    userRepo.register(user);
  }
}
