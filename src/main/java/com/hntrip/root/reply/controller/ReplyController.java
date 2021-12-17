package com.hntrip.root.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hntrip.root.reply.dto.ReplyDTO;
import com.hntrip.root.reply.service.ReplyService;

@RestController
@RequestMapping("board")
public class ReplyController {
	@Autowired ReplyService rs;
	
	@GetMapping(value="replyData", produces="application/json;charset=utf-8")
	public List<ReplyDTO> replyData() {
		//글번호, 나중에 param으로 받기
		int writeNo = 41;
		return rs.replyData(writeNo);
	}
	@PostMapping(value="replyAdd", produces = "application/json; charset=utf-8")
	public boolean replyAdd(@RequestBody ReplyDTO dto) {
		int result = rs.replyAdd(dto);
		if(result == 1) {
			return true;
		}else {
			return false;
		}
	}
}
