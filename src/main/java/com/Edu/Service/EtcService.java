package com.Edu.Service;

import java.util.List;

import com.Edu.Domain.Code;
public interface EtcService {
	public List<Code> findByGroup(String group);
}
