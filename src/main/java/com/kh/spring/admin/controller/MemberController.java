package com.kh.spring.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.admin.model.service.MemberService;
import com.kh.spring.admin.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;

	@RequestMapping("/admin/member.do")
	public String member() {
		System.out.println("/admin/member 입니다.");
		return "admin/member";
	}

	@RequestMapping("/admin/selectMemberList.do")
	public String selectMemberList(Model model) {
		List<Member> list = service.selectMemberList();
		model.addAttribute("list", list);
		return "admin/memberList";
	}

//	@RequestMapping("/admin/statusUpdate")
//	public String statusUpdate(@RequestParam Map<String, String> map) {
//		
//		 
//		System.out.println("BEFORE : " + map.toString());
//		System.out.println(map.get("status"));
//
//		int status = Boolean.getBoolean(map.get("status")) ? 1 : 0;
//		map.put("status", String.valueOf(status));
//		System.out.println("AFTER : " + map.toString());
//
//		Map<String, Object> data = new HashMap<String, Object>();
//		data.put("status", status);
//		data.put("no", Integer.parseInt(map.get("no")));
//
//		int num = service.statusUpdate(data);
//		String msg = "";
//
//		if (num == 1) {
//			msg += "회원정보 수정 완료";
//		} else {
//			msg += "회원정보 수정 실패";
//		}
//		System.out.println(msg);
//		return "admin/memberList";
//	}

	@RequestMapping("/admin/statusUpdate")
	public String statusUpdate(@RequestParam int status, @RequestParam int no) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("status", status);
		map.put("no", no);

		String msg = "";
		int num = service.statusUpdate(map);
		if (num == 1) {
			msg += "회원정보 수정 완료";
		} else {
			msg += "회원정보 수정 실패";
		}
		System.out.println(msg);

		return "admin/selectMemberList.do";
	}

	@RequestMapping("/admin/memberDelete")
	public String memberDelete(@RequestParam String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		
		int num = service.deleteMember(map);
		
		String msg="";
		if(num==1) msg+="회원 삭제 완료";
		else msg+="회원 삭제 실패";
		
		return "";
	}
	
	@RequestMapping("/admin/memberView")
	public ModelAndView memberView(String id) {
		System.out.println(id);
		ModelAndView mv = new ModelAndView();
		Map<String, String> member = service.memberView(id);
		
		mv.addObject("member", member);
		mv.setViewName("admin/memberView");
		
		return mv;
		
	}

}
