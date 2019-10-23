package com.kh.workman.job.model.service;

import java.util.List;
import java.util.Map;

public interface JobService {
  List<Map<String, Object>> selectJobBoardList();

  List<Map<String, Object>> selectPageJobBoardList(int cPage, int numPerPage);

  int selectJobBoardCount();
}
