package com.hntrip.root.member.service;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hntrip.root.common.session.MemberSessionName;
import com.hntrip.root.member.dto.MemberDTO;
import com.hntrip.root.member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired private MemberMapper mapper;
	@Autowired JavaMailSender mailSender;
	BCryptPasswordEncoder encoder;
	MemberSessionName msn;
	public MemberServiceImpl() {
		encoder = new BCryptPasswordEncoder();
	}
	@Override
	public int register(MemberDTO member) {
		String securePw = encoder.encode(member.getPwd());
		member.setPwd(securePw);
		try {
			return mapper.register(member);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}	
	}
	@Override
	public MemberDTO chkId(String id) {
		System.out.println("전달된 id값 : " + id);
		return mapper.chkId(id);
	}
	@Override
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(body, true);
			
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
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
			return 2; // 비번 오류
		}
		return 3; // id 없음
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
	public void keepLogin(String session, Date limitDate, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", session);
		map.put("limitDate", limitDate);
		map.put("id", id);
		mapper.keepLogin(map);

	}
	public void kakaoLogin(String id) {
		MemberDTO dto =	mapper.getMember(id);
		if(dto == null) {
			mapper.kakaoLogin(id);
		}
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
