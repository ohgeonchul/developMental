package com.kh.workman.collabo.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.collabo.model.dao.CollaboDao;
import com.kh.workman.collabo.model.vo.CollaboList;

@Service
public class CollaboServiceImpl implements CollaboService {
	@Autowired
	CollaboDao dao;

	@Autowired
	SqlSessionTemplate session;

	@Override
	public int createList(HashMap<String, String> receiveMessage) {
		return dao.createList(session, receiveMessage);
	}

	@Override
	public CollaboList selectCollaboListOne(HashMap<String, String> rm) {
		return dao.selectCollaboListOne(session, rm);
	}

	@Override
	public List<String> participation(int collaboNo) {
		return dao.participation(session, collaboNo);
	}
}
