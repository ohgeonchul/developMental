package com.kh.workman.collabo.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


public interface CollaboDao {

	int createList(SqlSessionTemplate session, Map receiveMessage);

}
