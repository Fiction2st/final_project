package com.hntrip.root.file.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hntrip.root.file.mapper.FileMapper;

@Service
public class FileServiceImpl implements FileService {
	@Autowired FileMapper fm;
	
	public void getMyImg(Model model, int writeNo) {
		model.addAttribute("myImg", fm.getMyImg(writeNo));
	}
}
