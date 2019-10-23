package com.kh.workman.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.workman.admin.model.vo.AdminMember;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {

	@Override
	public List<AdminMember> selectMemberList(SqlSessionTemplate session) {
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
