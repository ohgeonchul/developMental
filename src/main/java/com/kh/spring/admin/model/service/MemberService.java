package com.kh.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.admin.model.vo.Member;

public interface MemberService {

	List<Member> selectMemberList();

	int statusUpdate(Map<String, Object> model);

	int deleteMember(Map<String, Object> map);

	Map<String, String> memberView(String id);
	
	
}
