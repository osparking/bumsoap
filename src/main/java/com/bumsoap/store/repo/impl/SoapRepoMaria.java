package com.bumsoap.store.repo.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
import com.bumsoap.store.domain.SoapPic;
import com.bumsoap.store.domain.SoapStock;
import com.bumsoap.store.repo.SoapRepo;
import com.bumsoap.store.types.IncType;
import com.bumsoap.store.types.Shape_w;
import com.bumsoap.store.types.Shapes;
import com.bumsoap.store.types.Target;

@Repository
public class SoapRepoMaria implements SoapRepo {

	@Autowired
	private NamedParameterJdbcTemplate jdbcTemplate;

	@Override
	public List<Soap> getSoaps(String root) {
    Map<String, Object> params = 
    		new HashMap<String, Object>();
    List<Soap> result = jdbcTemplate.query(
    		"SELECT * FROM soap", params, 
    		new SoapMapper(root));
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
		
		sql.append("update soap_weight");
		if (soapStock.getIncType() == IncType.Absolute) {
			sql.append(" set stock = :stockAmt ");
		} else {
			sql.append(" set stock = stock + :stockAmt ");
		}
		sql.append("where STOCK_SN in");
		sql.append(" (select ss.STOCK_SN");
		sql.append("  from soap_weight ss");
		sql.append("  join soap_shape sp");
		sql.append("  on sp.price_sn = ss.PRICE_SN");
		sql.append("  and ss.SHAPE_W = :shape_w");
		sql.append("  and sp.SHAPE = :shape)");
		
		var params = new HashMap<String, Integer>();
		
		params.put("stockAmt", soapStock.getStock()); 
		params.put("shape_w", soapStock.getShape_w().getOrdVal()); 
		params.put("shape", soapStock.getShape().getOrdVal()); 

		return jdbcTemplate.update(sql.toString(), params);
	}

	private final class SoapMapper implements RowMapper<Soap> {
		String root;
		SoapMapper(String root) {
			this.root = root;
		}

		@Override
		public Soap mapRow(ResultSet rs, int rowNum) 
				throws SQLException {
			var soap = new Soap();
			soap.setBsName(rs.getString("bs_name"));
			
			int bssn = rs.getInt("BSSN");
			soap.setBssn(bssn);
			soap.setIngridi1(rs.getString("ingridi_1"));
			soap.setFragrance(rs.getString("fragrance"));
			soap.setTarget(Target.values()[rs.getInt("target")]);
			soap.setDescrip(rs.getString("descrip"));
			soap.setSpecFunc(rs.getString("spec_func"));
			soap.setMallLink(rs.getString("mall_link"));
			soap.setPics(getPics(bssn, root));
			
			return soap;
		}
	}

	private List<SoapPic> getPics(int bssn, String root) {
		var sql = "SELECT * FROM soap_pic sp where BSSN = :bssn";
		var params = new HashMap<String, Integer>();
		params.put("bssn", bssn); 
		var result = jdbcTemplate.query(sql, params, 
				new RowMapper<SoapPic>() {

			@Override
			public SoapPic mapRow(ResultSet rs, int rowNum) 
					throws SQLException {
				var soapPic = new SoapPic();
				
				soapPic.setPicSn(rs.getInt("PIC_SN"));
				soapPic.setBssn(rs.getInt("BSSN"));
				soapPic.setDpOrder((short)rs.getInt("DP_ORDER"));
				soapPic.setExtName(rs.getString("EXT_NAME"));
				int idx = rs.getInt("SHAPE");
				soapPic.setShape(Shapes.values()[idx]);
				
				var blob = rs.getBlob("PICTURE");
				if (blob != null && root != null) {
					writeBytesToFile(root, 
							blob.getBinaryStream(), 
							soapPic);
				}
				
				return soapPic;
			}

			private void writeBytesToFile(String root, 
					InputStream in, SoapPic soapPic) {
				String dirPath = root + "resources\\images\\"; 
				
				File directory = new File(dirPath);
				if (! directory.exists()) {
					directory.mkdirs();
				}
				StringBuilder fPath = new StringBuilder(dirPath);
				fPath.append(soapPic.getFName());

				FileOutputStream out;
				
				try {
					out = new FileOutputStream(fPath.toString());
					byte [] buff = new byte[4096];
					int len = 0;
					while ((len = in.read(buff)) != -1) {
						out.write(buff, 0, len);
					}
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		});
		return result;
	}
	
	@Override
	public List<SoapStock> getSoapStocks() {
		var sql = new StringBuilder();
		sql.append("select ss.SHAPE_W, sp.SHAPE");
		sql.append(", sp.price, ss.stock ");
		sql.append("from soap_weight ss");
		sql.append(" join soap_shape sp");
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

  @Override
  public void updateSoap(Soap soap) {
    var sql = new StringBuilder("UPDATE soap ");
    sql.append("SET bs_name=:bs_name,");
    sql.append(" ingridi_1=:ingridi_1,");
    sql.append(" fragrance=:fragrance, descrip=:descrip,");
    sql.append(" spec_func=:spec_func, target=:target,");
    sql.append(" mall_link=:mall_link ");
    sql.append("WHERE BSSN=:BSSN");

    var params = new HashMap<String, Object>();
    
    params.put("bs_name", soap.getBsName()); 
    params.put("ingridi_1", soap.getIngridi1()); 
    params.put("fragrance", soap.getFragrance()); 
    params.put("descrip", soap.getDescrip()); 
    params.put("spec_func", soap.getSpecFunc()); 
    params.put("target", soap.getTarget().getOrdVal()); 
    params.put("mall_link", soap.getMallLink()); 
    params.put("BSSN", soap.getBssn()); 

    jdbcTemplate.update(sql.toString(), params);
  }	
}






