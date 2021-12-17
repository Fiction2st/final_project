package com.hntrip.root.file.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.hntrip.root.board.dto.BoardDTO;
import com.hntrip.root.board.dto.BoardDTO2;
import com.hntrip.root.file.dto.FileDTO;
import com.hntrip.root.file.dto.FileDTO2;

public interface FileMapper {
	public List<FileDTO> searchWriteNo(List<BoardDTO> WriteNoList);
}
