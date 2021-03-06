package com.bumsoap.store.domain;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.bumsoap.store.types.UserRole;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class BumUser implements Serializable {
  private static final long serialVersionUID = -6129080127370056318L;
  private int sn;
  private String userId;
  private UserRole role;
  private String password;
  private String email;
  private LocalDateTime create_time;
  private boolean deleted;
  private LocalDateTime delete_time;
}
