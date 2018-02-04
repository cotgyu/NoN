package com.Edu.Domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Entity
@Alias("code")
public @Data class Code {
	private String group;
	
	@Id
    @GeneratedValue
	private String code;	
	private String desc;
	private String ref01;
	private String ref02;
	private String ref03;
	private String ref04;
	private String ref05;
}
