package com.kh.workman.collabo.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.workman.collabo.model.vo.CollaboList;


public interface CollaboService {

	int createList(HashMap<String, String> receiveMessage);

	CollaboList selectCollaboListOne(HashMap<String, String> rm);

	List<String> participation(int collaboNo);

}
