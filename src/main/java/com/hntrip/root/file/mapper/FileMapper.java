package com.hntrip.root.file.mapper;

import java.util.List;

import com.hntrip.root.file.dto.FileDTO;

public interface FileMapper {
	public void insert(List<FileDTO> file);
	public void delete(int writeNo);
	
}
