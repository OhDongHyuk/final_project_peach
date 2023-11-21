package kr.ph.peach.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ph.peach.pagination.PageMaker;
import kr.ph.peach.pagination.PointHistoryCriteria;
import kr.ph.peach.service.PointHistoryService;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.PointHistoryVO;


@Controller
public class PointHistoryController {
	
	@Autowired
	PointHistoryService pointHistoryService;
	
	@RequestMapping(value = "/member/pointhistory")
	public String home(Model model,
			HttpSession session, PointHistoryCriteria cri) {
		MemberVO user = (MemberVO)session.getAttribute("user");	
		List<PointHistoryVO> phList = pointHistoryService.getPointHistoryList(cri, user);
		//전체 게시글 수 
		int totalCount = pointHistoryService.getTotalCount(cri, user);
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    for (PointHistoryVO pointHistory : phList) {
	        String formattedDate = dateFormat.format(pointHistory.getPh_date());
	        pointHistory.setFormattedPhDate(formattedDate);
	    }
		//페이지네이션에서 최대 페이지 개수 
		int displayPageNum = 20;
		PageMaker pm = new PageMaker(displayPageNum, cri, totalCount);
		model.addAttribute("pm", pm);
		model.addAttribute("phList",phList);
		model.addAttribute("user",user);
		return "/member/pointhistory";
	}
}
