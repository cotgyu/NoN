
package com.Edu.Domain;

import javax.persistence.Entity;

import org.apache.ibatis.type.Alias;

@Entity
@Alias("Board")
public @Data class Board {
	private int boardId;
	
}
