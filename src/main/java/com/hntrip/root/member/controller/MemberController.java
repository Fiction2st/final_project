package com.hntrip.root.member.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.hntrip.root.member.dto.MemberDTO;
import com.hntrip.root.member.service.MemberService;
import com.hntrip.root.common.session.MemberSessionName;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName{
	@Autowired MemberService ms;
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	@RequestMapping("/register_form")
	public String register_form() {
		return "member/register";
	}
	
	@RequestMapping("/register")
	public String register(MemberDTO member){
		int result = ms.register(member);
		if(result==1)
			return "redirect:/index";
		return "redirect:register_form";
	}
	
	@GetMapping(value="chkId", produces="application/json; charset=utf-8")
	@ResponseBody
	public MemberDTO chkId(@RequestParam String id) {
		System.out.println("id값 : " + id);
		return ms.chkId(id);
	}
	
	@ResponseBody
	@PostMapping(value="sendMail", produces="application/json; charset=utf-8")
	public MemberDTO sendMail(HttpServletResponse response,
							@RequestBody MemberDTO dto) throws IOException {
		System.out.println("입력된 이메일 주소 : " + dto.getEmail());
		System.out.println("입력된 랜덤코드값 : " + dto.getCode());
		String email_addr = dto.getEmail();
		String auth_code = dto.getCode();
		
		StringBuffer sb = new StringBuffer();
		sb.append("<div style=\"background-image : url('https://d1blyo8czty997.cloudfront.net/review-photos/97199/2128/800x800/1527300111.jpg');\r\n"
				+ "				height : 500px; width : 500px; text-align: center\">");
		sb.append("<p style=\"font-size:18px; color:white; padding-top: 180px\">");
		sb.append("여행자를 위한 다이어리 HNTrip 이메일 인증코드 입니다.</p>");
		sb.append("<p style=\"font-size:22px; color:white;\">");
		sb.append("인증코드 : " + auth_code + "</p>");
		sb.append("<p style=\"font-size:18px; color:white;\">");
		sb.append("회원가입 페이지에 입력해주세요. </p>");
		sb.append("</div>");
		
		String str = sb.toString();
				
		ms.sendMail(email_addr,"[회원가입] HNTrip 이메일 인증코드 메일입니다.", str);
		
		response.setContentType("text/html; charset=utf-8");
//		PrintWriter out = response.getWriter();
//		out.print("메일을 전송하였습니다");
		return dto;
	}
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
