package com.bs.helloboot.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bs.helloboot.model.dto.Member;
import com.bs.helloboot.model.service.MemberMapperService;
import com.bs.helloboot.model.service.MemberService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api")
public class HelloBootController {

	private final MemberService service;
	private final MemberMapperService mapperService;
	
	@GetMapping("/member")
	public List<Member> getMembers(){
		return service.selectMemberAll();
	}
	
	@GetMapping("/mapper/member")
	public List<Member> getMapperMember(){
		return mapperService.selectMemberAll();
	}
	 
	
}
