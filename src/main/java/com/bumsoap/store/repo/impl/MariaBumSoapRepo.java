package com.bumsoap.store.repo.impl;

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
import com.bumsoap.store.repo.BumSoapRepo;
import com.bumsoap.store.types.Shape_w;
import com.bumsoap.store.types.Shapes;
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

	/**
	 * 범이비누 재고를 색상 형태(메주비누), 중량 형태(작은2개)에 따라 변경
	 * 값 만큼 더함.
	 * shape: 색상 형태
	 * shape_w: 중량 형태
	 * incBy: 재고 변경 값
	 * returns 변화된 레코드 개수
	 */
	@Override
	public int updateStock(Shapes shape, Shape_w shape_w, 
			int incBy) {
		var sql = new StringBuilder();
		
		sql.append("update soap_stock");
		sql.append(" set stock = stock + :incBy ");
		sql.append("where STOCK_SN in");
		sql.append(" (select ss.STOCK_SN");
		sql.append("  from soap_stock ss");
		sql.append("  join soap_price sp");
		sql.append("  on sp.price_sn = ss.PRICE_SN");
		sql.append("  and ss.SHAPE_W = :shape_w");
		sql.append("  and sp.SHAPE = :shape)");
		
		var params = new HashMap<String, Integer>();
		
		params.put("incBy", incBy); 
		params.put("shape_w", shape_w.getOrdVal()); 
		params.put("shape", shape.getOrdVal()); 

		return jdbcTemplate.update(sql.toString(), params);
	}

	private static final class BumSoapMapper 
		implements RowMapper<BumSoap> {

		@Override
		public BumSoap mapRow(ResultSet rs, int rowNum) 
				throws SQLException {
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















