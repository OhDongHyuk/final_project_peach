package kr.ph.peach.controller;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.service.CommunityService;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.MemberVO;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService communityService;
	
	@GetMapping("/board/community")
	public String Community(Model model, HttpSession session) {
		
		return "/board/community";
	}

	@GetMapping("/board/communityInsert")
	public String CommunityInsert(Model model, HttpSession session) {
	    MemberVO user = (MemberVO) session.getAttribute("user");
	    model.addAttribute("user", user);
	    
	    //커뮤니티 카테고리 select 추가 - 옵션에 넣기 위해
	    CommunityCategoryVO CCategory = communityService.selectCCategory(user);
	    
	    if (user == null) {
	        return "redirect:/member/login";
	    }

	    return "/board/communityInsert";
	}
	
	@PostMapping("/board/communityInsert")
	public String insertPost(Model model, CommunityVO community, HttpSession session, 
			MultipartFile [] fileList) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = communityService.insertCommunity(community, user, fileList);
		if(res) {
			model.addAttribute("msg", "게시글 등록 성공!");
			model.addAttribute("url", "/board/community");
		}else {
			model.addAttribute("msg", "게시글 등록 실패!");
			model.addAttribute("url", "/board/communityInsert");
		}
		return "/main/message";
	}
	
}
