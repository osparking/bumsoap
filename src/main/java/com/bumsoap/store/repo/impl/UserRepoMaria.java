package com.bumsoap.store.repo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bumsoap.store.domain.BumUser;
import com.bumsoap.store.repo.UserRepo;
import com.bumsoap.store.types.UserRole;

@Repository
public class UserRepoMaria implements UserRepo {
  @Autowired
  private NamedParameterJdbcTemplate jdbcTemplate;
  
  @Override
  public List<BumUser> getAllUsers() {
    String sql = "SELECT * FROM users";
    List<BumUser> result = jdbcTemplate.query(sql, new UserMapper());
    return result;
  }
  
  private static final class UserMapper implements RowMapper<BumUser> {
    public BumUser mapRow(ResultSet rs, int rowNum) throws SQLException {
      BumUser user = new BumUser();
      
      user.setSn(rs.getInt("sn"));
      user.setUserId(rs.getString("userid"));
      
      int roleIdx = rs.getInt("role");      
      user.setRole(UserRole.values()[roleIdx]);
      
      user.setPassword(rs.getString("password"));
      user.setEmail(rs.getString("email"));
      
      Timestamp ts = rs.getTimestamp("create_time");
      user.setCreate_time(ts.toLocalDateTime());
      
      boolean deleted = rs.getBoolean("deleted");
      user.setDeleted(deleted);
      
      if (deleted) {
        ts = rs.getTimestamp("delete_time");
        user.setCreate_time(ts.toLocalDateTime());
      }

      return user;
    }
  }

  @Override
  public void register(BumUser user) {
    var sql = new StringBuilder("INSERT INTO users");
    sql.append(" (userId, `role`, password, email, delete_time)");
    sql.append(" VALUES(:userId, :role, :password, :email, null)");
    
    var params = new HashMap<String, Object>();
    params.put("userId", user.getUserId());
    params.put("role", user.getRole().getOrdVal());
    params.put("password", user.getPassword());
    params.put("email", user.getEmail());
 
    jdbcTemplate.update(sql.toString(), params);
  }

	@Override
	public BumUser loadUserByUsername(String username) {
		var sql = "select * from users";
		var params = new HashMap<String, Object>();
		
		return jdbcTemplate.queryForObject(sql, params, 
				new UserMapper());
	} 
}













