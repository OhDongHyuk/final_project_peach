package kr.ph.peach.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.pagination.Criteria;
import kr.ph.peach.pagination.CriteriaCom;
import kr.ph.peach.pagination.PageMakerCom;
import kr.ph.peach.service.CommunityService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityImageVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ReplyVO;

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
		
		List<CommunityCategoryVO> co_category = communityService.getCoCategory();
		model.addAttribute("co_category", co_category);
		
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

	@PostMapping("/board/communityInsert")
	public String insertPost(Model model, CommunityVO community, HttpSession session, 
			MultipartFile [] fileList, @RequestParam("CICategory") String CICategory) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		
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
	    	
	    	communityService.updateCoView(co_num);
	    	
	    	CommunityVO detail = communityService.selectDetail(co_num);
	    	model.addAttribute("detail",detail);
	    	
	    	MemberVO writer = communityService.selectWriter(detail);
	    	model.addAttribute("writer",writer);
	    	
	    	List<ReplyVO> reply = communityService.selectReply(co_num);
	    	
	    	// 댓글 작성자의 닉네임을 가져와서 ReplyVO에 설정
	    	List<ReplyVO> replyList = new ArrayList<>();
	        for (ReplyVO re : reply) {
	            String replyWriter = communityService.getReNick(re);
	            re.setReplyWriter(replyWriter);
	            replyList.add(re);
	        }
	        model.addAttribute("reList", replyList);

	        CommunityImageVO coImage = communityService.getCoImg(co_num);
	        model.addAttribute("coImage", coImage);
  
	        
	     // 댓글 수 업데이트 
	        communityService.updateReply(co_num);
	        
	    	return "/board/communityDetail";
	}
	@PostMapping("/board/communityDetail")
	public String insertPost(Model model, HttpSession session, @RequestParam("re_info")String re_info,  @RequestParam("co_num") int co_num, @RequestParam("coNum") int coNum) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		Message msg;
		
		if(re_info.isEmpty()) {
			return "redirect:/board/communityDetail/" + co_num;
		}
		if (user == null) {
        	msg = new Message("/member/login", "로그인을 필요로 합니다.");
        	model.addAttribute("msg", msg);
        	return "message";
        } else {
        	
        	communityService.insertReply(re_info, co_num, user);
        	
        	msg = new Message("/board/communityDetail/"+co_num, "댓글 입력 완료.");
        	model.addAttribute("msg", msg);
    		return "message";
        }
	}
	@GetMapping("/board/communityEdit/{co_num}")
	public String CommunityEdit(@PathVariable("co_num") int co_num, Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
	    model.addAttribute("user", user);
		
	    CommunityVO detail = communityService.selectDetail(co_num);
    	model.addAttribute("detail",detail);
    	System.out.println("detail"+detail);
    	
    	CommunityCategoryVO EditCategory = communityService.selectEditCC(detail);
    	model.addAttribute("EditCategory",EditCategory);
    	
    	List<CommunityCategoryVO> CCategory = communityService.selectCCategory();
	    List<String> CCNames = new ArrayList<>();

	    for (CommunityCategoryVO category : CCategory) {
	        CCNames.add(category.getCc_name());
	    }

	    model.addAttribute("CCNames", CCNames);
	    
	    if (user == null) {
	        return "redirect:/member/login";
	    }
    	
		return "/board/communityEdit";
	}
	
	@PostMapping("/board/communityEdit/{co_num}")
	public String updatePost(@PathVariable("co_num") int co_num, Model model,@ModelAttribute("community") CommunityVO community, HttpSession session, 
			MultipartFile [] fileList, @RequestParam("CICategory") String CICategory) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		System.out.println("co_num"+co_num);
		if("0".equals(CICategory)) {
			return "redirect:/board/communityEdit";
		}else {
			int cc_num = communityService.selectCIname(CICategory);
			boolean res = communityService.updateCommunity(community, co_num, fileList,cc_num ,user);
			
			if(res) {
				model.addAttribute("msg", "게시글 수정 성공!");
				model.addAttribute("url", "/board/community");
			}else {
				model.addAttribute("msg", "게시글 수정 실패!");
				model.addAttribute("url", "/board/community");
			}
			return "/main/message";
		}
	}
	@PostMapping("/board/communityDetail/{coNum}")
	@ResponseBody
	public void likeCommunity(@PathVariable("coNum") int coNum, HttpSession session) {
			MemberVO user = (MemberVO)session.getAttribute("user");
			System.out.println(user);
			if (user == null) {
		        return;
		    }
			
			System.out.println("coNum"+coNum);
			communityService.increaseLikeCount(coNum);
	}
}



