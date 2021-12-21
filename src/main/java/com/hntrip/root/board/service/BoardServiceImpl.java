package com.hntrip.root.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hntrip.root.board.mapper.BoardMapper;
import com.hntrip.root.file.mapper.FileMapper;
import com.hntrip.root.file.service.FileService;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardMapper bm;
	@Autowired FileService fs;
	@Autowired FileMapper fm;
	
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
	public void searchByCountry(String word, Model model) {		
		try {
			model.addAttribute("filelist", fs.searchWriteNo(bm.searchByCountry(word)));		
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	public void searchByCity(String word, Model model) {
		try {
			model.addAttribute("filelist", fs.searchWriteNo(bm.searchByCity(word)));	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void searchByTitle(String word, Model model) {
		try {
			model.addAttribute("filelist", fs.searchWriteNo(bm.searchByTitle(word)));	

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

