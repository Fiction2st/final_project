package com.hntrip.root.member.service;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hntrip.root.common.session.MemberSessionName;
import com.hntrip.root.member.dto.MemberDTO;
import com.hntrip.root.member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired MemberMapper mapper;
	MemberSessionName msn;
	BCryptPasswordEncoder encoder;
	public MemberServiceImpl() {
		encoder = new BCryptPasswordEncoder();
	}
	
	public int loginCheck(String id, String pwd) {
		MemberDTO dto = new MemberDTO();
		try {
			dto = mapper.getMember(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(dto!=null) {
				//조건문 encoder.matches(pwd, dto.getPwd())로 수정 
			if(encoder.matches(pwd, dto.getPwd())||pwd.equals(dto.getPwd())){
				return 1;
			}
		}
		return 0;
	}
	public void autoLogin(HttpSession session, HttpServletResponse response, String id) {
		
		int limitTime = 60*60*24*180; //180일
		Cookie loginCookie = new Cookie("loginCookie",session.getId());
		loginCookie.setMaxAge(limitTime);
		loginCookie.setPath("/"); //쿠키 범위 최상위
		response.addCookie(loginCookie);
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, 6); //6개월 후	
		Date limitDate = new Date(cal.getTimeInMillis());

		keepLogin(session.getId(), limitDate, id);
	
		System.out.println("id : "+ id);
		System.out.println("sessionId : "+ session.getId());
	}
	public void keepLogin(String sessionId, Date limitDate, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("id", id);
		mapper.keepLogin(map);

		System.out.println(map.get("sessionId"));
		System.out.println(map.get("limitDate"));
		System.out.println(map.get("id"));
	}
	public void logout(Cookie loginCookie, HttpSession session, HttpServletResponse response) {
		if(loginCookie!=null) {	
			loginCookie.setMaxAge(0);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
			keepLogin("null", new java.sql.Date(System.currentTimeMillis()),
					(String)session.getAttribute(msn.LOGIN));	
		}
		session.invalidate();
	}
}
