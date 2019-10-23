package com.kh.workman.collabo.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.collabo.model.vo.CollaboList;

@Repository
public class CollaboDaoImpl implements CollaboDao {

	@Override
	public int createList(SqlSessionTemplate session, HashMap<String, Object> receiveMessage) {
		return session.insert("collabo.createList", receiveMessage);
	}

	@Override
	public HashMap<String, Object> selectCollaboListOne(SqlSessionTemplate session, int target) {
		return session.selectOne("collabo.selectCollaboListOne", target);
	}

	@Override
	public List<HashMap> participation(SqlSessionTemplate session, int collaboNo) {
		return session.selectList("collabo.participation", collaboNo);
	}

}
