package kr.ph.peach.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ph.peach.pagination.PageMaker;
import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.WishVO;


@Controller
@RequestMapping("/saleboard")
public class SaleBoardController {
	
	@Autowired
	SaleBoardService saleBoardService;
	
	@GetMapping("/{sc_num}")
	public String productsList(@PathVariable("sc_num") int categoryId, Model model, HttpSession session, SaleBoardCriteria cri) {
		List<SaleBoardVO> prList = saleBoardService.getSaleBoardList(cri);
		for(SaleBoardVO tmp : prList) {
			prList.get(prList.indexOf(tmp)).setSb_me_nickname(saleBoardService.selectMemberNickname(tmp.getSb_me_num()));
		}
		cri.setSc_num(categoryId);
		//전체 게시글 수 
		int totalCount = saleBoardService.getTotalCount(cri);
		//페이지네이션에서 최대 페이지 개수 
		int displayPageNum = 20;
		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);
		System.out.println(prList);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("pm", pm);
		model.addAttribute("prList",prList);
		return "/saleboard/saleBoard";
	}
	
	@GetMapping("/insert")
	public String insert(Model model, HttpSession session) {
		List<SaleCategoryVO> dbCategory = saleBoardService.selectAllCategory();
		model.addAttribute("dbCategory", dbCategory);
		MemberVO user = (MemberVO)session.getAttribute("user");
		Message msg;
		if(user == null) {
			msg = new Message("saleboard/list", "로그인이 필요합니다.");
			model.addAttribute("msg", msg);
			return "message";
		}
		
		return "/saleboard/insert";
	}
	@PostMapping("/insert")
	public String insertPost(Model model, SaleBoardVO saleBoard, HttpSession session) {
		Message msg;
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(saleBoardService.insertBoard(saleBoard, user)) {
			msg = new Message("salesboard/list", "게시물이 등록되었습니다.");
		} else {
			msg = new Message("salesboard/insert", "게시물 등록에 실패했습니다.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		List<SaleBoardVO> dbBoardList = saleBoardService.selectAllBoard();
		for(SaleBoardVO tmp : dbBoardList) {
			dbBoardList.get(dbBoardList.indexOf(tmp)).setSb_me_nickname(saleBoardService.selectMemberNickname(tmp.getSb_me_num()));
		}
		model.addAttribute("dbBoardList", dbBoardList);
		return "/saleboard/list";
	}
	@GetMapping("/detail")
	public String detail(Model model, Integer sb_num, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		SaleBoardVO board = saleBoardService.selectBoard(sb_num);
		board.setSb_me_nickname(saleBoardService.selectMemberNickname(board.getSb_me_num()));
		board.setSb_sc_name(saleBoardService.selectCategoryName(board.getSb_sc_num()));
		board.setSb_me_sugar(saleBoardService.selectMemberSugar(board.getSb_me_num()));
		if(user != null && board != null) {
			WishVO dbWish = saleBoardService.selectWish(user.getMe_num(), board.getSb_num());			
			int wishCheck = 0;
			if(dbWish == null) {
				wishCheck = 0;
			} else {
				wishCheck = 1;
			}
			model.addAttribute("wishCheck", wishCheck);
		}
		model.addAttribute("board", board);
		model.addAttribute("user", user);
		return "/saleboard/detail";
		
	}
	
	@GetMapping("/update")
	public String update(Model model, HttpSession session, Integer sb_num) {
		List<SaleCategoryVO> dbCategory = saleBoardService.selectAllCategory();
		model.addAttribute("dbCategory", dbCategory);
		SaleBoardVO board = saleBoardService.selectBoard(sb_num);
		board.setSb_sc_name(saleBoardService.selectCategoryName(board.getSb_sc_num()));
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null || board == null || user.getMe_num() != board.getSb_me_num()) {
			Message msg = new Message("/saleboard/list", "잘못된 접근입니다.");
			model.addAttribute("msg", msg);
			return "message";
		}
		model.addAttribute("board", board);
		
		return "/saleboard/update";
	}
	@PostMapping("/update")
	public String updatePost(Model model, HttpSession session, SaleBoardVO board) {
		Message msg;
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(saleBoardService.updateBoard(board, user)) {
			msg = new Message("/saleboard/detail?sb_num="+board.getSb_num(), "수정되었습니다.");
		}else {
			msg = new Message("/saleboard/update?sb_num="+board.getSb_num(), "수정을 실패하였습니다."); 
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	@GetMapping("/delete")
	public String delete(Integer sb_num, HttpSession session, Model model) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		Message msg;
		if(saleBoardService.deleteBoard(sb_num, user)) {
			msg = new Message("saleboard/list", "삭제되었습니다.");
		} else {
			msg = new Message("saleboard/list", "잘못된 접근입니다.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
	@ResponseBody
	@PostMapping("/wish")
	public Map<String, Object> ajaxTest(@RequestBody WishVO wish){
		Map<String, Object> map = new HashMap<String, Object>();
		WishVO dbWish = saleBoardService.selectWish(wish.getWi_me_num(), wish.getWi_sb_num());
		int isWish = 0;
		if(dbWish == null) {
			saleBoardService.insertWish(wish);
			isWish = 1;
		} else {
			saleBoardService.deleteWish(wish);
			isWish = 0;
		}
		SaleBoardVO board = saleBoardService.selectBoard(wish.getWi_sb_num());
		map.put("isWish", isWish);
		map.put("board", board);
		return map;
	}
}
