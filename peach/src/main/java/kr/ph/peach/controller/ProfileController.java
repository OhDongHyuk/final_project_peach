package kr.ph.peach.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ph.peach.pagination.Criteria;
import kr.ph.peach.service.ProfileService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;

@Controller
public class ProfileController {
	
	@Autowired
	ProfileService profileService;
	
    @GetMapping("/board/profile")
    public String showProfilePage(Model model, HttpSession session, Criteria cri, String me_id) {
    	MemberVO user = (MemberVO) session.getAttribute("user");
    	/*
    	List<MemberVO> fileList = profileService.getMemberList(me_id);
    	*/
    	
        if (user != null) {
            // 모델에 유저 정보 추가
            model.addAttribute("user", user);
            // 모델에 상품 정보 추가
            System.out.println("확인용1");
            // 접속한 아이디에 따른 상품정보 불러오기
            List<SaleBoardVO> products = profileService.getProductsById(user.getMe_num(), 0);
            List<SaleBoardVO> salingProducts = profileService.getProductsById(user.getMe_num(), 1);
            List<SaleBoardVO> tradingProducts = profileService.getProductsById(user.getMe_num(), 2);
            List<SaleBoardVO> finishedProducts = profileService.getProductsById(user.getMe_num(), 3);
            model.addAttribute("products",products);
            model.addAttribute("salingProducts",salingProducts);
            model.addAttribute("tradingProducts",tradingProducts);
            model.addAttribute("finishedProducts",finishedProducts);
            
            List<String> saleCategory = new ArrayList<>();

            for (SaleBoardVO product : products) {
                int sb_sc_num = product.getSb_sc_num();
                System.out.println("ssn 확인용" + sb_sc_num);
                List<SaleCategoryVO> categories = profileService.getProductsByCTNum(sb_sc_num);
                for (SaleCategoryVO category : categories) {
                    saleCategory.add(category.getSc_name());
                }
            }
            System.out.println(saleCategory);
            model.addAttribute("saleCategory", saleCategory);
          
        } else {
        	model.addAttribute("msg", "로그인을 필요로 합니다.");
        	model.addAttribute("url", "member/login");
        	System.out.println(user);
        	return "/member/message";
        }
        
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
    	System.out.println("삭제확인1"+sb_num);
		Message msg;
		if(profileService.deletePD(sb_num)) {
			msg = new Message("/board/profile", "게시글을 삭제했습니다.");
		}else {
			msg = new Message("/board/profile", "잘못된 접근입니다.");
		}
		model.addAttribute(msg);
		return "Message";
	}
    
    @GetMapping("/board/profile_management")
    public String showProfileMangementPage(Model model) {
        return "/board/profile_management"; 
    }
    
    @PostMapping("/board/profile_management")
	public String insertPost(Model model, MemberVO user, HttpSession session) {
    	
		return "/board/profile_management";
	}
}






