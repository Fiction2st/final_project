package com.hntrip.root.file.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hntrip.root.file.mapper.FileMapper;
import com.hntrip.root.hit.dto.HitDTO;

@Service
public class FileServiceImpl implements FileService {
	@Autowired FileMapper fm;
	
	public void getMyImg(Model model, int writeNo) {
		model.addAttribute("myImg", fm.getMyImg(writeNo));
	}
	public void hitMyImg(List<HitDTO> wirteNo, Model model) {
		model.addAttribute("hitList", fm.hitMyImg(wirteNo));
	}
}
