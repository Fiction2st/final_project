package com.hntrip.root.board.service;

import org.springframework.ui.Model;


public interface BoardService {
	public void searchByCountry(String word,Model model); 
	public void searchByCity(String word, Model model);
	public void searchByTitle(String word, Model model);
	public void getMyData(Model model, int writeNo);
	public int upHit(int writeNo);
	public int downHit(int writeNo);
}
