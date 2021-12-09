package com.hntrip.root.member.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hntrip.root.member.dto.MemberDTO;
import com.hntrip.root.member.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired private MemberMapper mapper;
	@Autowired JavaMailSender mailSender;
	BCryptPasswordEncoder encoder;
	
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
}
