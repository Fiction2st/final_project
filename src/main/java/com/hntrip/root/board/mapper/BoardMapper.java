package com.hntrip.root.board.mapper;

import com.hntrip.root.board.dto.BoardDTO;

public interface BoardMapper {
	public BoardDTO getMyData(int writeNo);
	public void upHit(int writeNo);
	public void downHit(int writeNo);
	public BoardDTO nowHit(int writeNo);
}
