package com.bumsoap.store.repo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bumsoap.store.domain.User;
import com.bumsoap.store.repo.UserRepo;

@Repository
public class UserRepoMaria implements UserRepo {
  @Autowired
  private NamedParameterJdbcTemplate jdbcTemplate;
  
  @Override
  public List<User> getAllUsers() {
    String sql = "SELECT * FROM users";
    List<User> result = jdbcTemplate.query(sql, new UserMapper());
    return result;
  }
  
  private static final class UserMapper implements RowMapper<User> {
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
      User user = new User();
      
      user.setUsername(rs.getString("username"));
      user.setEmail(rs.getString("email"));
      user.setPassword(rs.getString("password"));
      Timestamp ts = rs.getTimestamp("create_time");
      
      user.setCreate_time(ts.toLocalDateTime());

      return user;
    }
  } 
}
