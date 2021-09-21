package com.bumsoap.store.domain.repo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bumsoap.store.domain.BumSoap;
import com.bumsoap.store.domain.repo.BumSoapRepo;
import com.bumsoap.store.types.Target;

@Repository
public class MariaBumSoapRepo implements BumSoapRepo {

	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Override
	public List<BumSoap> getBumSoaps() {
	    Map<String, Object> params = new HashMap<String, Object>();
	    List<BumSoap> result = jdbcTemplate.query(
	        "SELECT * FROM bumsoap", params, new BumSoapMapper());
	    return result;
	}

	private static final class BumSoapMapper 
		implements RowMapper<BumSoap> {

		@Override
		public BumSoap mapRow(ResultSet rs, int rowNum) throws SQLException {
			var bumSoap = new BumSoap();
			bumSoap.setBs_Name(rs.getString("bs_name"));
			bumSoap.setBSSN(rs.getInt("BSSN"));
			bumSoap.setIngridi_1(rs.getString("ingridi_1"));
			bumSoap.setFragrance(rs.getString("fragrance"));
			bumSoap.setTarget(Target.values()[rs.getInt("target")]);
			bumSoap.setDescrip(rs.getString("descrip"));
			bumSoap.setSpec_Func(rs.getString("spec_func"));
			bumSoap.setMall_Link(rs.getString("mall_link"));
			return bumSoap;
		}
		
	}
}
