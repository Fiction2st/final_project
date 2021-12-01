package com.hntrip.root.member.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hntrip.root.common.session.MemberSessionName;
import com.hntrip.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired MemberService ms;
	MemberSessionName msn;
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	@PostMapping("loginCheck")
	public String loginCheck(@RequestParam String id,
							@RequestParam String pwd,
							@RequestParam(required = false) String autoLogin,
							RedirectAttributes rs) {
		int result = 0;
		result = ms.loginCheck(id, pwd);
		if(result==1) {
			rs.addAttribute("id",id);
			rs.addAttribute("autoLogin",autoLogin);
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	@GetMapping("successLogin")
	public String successLogin(@RequestParam String id, 
								@RequestParam(required = false) String autoLogin,
								HttpSession session, HttpServletResponse response) {
		// service 쪽으로 넣어 보기.
		if(autoLogin!=null){		
			ms.autoLogin(session, response, id);
		}
		session.setAttribute(msn.LOGIN, id); //impl에서 돌리면 자동로그인 아닐 때 로그아웃 탭 안 뜸
		return "redirect:/index";
	}
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response,		
						@CookieValue(value="loginCookie", required = false) 
						Cookie loginCookie) {
		if(session.getAttribute(msn.LOGIN)!=null) {
			ms.logout(loginCookie, session, response);	
		}
		return "redirect:/index";
	}
	@GetMapping("kakaologin")
	public String kakaoLogin() {
		return "member/kakaologin";
	}
}
