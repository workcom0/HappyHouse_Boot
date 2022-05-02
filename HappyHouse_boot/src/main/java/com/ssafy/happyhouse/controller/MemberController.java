package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

	@GetMapping("/login")
	public String mvlogin() {
		return "user/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam String id, @RequestParam String pw,Model model, HttpSession session) throws Exception {
		MemberDto dto = service.login(id);
		
		if(dto!=null && dto.getPw().equals(pw)) {
			session.setAttribute("userInfo", dto);
			return "index";
		}else {
			model.addAttribute("msg", "아이디와 비밀번호를 확인해 주세요");
			return "user/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@GetMapping("/join")
	public String join() {
		return "user/join";
	}
	
	@PostMapping("/join")
	public String registerMember(MemberDto memberDto, RedirectAttributes redirectAttr) throws Exception {
		service.registerMember(memberDto);
		redirectAttr.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
		return "redirect:/login";
	}
	
	@GetMapping("/mypage")
	public String mypage(){
		return "user/mypage";
	}
	
	@PostMapping("/deleteMember")
	public String deleteMember(@RequestParam String id, HttpSession session, Model model) throws Exception {
		service.deleteMember(id);
		session.invalidate();
		model.addAttribute("msg", "회원탈퇴가 완료되었습니다.");
		return "index";
	}
	
	@PostMapping("/updateMember")
	public String updateMember(MemberDto memberDto, HttpSession session, Model model) throws Exception {
		service.updateMember(memberDto);
		session.setAttribute("userInfo", memberDto);
		model.addAttribute("msg", "회원정보가 수정되었습니다.");
		return "user/mypage";
	}
	
	@PostMapping("/findPassWord")
	public String findPassWord(@RequestParam("fid") String id, @RequestParam("femail") String email, RedirectAttributes redirectAttr) throws Exception{
		MemberDto dto = new MemberDto();
		dto.setId(id);
		dto.setEmail(email);
		
		MemberDto m = service.findPassWord(dto);
		System.out.println(m);
		if(m==null) {
			redirectAttr.addFlashAttribute("msg", "일치하는 회원정보가 존재하지 않습니다.");
		}else {
			redirectAttr.addFlashAttribute("msg", "비밀번호는 [" + m.getPw() +"] 입니다.");
		}
		
		return "redirect:/login";
	}
}
