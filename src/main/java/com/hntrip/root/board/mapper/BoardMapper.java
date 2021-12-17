package com.hntrip.root.board.mapper;

import java.util.ArrayList;
import java.util.List;

import com.hntrip.root.board.dto.BoardDTO;
import com.hntrip.root.board.dto.BoardDTO2;


public interface BoardMapper {
	public List<BoardDTO> searchCountry(String country);	
}
