package com.lec.jdbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lec.jdbc.service.BoardService;
import com.lec.jdbc.vo.BoardVO;
import com.lec.jdbc.vo.PageInfo;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping("getBoardList.do")
	public String getBoardList(BoardVO boardVO, Model model,
			@RequestParam(defaultValue="1") int p,
			@RequestParam(defaultValue="10") int perPage) {

		PageInfo pageInfo = boardService.getPageInfo(p, perPage);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("boardList", boardService.getBoardList(p, perPage));
		return "board/board_list.jsp";
	}
	
	@RequestMapping(value="/selectBoard.do",  method=RequestMethod.GET)
	public String getBoard(@RequestParam int seq, Model model) {
		model.addAttribute("board", boardService.selectBoard(seq));
		return "board/board_select.jsp?seq=" + seq;
	}

	@RequestMapping("insertBoard.do")
	public String insertBoard(BoardVO board) {
		boardService.insertBoard(board);
		return "getBoardList.do";
	}

	@RequestMapping(value="/deleteBoard.do", method=RequestMethod.GET)
	public String deleteBoardView(@RequestParam int seq) {
		return "board/board_delete.jsp?seq=" + seq;
	}

	@RequestMapping(value="/deleteBoard.do", method=RequestMethod.POST)
	public String deleteUser(@RequestParam int seq) {
		boardService.deleteBoard(seq);
		return "getBoardList.do";
	}

	@RequestMapping(value="/updateBoard.do", method=RequestMethod.GET)
	public String updateBoard(Model model, @RequestParam int seq) {
		model.addAttribute("board",boardService.selectBoard(seq));
		return "board/board_update.jsp";
	}

	@RequestMapping(value="/updateBoard.do", method=RequestMethod.POST)
	public String updateUser(BoardVO board) {
		boardService.updateBoard(board);
		return "getBoardList.do";
	}
	
	
}
