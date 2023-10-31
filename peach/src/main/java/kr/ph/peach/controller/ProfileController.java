package kr.ph.peach.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ph.peach.pagination.Criteria;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.ProfileService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;

@Controller
public class ProfileController {
	
	@Autowired
	ProfileService profileService;
	@Autowired
	MemberService memberService;
	
    @GetMapping("/board/profile/{me_num}")
    public String showProfilePage(@PathVariable("me_num") int meNum, Model model, HttpSession session, Criteria cri) {
    	MemberVO user = (MemberVO) session.getAttribute("user");
    	model.addAttribute("user",user);
        /*if (user != null) {*/
    	
            MemberVO member = memberService.getMemberbyNumber(meNum);
        
            List<SaleBoardVO> products = profileService.getProductsById(meNum, 0);
            List<SaleBoardVO> salingProducts = profileService.getProductsById(meNum, 1);
            List<SaleBoardVO> tradingProducts = profileService.getProductsById(meNum, 2);
            List<SaleBoardVO> finishedProducts = profileService.getProductsById(meNum, 3);
            
            model.addAttribute("products",products);
            model.addAttribute("salingProducts",salingProducts);
            model.addAttribute("tradingProducts",tradingProducts);
            model.addAttribute("finishedProducts",finishedProducts);
            model.addAttribute("member",member);
            List<String> saleCategory = new ArrayList<>();

            for (SaleBoardVO product : products) {
                int sb_sc_num = product.getSb_sc_num();
                List<SaleCategoryVO> categories = profileService.getProductsByCTNum(sb_sc_num);
                for (SaleCategoryVO category : categories) {
                    saleCategory.add(category.getSc_name());
                }
            }
            model.addAttribute("saleCategory", saleCategory);
          
       /* } else {
        	model.addAttribute("msg", "로그인을 필요로 합니다.");
        	model.addAttribute("url", "member/login");
        	System.out.println(user);
        	return "/member/message";
        }*/
            /*
	        model.addAttribute("meNum", meNum);
	        */
	        return "/board/profile"; 
	    }

	@ResponseBody
    @PostMapping("/board/dateUp")
    public String dateUp(@RequestParam("sb_num") Integer sb_num) {
    	profileService.dateUp(sb_num);
        return "ok";         
    }       
    @ResponseBody
    @PostMapping("/board/delete")
	public String deletePD(Integer sb_num, Model model) {
		Message msg;
		if(profileService.deletePD(sb_num)) {
			msg = new Message("/board/profile", "게시글을 삭제했습니다.");
		}else {
			msg = new Message("/board/profile", "잘못된 접근입니다.");
		}
		model.addAttribute(msg);
		return "Message";
	}
    @GetMapping("/board/profilePass")
	public String ProfileMNlogin() {
		return "/board/profilePass";
	}
   
    @PostMapping("/board/profilePass")
    public String showProfileMNPage(@RequestParam String Ppassword, Model model, HttpSession session) {
        MemberVO user = (MemberVO) session.getAttribute("user");
        model.addAttribute("user", user);
        
        System.out.println("입력한 비밀번호: " + Ppassword);
        
        if (Ppassword == null) {
            return "/board/profilePass";
        }
        
        String userPassword = user.getMe_pw();
        
        if (Ppassword.equals(userPassword)) {
            return "/board/profileMN";
        } else {
        	
            return "/board/profilePass";
        }
    }
   
    @GetMapping("/board/profileMN")
	public String ProfileMN() {
		
		return "/board/profileMN";
	}
}






