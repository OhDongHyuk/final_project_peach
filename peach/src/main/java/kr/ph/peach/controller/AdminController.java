package kr.ph.peach.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kh.spring.util.Message;
import kr.ph.peach.pagination.MemberCriteria;
import kr.ph.peach.pagination.PageMaker;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.service.SaleCategoryService;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.StatementVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	SaleBoardService saleBoardService;
	
	@Autowired
	SaleCategoryService saleCategoryService;

	@GetMapping("/home")
	public String home() {

		return "/admin/home";
	}

	@GetMapping("/manager")
	public String manager(Model model, HttpSession session, MemberCriteria cri) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		cri.setPerPageNum(8);
		// 현재 페이지에 맞는 회원정보를 가져와야함
		List<MemberVO> mbList = memberService.getMemberList(cri);

		List<StatementVO> typeList = saleCategoryService.getMemberTypeList(user);
			
		
		int totalCount = memberService.getTotalCount(cri);
		
		int displayPageNum = 8;
		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);
		
		System.out.println(mbList);
		System.out.println(typeList);
		model.addAttribute("pm", pm);
		model.addAttribute("mbList", mbList);
		model.addAttribute("typeList", typeList);

		return "/admin/manager";
	}
	
	@PostMapping("/manager")
	public String manager(Model model, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(boardService.insertBoard(board, user, files2)) {
			msg = new Message("/board/list", "게시글을 등록했습니다.");
		}else {
			msg = new Message("/board/insert", "게시글을 등록하지 못했습니다.");
		}
		return "/admin/manager";
	}

	@GetMapping("/category")
	public String category() {

		return "/admin/category";
	}

	@GetMapping("/report")
	public String report() {

		return "/admin/report";
	}
}
