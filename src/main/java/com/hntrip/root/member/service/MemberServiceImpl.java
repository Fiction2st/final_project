package com.hntrip.root.member.service;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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
	
	 public String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }


	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 에러 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }


	    public HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }


	    public String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);
	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();
	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }
	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }
		@Override
		public int naverLogin(MemberDTO dto) {
			MemberDTO chkDTO = mapper.getMember(dto.getId());
			if(chkDTO == null) {
				return mapper.naverLogin(dto);
			}else {
				return 0;	// 기존에 네이버로 로그인 및 회원가입 완료한 경우 mapper 처리 하지 않음
			}
			
		}
}
