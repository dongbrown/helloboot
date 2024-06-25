package com.bs.helloboot.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.bs.helloboot.model.dao.MemberDao;
import com.bs.helloboot.model.dto.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

	private final MemberDao dao;
	private final SqlSession session;
	
	@Override
	public List<Member> selectMemberAll() {
		return dao.selectMemberAll(session);
	}

}
