package com.kh.workman.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.workman.admin.model.dao.AdminMemberDao;
import com.kh.workman.admin.model.vo.AdminMember;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	private AdminMemberDao dao;
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<AdminMember> selectMemberList() {
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
