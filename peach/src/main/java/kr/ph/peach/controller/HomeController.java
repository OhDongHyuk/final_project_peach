package kr.ph.peach.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ph.peach.pagination.PageMaker;
import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.service.CategoryService;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.WishVO;

@Controller
public class HomeController {

	@Autowired
	CategoryService saleCategoryService;

	@Autowired
	SaleBoardService saleBoardService;

	@Autowired
	MemberService memberSerivce;

	@RequestMapping(value = "/")

	public String home(Model model, HttpSession session, SaleBoardCriteria cri) {
		List<SaleBoardVO> prList = saleBoardService.getSaleBoardList(cri);
		List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
		cri.setPerPageNum(8);
		// 현재 페이지에 맞는 게시글을 가져와야함
		List<SaleBoardVO> list = saleBoardService.getMainSaleBoardList(cri);
		int totalCount = saleBoardService.getTotalCount(cri);
		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user != null) {
			List<WishVO> wishList = memberSerivce.getWishList(user.getMe_num());
			System.out.println(wishList);
			model.addAttribute("wishList", wishList);
		}

		int displayPageNum = 8;
		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);
		
		model.addAttribute("pm", pm);
		model.addAttribute("list", list);
		model.addAttribute("prList", prList);
		model.addAttribute("categoryList", categoryList);

		return "/main/home";
	}

}
