package com.Edu.Domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Entity
@Alias("course")
public @Data class Course {
	
	@Id
    @GeneratedValue
	private int cosno;	
	private String cosname;
	private String cosintro;
	private String cosintrovideo;
	private String coscategory;
}
