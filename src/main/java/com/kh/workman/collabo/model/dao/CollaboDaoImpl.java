package com.kh.workman.collabo.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class CollaboDaoImpl implements CollaboDao {

	@Override
	public int createList(SqlSessionTemplate session, Map receiveMessage) {
		return session.insert("collabo.createList", receiveMessage);
	}

}
