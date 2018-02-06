package com.Edu.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Edu.Domain.Board;

public interface BoardDao extends JpaRepository<Board, Integer> {
 
 
	
}
