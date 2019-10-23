package com.kh.workman.collabo.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.collabo.model.vo.CollaboList;

public interface CollaboDao {

	int createList(SqlSessionTemplate session, HashMap<String, String> receiveMessage);

	CollaboList selectCollaboListOne(SqlSessionTemplate session, HashMap<String, String> rm);

	List<String> participation(SqlSessionTemplate session, int collaboNo);

}
