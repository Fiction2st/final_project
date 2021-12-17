package com.hntrip.root.file.mapper;

import java.util.List;

import com.hntrip.root.board.dto.BoardDTO;
import com.hntrip.root.file.dto.FileDTO;

public interface FileMapper {
	public List<FileDTO> getMyImg(int writeNo);
	public List<FileDTO> searchWriteNo(List<BoardDTO> WriteNoList);
}
