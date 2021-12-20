package com.hntrip.root.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hntrip.root.board.service.BoardService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hntrip.root.file.service.FileService;
import com.hntrip.root.hit.service.HitService;

@Controller
@RequestMapping("board")

public class BoardController {
	@Autowired BoardService bs;
	@Autowired FileService fs;
	@Autowired HitService hs;

	@GetMapping("main")
	public String main() {
		return "board/main";
	}
	@GetMapping("mypage")
	public String mypage(Model model,@RequestParam int writeNo) {
		//글번호, 나중에 param으로 받기
		bs.getMyData(model, writeNo);
		fs.getMyImg(model, writeNo);
		hs.getMyHit(model, writeNo);
		return "board/mypage";
	}
	@GetMapping("upHit")
	@ResponseBody
	public String upHit(@RequestParam int writeNo) {
		System.out.println("Hit");
		//아이디는 후에 받기
		hs.addMyHit(writeNo);
		return bs.upHit(writeNo)+"";
	}
	@GetMapping("downHit")
	@ResponseBody
	public String downHit(@RequestParam int writeNo) {
		System.out.println("downHit");
		hs.delMyHit(writeNo);
		return bs.downHit(writeNo)+"";

	}
	@PostMapping("/search")
	public String search(@RequestParam String key, @RequestParam String word, Model model
//			@RequestParam(required = false, defaultValue= "1") int num
			) {
		if(word!=null) {
			if(key.equals("country")) {
				bs.searchByCountry(word, model);
			}
			else if(key.equals("city")) {
				bs.searchByCity(word, model);
			}
			else if(key.equals("hit")) {
				bs.searchByTitle(word, model);
			}
			return "board/search";
		}else {
			return "redirect:/index";
		}
	}
}