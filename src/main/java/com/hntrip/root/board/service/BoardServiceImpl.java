package com.hntrip.root.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hntrip.root.board.mapper.BoardMapper;
import com.hntrip.root.file.service.FileService;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired 	FileService fs;
	@Autowired BoardMapper mapper;
	@Override
	public void searchCountry(String country, Model model) {
		System.out.println("여기는 B서비스");		
		model.addAttribute("filelist", fs.searchWriteNo(mapper.searchCountry(country)));
		System.out.println(mapper.searchCountry(country));


	}
}

