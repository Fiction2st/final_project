package com.hntrip.root.member.service;

<<<<<<< HEAD
import com.hntrip.root.member.dto.MemberDTO;

public interface MemberService {
	public int register(MemberDTO member);
	public MemberDTO chkId(String id);
	public void sendMail(String to, String subject, String body);
=======
import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface MemberService {
	public int loginCheck(String id, String pwd);
	public void autoLogin(HttpSession session, HttpServletResponse response, String id);
	public void keepLogin(String session, Date limitDate, String id);
	public void kakaoLogin(String id);
	public void logout(Cookie loginCookie, HttpSession session, HttpServletResponse response);
>>>>>>> nmrnkd
}
