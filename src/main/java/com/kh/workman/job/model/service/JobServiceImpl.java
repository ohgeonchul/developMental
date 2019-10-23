package com.kh.workman.job.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.job.model.dao.JobDao;
import com.kh.workman.job.model.vo.JobBoard;

@Service
public class JobServiceImpl implements JobService {

  @Autowired
  JobDao dao;
  
  @Autowired
  SqlSessionTemplate session;

  @Override
  public List<Map<String, Object>> selectJobBoardList() {
    return dao.selectJobBoardList(session);
  }

  @Override
  public List<Map<String, Object>> selectPageJobBoardList(int cPage, int numPerPage) {
    return dao.selectPageJobBoardList(session, cPage, numPerPage);
  }

  @Override
  public int selectJobBoardCount() {
    return dao.selectJobBoardCount(session);
  }
  
  
  
  

}
