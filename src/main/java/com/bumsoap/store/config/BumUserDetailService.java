package com.bumsoap.store.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bumsoap.store.domain.BumUser;
import com.bumsoap.store.repo.UserRepo;

@Service
public class BumUserDetailService implements UserDetailsService {

  @Autowired
  UserRepo userRepo;

  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
      final BumUser bumUser = userRepo.loadUserByUsername(username);
      if (bumUser == null) {
          throw new UsernameNotFoundException(username);
      }
      UserDetails user = User.withUsername(bumUser.getUserId())
                          .password(bumUser.getPassword())
                          .authorities("USER").build();
      return user;
  }	
	
}
