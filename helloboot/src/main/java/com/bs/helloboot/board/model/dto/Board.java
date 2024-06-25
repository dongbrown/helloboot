package com.bs.helloboot.board.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String writer;
	private String boardContent;
	private String originalFilename;
	private String renamedFilename;
	private Date boardDate;
	private int boardReadCount;

}
