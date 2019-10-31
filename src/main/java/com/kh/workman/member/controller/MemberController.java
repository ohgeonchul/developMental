package com.kh.workman.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.DelegatingPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.Pbkdf2PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.security.crypto.scrypt.SCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.common.RSAImpl;
import com.kh.workman.member.model.service.MemberService;
import com.kh.workman.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	@Autowired
	RSAImpl rsaImpl;

	@RequestMapping("/member/login.do")
	public ModelAndView login(Member m, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		
		String msg = "";
		String loc = "/";
				
		Member loginMember = service.selectLogin(m);
	
		System.out.println(m.getId());
		System.out.println(m.getPw());
		System.out.println(m.getId().equals(loginMember.getId()));
		System.out.println(pwEncoder.matches(m.getPw(), loginMember.getPw()));
		try
		{
			loginMember.setPw(rsaImpl.decrypt(loginMember.getPw()));	
			System.out.println(m.getPw());
			System.out.println(loginMember.getPw());
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//if(m.getId().equals(loginMember.getId()) && pwEncoder.matches(m.getPw(), loginMember.getPw()))
		if(m.getPw() == loginMember.getPw())
		{
			msg = "로그인 성공";
			session.setAttribute("loginMember", loginMember);			
		}
		else
		{
			msg = "로그인 실패";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	@RequestMapping("/member/logout.do")
	public String logout(Model model,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		String msg = "로그아웃 완료";
		String loc = "/";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/signUp.do")
	public String signUp()
	{
		return "member/signUpView";
	}
	
	@RequestMapping("/member/mainPage.do")
	public String mainPage()
	{
		return "redirect:/";
	}
	
	@RequestMapping("/member/register.do")
	public ModelAndView register(Member m, Model model)
	{
		try
		{
			m.setPw(rsaImpl.encrypt(m.getPw()));			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		//m.setPw(pwEncoder.encode(m.getPw()));
		int result = service.insertMember(m);
				
		String msg = "";
		String loc = "/";
		
		ModelAndView mv = new ModelAndView();
		
		if(result > 0)
		{
			msg = "가입완료";
		}else
		{
			msg = "가입실패";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/member/setting.do")
	public ModelAndView setting(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String msg = "";
		String loc = "/";
		
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("loginMember") == null)
		{
			msg = "로그인 후 이용 가능";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			
		}else
		{
			mv.setViewName("member/myPage");
		}
		
		return mv;
	}

}
