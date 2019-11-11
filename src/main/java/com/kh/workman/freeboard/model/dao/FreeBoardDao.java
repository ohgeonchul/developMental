package com.kh.workman.freeboard.model.dao;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import com.kh.workman.freeboard.model.vo.Attachment;

public interface FreeBoardDao {

	int selectBoardCount(SqlSessionTemplate session);
	List<Map<String,String>> selectBoardList(SqlSessionTemplate session, int cPage, int numPerPage);
	
	int insertBoard(SqlSessionTemplate session, Map<String,String> param);
	int insertAttachment(SqlSessionTemplate session, Attachment att);
	
	Map<String, String> selectBoard(SqlSessionTemplate session, int boardNo);
	List<Attachment> selectAttachList(SqlSessionTemplate session, int boardNo);
	
}