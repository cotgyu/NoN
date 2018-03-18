
package com.Edu.Domain;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
 
@Alias("Board")
public @Data class Board {
	 
	private int boardId;
	private String title;
	private String content;
	private Date registerDate;
	private String registerId;
	
}
