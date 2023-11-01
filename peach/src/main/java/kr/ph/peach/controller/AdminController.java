package kr.ph.peach.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ph.peach.pagination.MemberCriteria;
import kr.ph.peach.pagination.PageMaker;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.service.SaleCategoryService;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleCategoryVO;
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

		List<StatementVO> StateTypeList = saleCategoryService.getMemberTypeList(user);
			
		
		int totalCount = memberService.getTotalCount(cri);
		
		int displayPageNum = 8;
		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);
	
		System.out.println(cri);
		model.addAttribute("pm", pm);
		model.addAttribute("mbList", mbList);
		model.addAttribute("StateTypeList", StateTypeList);

		return "/admin/manager";
	}
	
	@PostMapping("/manager")
	public String manager(Model model, HttpSession session, int me_st_num, int me_num) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		memberService.updateState(me_num, me_st_num);
		
		System.out.println(user);
		
		model.addAttribute("user",user);
		return "redirect:/admin/manager";
		
	}

	@GetMapping("/salecategory")
	public String saleBoardCategory(Model model) {
		
		List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
		System.out.println(categoryList);
		model.addAttribute("categoryList", categoryList);

		return "/admin/salecategory";
	}

	
	@GetMapping("/comunitycategory")
	public String comunityCategory() {

		return "/admin/comunitycategory";
	}
	

	@GetMapping("/report")
	public String report() {

		return "/admin/report";
	}
}
