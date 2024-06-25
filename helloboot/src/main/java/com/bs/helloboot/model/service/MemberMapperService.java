package com.bs.helloboot.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bs.helloboot.common.mappers.MemberMapper;
import com.bs.helloboot.model.dto.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberMapperService {

	private final MemberMapper memberMapper;

	public List<Member> selectMemberAll(){
		return memberMapper.selectMemberAll();
	}
}
