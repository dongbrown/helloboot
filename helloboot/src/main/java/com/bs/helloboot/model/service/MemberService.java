package com.bs.helloboot.model.service;

import java.util.List;

import com.bs.helloboot.model.dto.Member;

public interface MemberService {

	List<Member> selectMemberAll();
}
