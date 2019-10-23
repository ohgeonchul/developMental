package com.kh.workman.collabo.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.collabo.model.vo.CollaboList;

@Repository
public class CollaboDaoImpl implements CollaboDao {

	@Override
	public int createList(SqlSessionTemplate session, HashMap<String, String> receiveMessage) {
		return session.insert("collabo.createList", receiveMessage);
	}

	@Override
	public CollaboList selectCollaboListOne(SqlSessionTemplate session, HashMap<String, String> rm) {
		return session.selectOne("collabo.selectCollaboListOne", rm);
	}

	@Override
	public List<String> participation(SqlSessionTemplate session, int collaboNo) {
		return session.selectList("collabo.participation", collaboNo);
	}

}
