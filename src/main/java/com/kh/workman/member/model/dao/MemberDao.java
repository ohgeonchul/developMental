package com.kh.workman.member.model.dao;

import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.member.model.vo.Member;

public interface MemberDao {
	
	Member selectLogin(SqlSessionTemplate session, Member m);
	int insertMember(SqlSessionTemplate session, Member m);
	Member selectFindEmail(SqlSessionTemplate session, String toemail);
	int updateMember(SqlSessionTemplate session, Member m);
	int updateInfoMember(SqlSessionTemplate session, Member m);

	
	
	List<Map<String, Object>> selectPageJobMyBoardList(SqlSessionTemplate session, int cPage, int numPerPage, String nickname);
	List<Map<String, Object>> selectStudyMyBoardList(SqlSessionTemplate session, String nickname);
	
	int selectJobMyBoardCount(SqlSessionTemplate session, String nickname);
	int selectMyStudyBoardCount(SqlSessionTemplate session, String nickname);
	

	List<Member> selectAllMember(SqlSessionTemplate session);
	Member selectMemberNickname(SqlSessionTemplate session, Member m);

}
