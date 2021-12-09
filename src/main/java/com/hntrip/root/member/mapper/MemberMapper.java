package com.hntrip.root.member.mapper;

<<<<<<< HEAD
import com.hntrip.root.member.dto.MemberDTO;

public interface MemberMapper {
	public int register(MemberDTO member);
	public MemberDTO chkId(String id);
}
=======
import java.util.Map;

import com.hntrip.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO getMember(String id);
	public void keepLogin(Map<String, Object> map); 
	public void kakaoLogin(String id);}
>>>>>>> nmrnkd
