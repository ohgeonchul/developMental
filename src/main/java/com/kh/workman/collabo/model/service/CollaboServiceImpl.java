package com.kh.workman.collabo.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.collabo.model.dao.CollaboDao;
import com.kh.workman.collabo.model.vo.receiveMessage;

@Service
public class CollaboServiceImpl implements CollaboService {
	@Autowired
	CollaboDao dao;
	
	@Autowired
	SqlSessionTemplate session;


	@Override
	public int createList(Map receiveMessage) {
		return dao.createList(session,receiveMessage);
	}
}
