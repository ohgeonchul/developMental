package com.kh.workman.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member selectLogin(SqlSessionTemplate session, Member m) {
		
		return session.selectOne("member.selectLogin", m);
	}
	
	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		
		return session.insert("member.insertMember", m);
	}
	
	@Override
	public Member selectFindEmail(SqlSessionTemplate session, String toemail) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectFindEmail", toemail);
	}
	
	@Override
	public int updateMember(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberEmail", m);
	}
	
	@Override
	public int updateInfoMember(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.update("member.updateInfoMember", m);
	}
	
	@Override
	public int selectJobMyBoardCount(SqlSessionTemplate session, String nickname) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectJobMyBoardCount", nickname);
	}
	
	@Override
	public List<Map<String, Object>> selectPageJobMyBoardList(SqlSessionTemplate session, int cPage, int numPerPage, String nickname) {
	    RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
	    return session.selectList("member.selectPageJobMyBoardList", nickname, rows);
	}


}
