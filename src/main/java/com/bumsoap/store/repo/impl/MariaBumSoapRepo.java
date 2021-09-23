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

import com.bumsoap.store.domain.Ingredient;
import com.bumsoap.store.domain.Soap;
import com.bumsoap.store.domain.SoapStock;
import com.bumsoap.store.repo.BumSoapRepo;
import com.bumsoap.store.types.IncType;
import com.bumsoap.store.types.Shape_w;
import com.bumsoap.store.types.Shapes;
import com.bumsoap.store.types.Target;

@Repository
public class MariaBumSoapRepo implements BumSoapRepo {

	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Override
	public List<Soap> getBumSoaps() {
	    Map<String, Object> params = new HashMap<String, Object>();
	    List<Soap> result = jdbcTemplate.query(
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
	public int updateStock(SoapStock soapStock) {
		var sql = new StringBuilder();
		
		sql.append("update soap_stock");
		if (soapStock.getIncType() == IncType.Absolute) {
			sql.append(" set stock = :stockAmt ");
		} else {
			sql.append(" set stock = stock + :stockAmt ");
		}
		sql.append("where STOCK_SN in");
		sql.append(" (select ss.STOCK_SN");
		sql.append("  from soap_stock ss");
		sql.append("  join soap_price sp");
		sql.append("  on sp.price_sn = ss.PRICE_SN");
		sql.append("  and ss.SHAPE_W = :shape_w");
		sql.append("  and sp.SHAPE = :shape)");
		
		var params = new HashMap<String, Integer>();
		
		params.put("stockAmt", soapStock.getStock()); 
		params.put("shape_w", soapStock.getShape_w().getOrdVal()); 
		params.put("shape", soapStock.getShape().getOrdVal()); 

		return jdbcTemplate.update(sql.toString(), params);
	}

	private static final class BumSoapMapper 
		implements RowMapper<Soap> {

		@Override
		public Soap mapRow(ResultSet rs, int rowNum) 
				throws SQLException {
			var bumSoap = new Soap();
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

	@Override
	public List<SoapStock> getSoapStocks() {
		var sql = new StringBuilder();
		sql.append("select ss.SHAPE_W, sp.SHAPE");
		sql.append(", sp.price, ss.stock ");
		sql.append("from soap_stock ss");
		sql.append(" join soap_price sp");
		sql.append(" on sp.Price_SN = ss.PRICE_SN ");
		sql.append("order by ss.SHAPE_W, sp.SHAPE;");
		
	    var params = new HashMap<String, Object>();
	    var result = jdbcTemplate.query(sql.toString(), 
	    		params, new SoapStockMapper());
	    return result;
	}
	
	private static final class SoapStockMapper 
			implements RowMapper<SoapStock> {

		@Override
		public SoapStock mapRow(ResultSet rs, int rowNum) 
				throws SQLException {
			
			var bumSoap = new SoapStock();
			
			int ord = rs.getInt("SHAPE_W");
			bumSoap.setShape_w(Shape_w.values()[ord]);
			
			ord = rs.getInt("SHAPE");
			bumSoap.setShape(Shapes.values()[ord]);
			
			bumSoap.setPrice(rs.getDouble("price"));
			bumSoap.setStock(rs.getInt("stock"));
			
			return bumSoap;
		}
	}

	@Override
	public List<Ingredient> getIngredients() {
		var sql = new StringBuilder();
		sql.append("select * from ingredients i ");
		sql.append("where i.BSSN = :BSSN");
		
	    var params = new HashMap<String, Object>();
	    params.put("BSSN", 1);
	    
	    var result = jdbcTemplate.query(sql.toString(), 
	    		params, new IngredientMapper());
	    return result;
	}
	
	private static final class IngredientMapper 
	implements RowMapper<Ingredient> {

	@Override
	public Ingredient mapRow(ResultSet rs, int rowNum) 
			throws SQLException {
		
		var ingredent = new Ingredient();
		
		ingredent.setEffects(rs.getString("effects"));
		ingredent.setIng_Name(rs.getString("ing_name"));
		ingredent.setIng_SN(rs.getInt("Ing_SN"));
		ingredent.setPercent(rs.getFloat("percent"));
		ingredent.setWeight(rs.getFloat("weight"));
		
		return ingredent;
	}
}	
}
