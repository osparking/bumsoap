package com.bumsoap.store.domain;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class User implements Serializable {
  private static final long serialVersionUID = -6129080127370056318L;
  private String username;
  private String email;
  private String password;
  private LocalDateTime create_time;

}
