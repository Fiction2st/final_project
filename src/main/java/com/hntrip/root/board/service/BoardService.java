package com.hntrip.root.board.service;

import org.springframework.ui.Model;

public interface BoardService {
	public void getMyData(Model model, int writeNo);
	public int upHit(int writeNo);
	public int downHit(int writeNo);
}
