package com.hntrip.root.board.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hntrip.root.board.service.BoardService;

@Controller

@RequestMapping("board")
public class BoardController {
	@Autowired
	BoardService bs;

	@GetMapping("register")
	public String register() {
		return "/board/register";
	}

	@PostMapping("registerSave")
	public String registerSave(MultipartHttpServletRequest mul,
			HttpServletRequest request) {
		bs.registerSave(mul, request);
		
		return "redirect:/board/register";
	}

}
