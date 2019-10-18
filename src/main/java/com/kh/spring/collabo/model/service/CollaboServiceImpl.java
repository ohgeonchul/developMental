package com.kh.spring.collabo.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.collabo.model.dao.CollaboDao;

@Service
public class CollaboServiceImpl implements CollaboService {
	@Autowired
	CollaboDao dao;
	
	@Autowired
	SqlSessionTemplate session;
}
