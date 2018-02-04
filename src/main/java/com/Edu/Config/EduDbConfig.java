package com.Edu.Config;

import javax.sql.DataSource;

import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
@EnableJpaRepositories(
		basePackages="com.Edu.Dao", 
entityManagerFactoryRef = "eduManagerFactory", 
transactionManagerRef = "eduManager")
public class EduDbConfig {
	@Bean(name="EduDataSource")
	@Primary
	@ConfigurationProperties(prefix = "spring.datasource")
	public DataSource eduDataSource() {
		return DataSourceBuilder.create().build();
	}

	@Primary
	@Bean(name = "eduManagerFactory")
	public LocalContainerEntityManagerFactoryBean eduManagerFactory(EntityManagerFactoryBuilder builder) {
		return builder.dataSource(eduDataSource()).packages("com.Edu.Domain").build();
	}

	@Primary
	@Bean(name = "eduManager")
	PlatformTransactionManager eduManager(EntityManagerFactoryBuilder builder) {
		return new JpaTransactionManager(eduManagerFactory(builder).getObject());
	}

}