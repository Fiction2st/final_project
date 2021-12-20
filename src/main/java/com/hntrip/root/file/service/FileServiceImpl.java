package com.hntrip.root.file.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hntrip.root.file.dto.FileDTO;

@Service
public class FileServiceImpl implements FileService{

	@Override
	public List<String> saveFile(List<MultipartFile> fileList) {
		int cnt = 0;
		List<String> FileList = new ArrayList<String>();
		for(MultipartFile mf : fileList) {
			String sysFilename = cnt+mf.getOriginalFilename(); //파일리스트내의 파일들의 파일순서, 파일 명을 설정한다
			cnt++;
			File saveFile = new File(IMAGE_REPO+"/"+sysFilename); //파일경로랑 파일 이름과 합쳐진다
		try {
			mf.transferTo(saveFile); //파일경로 저장
		} catch (Exception e) {
			e.printStackTrace();
		}
		FileList.add(sysFilename);
		}
		return FileList;
		
		
		
		
		
	}

}
