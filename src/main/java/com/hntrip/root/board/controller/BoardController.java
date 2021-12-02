package com.hntrip.root.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hntrip.root.board.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired BoardService bs;
	
	@GetMapping("main")
	public String main() {
		return "board/main";
	}
	@GetMapping("mypage")
	public String mypage(Model model) {
		//글번호, 나중에 param으로 받기
		int writeNo = 41;
		bs.getMyData(model, writeNo);
		return "board/mypage";
	}
	@GetMapping("hit")
	@ResponseBody
	public String hit() {
		int writeNo = 41;
		return bs.upHit(writeNo);
	}
}
