package com.hntrip.root.hit.service;

import java.util.List;

import org.springframework.ui.Model;

import com.hntrip.root.hit.dto.HitDTO;

public interface HitService {
	public void getMyHit(Model model, int writeNo);
	public void addMyHit(int writeNo);
	public void delMyHit(int writeNo);
	public List<HitDTO> allMyHit(String id);
}
