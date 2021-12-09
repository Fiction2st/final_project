package com.hntrip.root.member.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hntrip.root.common.session.MemberSessionName;
import com.hntrip.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName{
	@Autowired MemberService ms;
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	@PostMapping("loginCheck")
	public String loginCheck(@RequestParam String id,
							@RequestParam String pwd,
							@RequestParam(required = false) String autoLogin,
							RedirectAttributes rs,
							Model model) {
		int result = 0;
		result = ms.loginCheck(id, pwd);
		if(result == 1) {
			rs.addAttribute("id",id);
			rs.addAttribute("autoLogin",autoLogin);
			return "redirect:successLogin";
		}else if(result == 2) {
			model.addAttribute("msg", "PASSWORD IS INCORRECT"); //비밀번호 오류
		}else if(result == 3) {
			model.addAttribute("msg", "THERE IS NO REGISTERED ID"); //ID 없음
		}else {
			model.addAttribute("msg", "SYSTEM ERROR SORRY"); //ID 없음
		}
		model.addAttribute("url","/root/member/login");
		return "/member/loginfailed";
	}
	@GetMapping("successLogin")
	public String successLogin(@RequestParam String id, 
								@RequestParam(required = false) String autoLogin,
								HttpSession session, HttpServletResponse response) {
		if(autoLogin!=null){		
			ms.autoLogin(session, response, id);
		}
		session.setAttribute(LOGIN, id);
		return "redirect:/index";
	}
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response,		
						@CookieValue(value="loginCookie", required = false) 
						Cookie loginCookie) {
		if(session.getAttribute(LOGIN)!=null) {
			ms.logout(loginCookie, session, response);	
		}
		response.addHeader(null, null);
		return "redirect:/index";
	}
	
	@GetMapping("kakaoLogin")
	public String kakaoLogin(String id,RedirectAttributes rs) {
		ms.kakaoLogin(id);
		rs.addAttribute("id",id);
		return "redirect:successLogin";
	}
}
