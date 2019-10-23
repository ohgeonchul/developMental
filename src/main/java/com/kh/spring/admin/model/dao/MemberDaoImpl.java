package com.kh.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.admin.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public List<Member> selectMemberList(SqlSessionTemplate session) {
		return session.selectList("member.selectMemberList");
	}

	@Override
	public int statusUpdate(SqlSessionTemplate session, Map<String, Object> model) {
		return session.update("member.statusUpdate", model);
	}

	@Override
	public int deleteMember(SqlSessionTemplate session, Map<String, Object> map) {
		return session.delete("member.deleteMember", map);
	}

	@Override
	public Map<String, String> memberView(SqlSessionTemplate session, String id) {
		return session.selectOne("member.selectMember", id);
	}
	
	
	
	


	
	
	
	
}
