package com.hntrip.root.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.hntrip.root.member.dto.MemberDTO;

@Controller
public class KakaoController {
	@RequestMapping(value = "/kakaoLogin" , produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code") String code , HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
	  JsonNode token = KakaoLogin.getAccessToken(code);

	  JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());

	  System.out.println(profile);
	  MemberDTO dto = KakaoLogin.changeData(profile);
	  dto.setId("k"+dto.getId());

	  System.out.println(session);
	  session.setAttribute("loginUser", dto);
	  System.out.println(dto.toString());
 
	  return "/index";
	}
 }