package com.bs.helloboot.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.helloboot.board.model.dto.Board;
import com.bs.helloboot.board.model.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/board")
public class BoardController {

	private final BoardService service;
	
	@GetMapping("/boardlist.do")
	public String getBoards(Model m){
		List<Board> boards = service.selectBoardAll(); 
		m.addAttribute("boards", boards);
		return "/board/boardlist";
	}
}
