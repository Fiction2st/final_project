package com.hntrip.root.board.mapper;

import java.util.ArrayList;
import java.util.List;

import com.hntrip.root.board.dto.BoardDTO;


public interface BoardMapper {
	public List<BoardDTO> searchCountry(String country);	
	public BoardDTO getMyData(int writeNo);
	public void upHit(int writeNo);
	public void downHit(int writeNo);
	public BoardDTO nowHit(int writeNo);
}
