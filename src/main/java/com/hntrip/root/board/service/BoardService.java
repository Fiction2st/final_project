package com.hntrip.root.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hntrip.root.board.dto.BoardDTO;

public interface BoardService {
	//등록
	public void registerSave(MultipartHttpServletRequest mul,
						HttpServletRequest request);
	// 상세보기
		public BoardDTO get(int writeNo);
		
		// 수정
		public boolean modify(BoardDTO board);
	    // 리턴값이 boolean 이므로 T,F 성공여부로 반영됨
		
		// 삭제
		public boolean remove(int writeNo);
		
		// 목록
		public List<BoardDTO> getList();
	
}
