package com.bs.helloboot.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bs.helloboot.board.model.dto.Board;

public interface BoardDao {

	List<Board> selectBoardAll(SqlSession session);

}
