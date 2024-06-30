package com.bs.helloboot.community.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.bs.helloboot.community.model.dao.CommunityDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityService {

	private final CommunityDao dao;
	private final SqlSession session;


}
