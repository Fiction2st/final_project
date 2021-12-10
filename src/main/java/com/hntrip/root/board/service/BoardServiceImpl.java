package com.hntrip.root.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hntrip.root.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardMapper bm;
	
	public void getMyData(Model model, int writeNo) {
		model.addAttribute("myData", bm.getMyData(writeNo));
	}
	public int upHit(int writeNo) {
		bm.upHit(writeNo);
		//System.out.println("hit : "+ bm.nowHit(writeNo).getHit());
		return bm.nowHit(writeNo).getHit();
	}
	public int downHit(int writeNo) {
		bm.downHit(writeNo);
		return bm.nowHit(writeNo).getHit();
	}
}
