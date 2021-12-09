package com.hntrip.root.member.mapper;

import com.hntrip.root.member.dto.MemberDTO;

public interface MemberMapper {
	public int register(MemberDTO member);
	public MemberDTO chkId(String id);
}
