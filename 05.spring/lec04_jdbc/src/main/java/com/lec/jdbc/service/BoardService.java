package com.lec.jdbc.service;

import java.util.List;

import com.lec.jdbc.vo.BoardVO;
import com.lec.jdbc.vo.PageInfo;

public interface BoardService {

	void insertBoard(BoardVO board);
	int deleteBoard(int seq);
	void updateBoard(BoardVO board);
	BoardVO selectBoard(int seq);
	List<BoardVO> getBoardList(int p, int perPage);
	PageInfo getPageInfo(int currentPage, int perPage);

}
