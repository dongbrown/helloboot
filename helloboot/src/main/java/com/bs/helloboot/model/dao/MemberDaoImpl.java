package com.bs.helloboot.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bs.helloboot.model.dto.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public List<Member> selectMemberAll(SqlSession session) {
		return session.selectList("member.selectMemberAll");
	}

}
