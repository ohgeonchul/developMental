package com.kh.workman.collabo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.workman.collabo.model.service.CollaboService;

@Controller
public class CollaboController {

	@Autowired
	CollaboService service;

	@RequestMapping("/collabo/main.do")
	public ModelAndView connectCollaboMain(ModelAndView mv) {
		mv.setViewName("collabo/main");
		return mv;
	}

}
