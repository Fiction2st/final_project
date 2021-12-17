package com.hntrip.root.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hntrip.root.board.mapper.BoardMapper;
import com.hntrip.root.file.service.FileService;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardMapper bm;
	@Autowired 	FileService fs;
	
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
	public void searchCountry(String country, Model model) {
		System.out.println("여기는 B서비스");		
		model.addAttribute("filelist", fs.searchWriteNo(bm.searchCountry(country)));
		System.out.println(bm.searchCountry(country));
	}
}

