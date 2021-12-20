package com.hntrip.root.hit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hntrip.root.file.service.FileService;
import com.hntrip.root.hit.service.HitService;

@Controller
@RequestMapping("board")
public class HitController {
	@Autowired HitService hs;
	@Autowired FileService fs;
	
	@GetMapping("likes")
	public String likes(Model model) {
		//현재 로그인 아이디 받아오기
		fs.hitMyImg(hs.allMyHit("jjj"), model);
		return "board/likes";
	}
}
