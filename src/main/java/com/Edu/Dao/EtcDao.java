package com.Edu.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Edu.Domain.Code;

public interface EtcDao extends JpaRepository<Code, Integer> {

	List<Code> findByGroup(String Group);
}
