package com.bs.helloboot.board.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.bs.helloboot.board.model.dao.BoardDao;
import com.bs.helloboot.board.model.dto.Board;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	private final BoardDao dao;
	private final SqlSession session;
	
	@Override
	public List<Board> selectBoardAll() {
		return dao.selectBoardAll(session);
	}

}
