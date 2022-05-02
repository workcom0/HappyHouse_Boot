package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.service.NoticeService;
import com.ssafy.util.PageNavigation;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/register")
	public String mvregister() {
		return "notice/write";
	}
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam Map<String, String> map) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String spp = map.get("spp"); // size per page (페이지당 글갯수)
		map.put("spp", spp != null ? spp : "10");
		List<NoticeDto> list = noticeService.listNotice(map);
		PageNavigation pageNavigation = noticeService.makePageNavigation(map);
		mav.addObject("noticeList", list);
		mav.addObject("navigation", pageNavigation);
		mav.addObject("key", map.get("key"));
		mav.addObject("word", map.get("word"));
		mav.setViewName("notice/list");
		return mav;
	}
	
	@PostMapping("/write")
	@Transactional
	public String registerNotice(@RequestParam String subject, @RequestParam String content, RedirectAttributes redirectAttr, HttpSession session) throws SQLException {
		NoticeDto noticeDto = new NoticeDto();
		noticeDto.setSubject(subject);
		noticeDto.setContent(content);
		MemberDto user = (MemberDto) session.getAttribute("userInfo");
		noticeDto.setUserId(user.getId());
		noticeService.registerNotice(noticeDto);
		redirectAttr.addFlashAttribute("msg", "글을 작성했습니다.");
		return "redirect:/notice/list";
	}
	
	@GetMapping("get/{noticeNo}")
	public String getNotice(@PathVariable String noticeNo, Model model) throws NumberFormatException, SQLException {
		NoticeDto noticeDto = noticeService.getNotice(Integer.parseInt(noticeNo));
		model.addAttribute("notice", noticeDto);
		return "notice/detail";
	}
	
	@PostMapping("delete/{noticeNo}")
	public String delteNotice(@PathVariable int noticeNo, RedirectAttributes redirectAttr) throws NumberFormatException, SQLException {
		noticeService.deleteNotice((noticeNo));
		redirectAttr.addFlashAttribute("msg", "글을 삭제했습니다.");
		return "redirect:/notice/list";
	}
	
	@PostMapping("update/{noticeNo}")
	public String updateNotice(@PathVariable int noticeNo, @RequestParam String subject, @RequestParam String content, RedirectAttributes redirectAttr) throws SQLException {
		NoticeDto dto = new NoticeDto();
		dto.setArticleNo(noticeNo);
		dto.setSubject(subject);
		dto.setContent(content);
		System.out.println(dto);
		noticeService.updateNotice(dto);
		redirectAttr.addFlashAttribute("msg", "글을 수정했습니다.");
		return "redirect:/notice/get/" + noticeNo;
	}
}
