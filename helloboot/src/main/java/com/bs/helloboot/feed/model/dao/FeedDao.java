package com.bs.helloboot.feed.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bs.helloboot.feed.model.dto.Feed;

@Repository
public class FeedDao {

    public List<Feed> getFeeds(SqlSession session, int page, int size) {
        int offset = (page - 1) * size;
        RowBounds rowBounds = new RowBounds(offset, size);
        return session.selectList("feed.getFeeds", null, rowBounds);
    }
}