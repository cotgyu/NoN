package com.Edu.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Edu.Dao.EtcDao;
import com.Edu.Domain.Code;

@Service
public class EtcServiceImpl implements EtcService { 
	@Autowired
	private EtcDao etcDao;

	@Override
	public List<Code> findByGroup(String group) {
		return etcDao.findByGroup(group); 
	}
}