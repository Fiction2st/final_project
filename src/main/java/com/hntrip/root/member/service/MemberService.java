package com.hntrip.root.member.service;

import com.hntrip.root.member.dto.MemberDTO;

public interface MemberService {
	public int register(MemberDTO member);
	public MemberDTO chkId(String id);
	public void sendMail(String to, String subject, String body);
}
