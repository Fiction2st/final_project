package com.hntrip.root.member.mapper;

import java.util.Map;

import com.hntrip.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO getMember(String id);
	public void keepLogin(Map<String, Object> map); 
	public void kakaoLogin(String id);}
