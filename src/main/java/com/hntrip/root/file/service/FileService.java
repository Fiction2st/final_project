package com.hntrip.root.file.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
	public static final String IMAGE_REPO = "C:/spring/image_repo";
public List<String> saveFile(List<MultipartFile> fileList);
}
