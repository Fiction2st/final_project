package com.hntrip.root.board.mapper;

import java.util.List;

import com.hntrip.root.board.dto.BoardDTO;

public interface BoardMapper {
	// 목록
	public List<BoardDTO> getList();

	// 등록 (인덱스를 알 필요 없는 경우)
	public void insert(BoardDTO board);
	
	//상세보기
	public BoardDTO read(int writeno);
	
	// 삭제
	public int delete(int writeno);
	
	//수정
	public int update(BoardDTO board);
	
	public int getwriteNo(String id);
	
}
