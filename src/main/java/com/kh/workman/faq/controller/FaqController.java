package com.kh.workman.faq.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.workman.admin.controller.AdminNoticeController;
import com.kh.workman.faq.model.service.FaqService;

@Controller
public class FaqController {
	private Logger logger=LoggerFactory.getLogger(AdminNoticeController.class);
	
	@Autowired
	FaqService service;
	
	@RequestMapping("/member/faqList")
	public String memberFaqList() {
		return "admin/faq/faqList";
	}
	
	@RequestMapping("/admin/faqList")
	public String adminFaqList() {
		return "admin/faq/adminFAQList";
	}
}
