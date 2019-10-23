package com.kh.workman.collabo.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.workman.collabo.model.vo.CollaboList;

public interface CollaboService {

	int createList(HashMap<String, Object> rm);

	HashMap<String, Object> selectCollaboListOne(int target);

	List<HashMap> participation(int collaboNo);

}
