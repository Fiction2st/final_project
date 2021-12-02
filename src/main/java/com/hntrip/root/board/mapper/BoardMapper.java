package com.hntrip.root.board.mapper;

import com.hntrip.root.board.dto.BoardDTO;

public interface BoardMapper {
	public BoardDTO getMyData(int writeNo);
	public String upHit(int writeNo);
}
