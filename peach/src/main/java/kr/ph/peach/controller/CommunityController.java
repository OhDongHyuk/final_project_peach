package kr.ph.peach.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.pagination.Criteria;
import kr.ph.peach.pagination.CriteriaCom;
import kr.ph.peach.pagination.PageMakerCom;
import kr.ph.peach.service.CommunityService;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.MemberVO;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService communityService;
	
	@GetMapping("/board/community")
	public String Community(Model model, HttpSession session, CriteriaCom cri) {
		MemberVO user = (MemberVO) session.getAttribute("user");
	    model.addAttribute("user", user);
	    
	    List<CommunityVO> list = communityService.getBoardList(cri);
	    for(CommunityVO tmp : list) {
	    	list.get(list.indexOf(tmp)).setMe_nick(communityService.getMeNick(tmp));
	    }
	    model.addAttribute("list", list);
	    
	    int totalCount = communityService.getTotalCount(cri);
		//페이지네이션 페이지수
		final int DISPLAY_PAGE_NUM = 3;
		PageMakerCom cpm = new PageMakerCom(DISPLAY_PAGE_NUM, cri, totalCount);
	    
		model.addAttribute("title", "게시글 조회");
		model.addAttribute("cpm", cpm);
		
		return "/board/community";
	}

	@GetMapping("/board/communityInsert")
	public String CommunityInsert(Model model, HttpSession session) {
	    MemberVO user = (MemberVO) session.getAttribute("user");
	    model.addAttribute("user", user);
	    
	    //커뮤니티 카테고리 select 추가 - 옵션에 넣기 위해
	    List<CommunityCategoryVO> CCategory = communityService.selectCCategory();
	    List<String> CCNames = new ArrayList<>();

	    for (CommunityCategoryVO category : CCategory) {
	        CCNames.add(category.getCc_name());
	    }

	    model.addAttribute("CCNames", CCNames);
	    
	    if (user == null) {
	        return "redirect:/member/login";
	    }

	    return "/board/communityInsert";
	}
	//값을 넣지 않았을 때 오류 발생
	@PostMapping("/board/communityInsert")
	public String insertPost(Model model, CommunityVO community, HttpSession session, 
			MultipartFile [] fileList, @RequestParam("CICategory") String CICategory) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		System.out.println("CICategory"+CICategory);
		if("0".equals(CICategory)) {
			return "redirect:/board/communityInsert";
		}else {
			int cc_num = communityService.selectCIname(CICategory);
			System.out.println(cc_num);
			boolean res = communityService.insertCommunity(community, user, fileList,cc_num);
			
			
			System.out.println("CICategory" + CICategory);
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
	@GetMapping("/board/communityDetail/{co_num}")
    public String showProfilePage(@PathVariable("co_num") int co_num, Model model, HttpSession session) {
	    	MemberVO user = (MemberVO) session.getAttribute("user");
	    	model.addAttribute("user",user);
	    	
	    	CommunityVO Detail = communityService.selectDetail(co_num);
	    	model.addAttribute("Detail",Detail);
	    	
	    	MemberVO Writer = communityService.selectWriter(Detail);
	    	
	    	return "/board/communityDetail";
	}
}
