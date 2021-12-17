package com.hntrip.root.file.service;

import java.util.List;

import org.springframework.ui.Model;

import com.hntrip.root.hit.dto.HitDTO;

public interface FileService {
	public static final String IMAGE_REPO = "C:/spring/image_repo";
	public void getMyImg(Model model, int writeNo);
	public void hitMyImg(List<HitDTO> wirteNo, Model model);
}
