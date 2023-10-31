package kr.ph.peach.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ph.peach.pagination.CriteriaProfile;
import kr.ph.peach.service.ProductsService;
import kr.ph.peach.service.ProfileService;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ProductsVO;
import kr.ph.peach.vo.ProfileVO;

@Controller
public class ProfileController {
	
	@Autowired
	ProfileService profileService;
	
	@Autowired
	ProductsService productsService;
	
    @GetMapping("/board/profile")
    public String showProfilePage(Model model, HttpSession session, CriteriaProfile cri) {
    	MemberVO user = (MemberVO) session.getAttribute("user");
    	
        if (user != null) {
            // 모델에 유저 정보 추가
            model.addAttribute("user", user);
            // 모델에 상품 정보 추가
            System.out.println("확인용1");
            // 접속한 아이디에 따른 상품정보 불러오기
            List<ProductsVO> products = productsService.getProductsById(user.getMe_num(), 0);
            List<ProductsVO> salingProducts = productsService.getProductsById(user.getMe_num(), 1);
            List<ProductsVO> tradingProducts = productsService.getProductsById(user.getMe_num(), 2);
            List<ProductsVO> finishedProducts = productsService.getProductsById(user.getMe_num(), 3);
            model.addAttribute("products",products);
            model.addAttribute("salingProducts",salingProducts);
            model.addAttribute("tradingProducts",tradingProducts);
            model.addAttribute("finishedProducts",finishedProducts);
            
            
            /*System.out.println("확인용2");
            List<ProductsVO> ss = new ArrayList<>();
            for (ProductsVO product : products) {
                if (product.getSb_ss_num() == 3) { 
                    ss.add(product);
                }
            }
            List<ProductsVO> ss2 = new ArrayList<>();
            for (ProductsVO product2 : products) {
            	if (product2.getSb_ss_num() == 1 || product2.getSb_ss_num() == 2) {
            		System.out.println("프러덕트2"+product2);
            		ss2.add(product2);
            		System.out.println("에스에스2"+ss2);
            	}
            }
            
            System.out.println("확인용3");
            System.out.println(ss2.size());
            model.addAttribute("ss", ss.size());
            model.addAttribute("ss2", ss2.size());
            model.addAttribute("products", products);
            */
        } else {
        	model.addAttribute("msg", "로그인을 필요로 합니다.");
        	model.addAttribute("url", "member/login");
        	System.out.println(user);
        	return "/member/message";
        }
        
        return "/board/profile"; 
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







