package com.hntrip.root.board.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hntrip.root.board.service.BoardService;

@Controller
@RequestMapping("board")

public class BoardController {
	@Autowired BoardService bs;

	@PostMapping("/search")
	public String search(@RequestParam String country, Model model) {
		System.out.println(country);
		System.out.println("여기는 B컨트롤러");		
		if(country!=null) {
			bs.searchCountry(country, model);
			return "/board/search";
		}else {
			return "redirect:/index";
		}
	}
}
