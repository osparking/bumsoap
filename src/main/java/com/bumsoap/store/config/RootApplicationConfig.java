package com.bumsoap.store.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@ComponentScan("com.bumsoap.store")
public class RootApplicationConfig {
	@Bean
	public NamedParameterJdbcTemplate getJdbcTemplate() {
		return new NamedParameterJdbcTemplate(dataSource());
	}
	
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource ds = new DriverManagerDataSource();
		ds.setDriverClassName(org.mariadb.jdbc.Driver.class.getName());
		ds.setUrl("jdbc:mariadb://localhost:3306/bumsoap?useUnicode=true");
		ds.setUsername("bumee");
		ds.setPassword("1234");
		return ds;
	}
	
}
