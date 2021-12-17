package com.hntrip.root.board.service;

import java.util.List;

import org.springframework.ui.Model;

import com.hntrip.root.board.dto.BoardDTO;
import com.hntrip.root.board.dto.BoardDTO2;
import com.hntrip.root.file.dto.FileDTO;
import com.hntrip.root.file.dto.FileDTO2;

public interface BoardService {
	public void searchCountry(String country,Model model); 
}
