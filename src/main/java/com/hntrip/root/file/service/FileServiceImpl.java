package com.hntrip.root.file.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hntrip.root.board.dto.BoardDTO;
import com.hntrip.root.board.dto.BoardDTO2;
import com.hntrip.root.file.dto.FileDTO;
import com.hntrip.root.file.dto.FileDTO2;
import com.hntrip.root.file.mapper.FileMapper;

@Service
public class FileServiceImpl implements FileService{
	@Autowired FileMapper mapper;
	
	public List<FileDTO> searchWriteNo(List<BoardDTO> WriteNoList) {
		return mapper.searchWriteNo(WriteNoList);		
	}	
}
