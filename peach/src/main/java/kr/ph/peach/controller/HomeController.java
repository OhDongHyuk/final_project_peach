package kr.ph.peach.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ph.peach.pagination.PageMaker;
import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.service.CategoryService;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.util.Message;
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

	/*
	 * 권한이 관리자가 아닌 회원이 /admin/* 으로 접근할시 경고메세지가 나오도록 출력
	 */
	@GetMapping("/main/message")
	public String message(Model model, HttpSession session, Message msg) {
		// MemberVO user = (MemberVO)request.getSession().getAttribute("user");

		Message message = (Message) session.getAttribute("msg");

		model.addAttribute("message", message);

		return "message";
	}

	@RequestMapping(value = "/")
	public String home(Model model, HttpSession session, SaleBoardCriteria cri) {
		List<SaleBoardVO> prList = saleBoardService.getSaleBoardList(cri);
		List<SaleCategoryVO> categoryList = saleCategoryService.getSaleCategoryList();
//		List<SaleBoardVO> dbBoardList = saleBoardService.selectAllBoard();
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
//		model.addAttribute("dbBoardList", dbBoardList);

		return "/main/home";
	}

}
