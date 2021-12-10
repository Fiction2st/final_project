package com.hntrip.root.file.service;

import org.springframework.ui.Model;

public interface FileService {
	public static final String IMAGE_REPO = "C:/spring/image_repo";
	public void getMyImg(Model model, int writeNo);
}
