package com.kh.workman.job.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface JobDao {

  List<Map<String, Object>> selectJobBoardList(SqlSessionTemplate session);

  List<Map<String, Object>> selectPageJobBoardList(SqlSessionTemplate session, int cPage, int numPerPage);
  
  int selectJobBoardCount(SqlSessionTemplate session);

}
