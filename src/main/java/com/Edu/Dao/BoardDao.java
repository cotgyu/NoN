package com.Edu.Dao;

import org.springframework.stereotype.Repository;

import com.Edu.Domain.Board;

@Repository
public interface BoardDao  { 
	
	void create(Board board);

	void save(Board board);

	Board findOne(int boardId);

	void delete(int boardId);
}
