package com.kh.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.admin.model.vo.Member;

public interface MemberDao {

	List<Member> selectMemberList(SqlSessionTemplate session);

	int statusUpdate(SqlSessionTemplate session, Map<String, Object> model);

	int deleteMember(SqlSessionTemplate session, Map<String, Object> map);

	Map<String, String> memberView(SqlSessionTemplate session, String id);

}
