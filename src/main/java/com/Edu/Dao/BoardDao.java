package com.Edu.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Edu.Domain.Code;

public interface BoardDao extends JpaRepository<Code, Integer> {

}
