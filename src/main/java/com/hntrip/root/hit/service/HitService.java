package com.hntrip.root.hit.service;

import org.springframework.ui.Model;

public interface HitService {
	public void getMyHit(Model model, int writeNo);
	public void addMyHit(int writeNo);
	public void delMyHit(int writeNo);
}
