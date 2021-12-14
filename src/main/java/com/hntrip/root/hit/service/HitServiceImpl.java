package com.hntrip.root.hit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hntrip.root.hit.dto.HitDTO;
import com.hntrip.root.hit.mapper.HitMapper;

@Service
public class HitServiceImpl implements HitService {
	@Autowired HitMapper hm;
	
	public void getMyHit(Model model, int writeNo) {
		//id 받아와서 처리
		List<HitDTO> list = hm.getMyHit(writeNo);
		if(list.size() != 0) {
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getId().equals("jjj")) {
					model.addAttribute("myHit", true);
					return;
				}
			}
		}
		model.addAttribute("myHit", false);
	}
	public void addMyHit(int writeNo) {
		HitDTO dto = new HitDTO();
		dto.setWriteNo(writeNo); dto.setId("jjj");
		hm.addMyHit(dto);
	}
	public void delMyHit(int writeNo) {
		HitDTO dto = new HitDTO();
		dto.setWriteNo(writeNo); dto.setId("jjj");
		hm.delMyHit(dto);
	}
}
