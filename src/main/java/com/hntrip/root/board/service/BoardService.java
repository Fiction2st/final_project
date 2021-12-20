package com.hntrip.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardService {
	public void registerSave(MultipartHttpServletRequest mul,
						HttpServletRequest request);
}
