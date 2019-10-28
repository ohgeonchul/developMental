package com.kh.workman.member.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.member.model.service.MemberService;
import com.kh.workman.member.model.vo.Member;

@Controller
public class MailController {
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private MemberService service;
	
	@RequestMapping("/member/mailSending.do")
	public ModelAndView mailSending(HttpServletRequest request)
	{
		
		String tomail = "dbsduthd123@naver.com";
		String title = "잊어 버린 비밀 번호";
		Member m = service.selectFindEmail(tomail);
		String content ="";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom("yeosong92@gmail.com"); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText("<a href='http://localhost:9090/member/signUp.do'>링크클릭</a>");// 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
				
		
		ModelAndView mv = new ModelAndView();
		
		String msg ="메일을 보냇습니다. 확인하세요 ";
		String loc ="/";
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv; 
	}
}
