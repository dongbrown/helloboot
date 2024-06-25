package com.bs.helloboot.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bs.helloboot.model.dto.Member;

public interface MemberDao {
	
	List<Member> selectMemberAll(SqlSession session);

}
