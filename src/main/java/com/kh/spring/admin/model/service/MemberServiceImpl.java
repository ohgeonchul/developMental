package com.kh.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.model.dao.MemberDao;
import com.kh.spring.admin.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Member> selectMemberList() {
		return dao.selectMemberList(session);
	}

	@Override
	public int statusUpdate(Map<String, Object> model) {
		return dao.statusUpdate(session, model);
	}

	@Override
	public int deleteMember(Map<String, Object> map) {
		return dao.deleteMember(session, map);
	}

	@Override
	public Map<String, String> memberView(String id) {
		return dao.memberView(session, id);
	}
	
	
	
	

	
	
	
	
	

	
}
