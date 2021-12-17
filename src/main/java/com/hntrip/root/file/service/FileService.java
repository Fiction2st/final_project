package com.hntrip.root.file.service;

import java.util.List;

import org.springframework.ui.Model;

import com.hntrip.root.board.dto.BoardDTO;
import com.hntrip.root.file.dto.FileDTO;

public interface FileService {
	public static final String IMAGE_REPO = "C:/spring/image_repo";
	public void getMyImg(Model model, int writeNo);
	public List<FileDTO> searchWriteNo(List<BoardDTO> WriteNoList);
}
