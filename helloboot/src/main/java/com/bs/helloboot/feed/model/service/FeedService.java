package com.bs.helloboot.feed.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.bs.helloboot.feed.model.dao.FeedDao;
import com.bs.helloboot.feed.model.dto.Feed;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class FeedService {

	private final FeedDao dao;
	private final SqlSession session;

	public List<Feed> getFeeds(int page, int size) {
		return dao.getFeeds(session, page, size);
	}


}
