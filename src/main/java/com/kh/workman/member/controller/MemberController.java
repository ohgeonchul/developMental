package com.kh.workman.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.workman.member.model.service.MemberService;
import com.kh.workman.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping("login.do")
	public String login(Member m, Model model, HttpSession session)
	{
		String msg = "";
		String loc = "/";
		
		Member loginMember = memberService.selectLogin(m);
		
		
		System.out.println(m.getId());
		System.out.println(m.getPw());
		
		if(m.getId().equals(loginMember.getId()) && m.getPw().equals(loginMember.getPw()))
		{
			msg = "로그인 성공";
			session.setAttribute("loginMember", loginMember);			
		}
		else
		{
			msg = "로그인 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session, Model model)
	{
		session.invalidate();
		String msg = "로그아웃 완료";
		String loc = "/";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}

}
