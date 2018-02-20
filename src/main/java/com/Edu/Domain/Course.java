package com.Edu.Domain;


import org.apache.ibatis.type.Alias;

import lombok.Data;


@Alias("course")
public @Data class Course {
	
	
	private int cosno;	
	private String cosname;
	private String cosintro;
	private String cosintrovideo;
	private String coscategory;
}
