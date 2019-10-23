package com.kh.workman.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.workman.admin.model.vo.AdminMember;

public interface AdminMemberDao {

	List<AdminMember> selectMemberList(SqlSessionTemplate session);

	int statusUpdate(SqlSessionTemplate session, Map<String, Object> model);

	int deleteMember(SqlSessionTemplate session, Map<String, Object> map);

	Map<String, String> memberView(SqlSessionTemplate session, String id);

}
