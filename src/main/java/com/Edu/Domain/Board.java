
package com.Edu.Domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import org.apache.ibatis.type.Alias;
import org.springframework.data.annotation.Id;

import lombok.Data;

@Entity
@Alias("Board")
public @Data class Board {
	
	@Id
	@GeneratedValue
	private int boardId;
	
}
