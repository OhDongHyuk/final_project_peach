package kr.ph.peach.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ph.peach.pagination.Criteria;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.ProfileService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ProfileImageVO;
import kr.ph.peach.vo.ProfileVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.SaleImageVO;


@Controller
public class ProfileController {
	
	@Autowired
	ProfileService profileService;
	@Autowired
	MemberService memberService;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

    @GetMapping("/board/profile/{me_num}")
    public String showProfilePage(@PathVariable("me_num") int meNum, Model model, HttpSession session, Criteria cri) {
	    	MemberVO user = (MemberVO) session.getAttribute("user");
	    	user.setMe_point(profileService.selectPoint(user.getMe_num()));
	    	model.addAttribute("user",user);
            MemberVO member = memberService.getMemberByNumber(meNum);
            
            List<SaleBoardVO> products = profileService.getProductsById(meNum, 0);
            List<SaleBoardVO> salingProducts = profileService.getProductsById(meNum, 1);
            List<SaleBoardVO> tradingProducts = profileService.getProductsById(meNum, 2);
            List<SaleBoardVO> finishedProducts = profileService.getProductsById(meNum, 3);

            model.addAttribute("products",products);
            model.addAttribute("salingProducts",salingProducts);
            model.addAttribute("tradingProducts",tradingProducts);
            model.addAttribute("finishedProducts",finishedProducts);
            model.addAttribute("member",member);
            List<SaleBoardVO> salingAndTradingProducts = new ArrayList<>();
            salingAndTradingProducts.addAll(salingProducts);
            salingAndTradingProducts.addAll(tradingProducts);
            
            model.addAttribute("salingAndTradingProducts", salingAndTradingProducts);
            

            List<String> saleCategory = new ArrayList<>();

            for (SaleBoardVO product : products) {
                int sb_sc_num = product.getSb_sc_num();
                List<SaleCategoryVO> categories = profileService.getProductsByCTNum(sb_sc_num);
                for (SaleCategoryVO category : categories) {
                    saleCategory.add(category.getSc_name());
                }
            }
            model.addAttribute("saleCategory", saleCategory);
          
            ProfileVO profile = profileService.getPfText(user);
            System.out.println("profile"+profile);
            model.addAttribute("profile", profile);
            
          //유저 넘버로 프로파일(VO) 가져오기
    		ProfileVO profile2 = profileService.selectProfile(meNum);
    		
    		//프로파일 넘버로 프로파일 이미지 가져오기
    		ProfileImageVO proImg = profileService.selectImg(profile2.getPf_num());
    		model.addAttribute("proImg", proImg);
            
    	
    		int me_num = member.getMe_num();
    		//구매완료 내역
    		List<String> meNumBuy = profileService.selectBuy(me_num);
    		model.addAttribute("meNumBuy", meNumBuy);
    		//판매완료 내역
    		List<String> meNumSel = profileService.selectSel(me_num);
    		model.addAttribute("meNumSel", meNumSel);
    		
    		List<String> proceeding = profileService.selectProceeding(me_num);
    		model.addAttribute("proceeding", proceeding);
    		
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
	public String ProfileMNlogin(Model model, HttpSession session, String pi_num) {
    	System.out.println("Pass1"+pi_num);
    	
    	MemberVO user = (MemberVO) session.getAttribute("user");
        model.addAttribute("user", user);
        model.addAttribute("pi_num", pi_num);
        Message msg;
    	
    	  if(user == null) {
          	msg = new Message("/member/login", "잘못된 접근입니다.");
          	model.addAttribute("msg", msg);
      		return "message";
          }
		return "/board/profilePass";
	}

    @PostMapping("/board/profilePass")
    public String showProfileMNPage(@RequestParam String Ppassword, Model model, HttpSession session, String pi_num) {
    	System.out.println("Pass2"+pi_num);
    	
    	MemberVO user = (MemberVO) session.getAttribute("user");
        model.addAttribute("user", user);
        Message msg;

        System.out.println("입력한 비밀번호: " + Ppassword);
        
        if (Ppassword == null) {
            return "/board/profilePass";
        }
        
        String userPassword = user.getMe_pw();
        
        if (passwordEncoder.matches(Ppassword,userPassword)) {
        	msg = new Message("/board/profileMN?pi_num="+pi_num, "비밀번호 확인되었습니다");
        	model.addAttribute("msg", msg);
        	return "message";
        } else {
        	msg = new Message("/board/profilePass", "비밀번호 불일치");
        	model.addAttribute("msg", msg);
    		return "message";
        }

    }
 
    @GetMapping("/board/profileMN")
	public String profileMNInsert(Model model, HttpSession session, SaleBoardVO saleBoard, String pi_num) {
    	System.out.println("MN"+pi_num);
    	
    	MemberVO user = (MemberVO) session.getAttribute("user");
    	model.addAttribute("user",user);
    	
    	model.addAttribute("pi_num", pi_num);
    	
    	List<CityVO> list = profileService.getLargeCity();
    	model.addAttribute("large", list);
    	

		Message msg;
		if(user == null) {
    		msg = new Message("/member/login", "잘못된 접근입니다.");
          	model.addAttribute("msg", msg);
      		return "message";
    	}
		ProfileImageVO OriFile = profileService.selectOriFile(user);
		if(OriFile != null) {
		String OriFileName = OriFile.getPi_name();
		
		model.addAttribute("OriFileName", OriFileName);
		}
		return "/board/profileMN";
	}
	@PostMapping("/board/profileMN")
	public String insertPost(Model model, HttpSession session, MultipartFile[] files, MultipartFile Original,@RequestParam("me_nick") String me_nick, 
			@RequestParam("me_pw") String me_pw, @RequestParam("me_ci_num")int me_ci_num, @RequestParam("pf_text")String pf_text, @RequestParam("me_pwr") String me_pwr) {
		Message msg;
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(me_ci_num != 0) {
		profileService.updateCity(user, me_ci_num);		
		}
		//영문,숫자,특수문자로 이루어지고 8~20자 
		String pwRegex = "^[a-zA-Z0-9!@#$%^&*()_+|~]{8,20}$";
		
		user.setMe_nick(me_nick);
		if(!me_pw.equals("")) {
			if(!Pattern.matches(pwRegex, me_pw)){
				msg = new Message("/board/profileMN", "비밀번호는 영문,숫자,특수문자를 사용하여 8~20자이내에 작성해야합니다.");
				model.addAttribute("msg", msg);
				return "message";
			} 
			if(me_pw.equals(me_pwr)) {
				String encPw = passwordEncoder.encode(me_pw);
				user.setMe_pw(encPw);
			}else {
				msg = new Message("/board/profileMN", "비밀번호와 비밀번호 확인의 값이 일치해야 합니다.");
				model.addAttribute("msg", msg);
				return "message";
			}
		} 

		System.out.println(pf_text);
		
		List<ProfileVO> pfList = profileService.getPF(user);	
    	model.addAttribute("pfList", pfList);
		
		if(!pf_text.equals("")) {
			profileService.updateText(user, pf_text);
		}
		System.out.println("@@@@@@@"+Original);
		if(profileService.updateProfile(user, files, Original)) {
			msg = new Message("/board/profile/"+user.getMe_num(), "개인 프로필 정보 수정 성공.");
		} else {
			msg = new Message("/board/profileMN", "개인 프로필 정보 수정 실패.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
	@ResponseBody
	@PostMapping("/board/medium")
	public List<CityVO> medium(@RequestParam("large") String large){
		
		List<CityVO> res= profileService.getMediumCity(large);
		
		return res;
	}
	@ResponseBody
	@PostMapping("/board/small")
	public List<CityVO> small(@RequestParam("medium") String medium){
		
		List<CityVO> res= profileService.getSmall(medium);
		
		return res;
	}
	 @GetMapping("/board/profilePay")
		public String profilePay(Model model, HttpSession session) {
		 MemberVO user = (MemberVO) session.getAttribute("user");
	     model.addAttribute("user",user);
	     
	     MemberVO member = profileService.getAccount(user);
	     System.out.println("member"+ member);
	     model.addAttribute("member", member);
	     
	     
		 if(user == null) {
				return "/member/login";
			} else {
				return "/board/profilePay";
			}
	 }
	 @PostMapping("/board/profilePay")
	 	public String profileWithdraw(@RequestParam("me_point")int me_point, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		 Message msg;
		 MemberVO user = (MemberVO) session.getAttribute("user");
		 
		 int userMoney = user.getMe_point();
		 int WMoney = me_point;
		 
		 model.addAttribute("userMoney", userMoney);
		 model.addAttribute("WMoney", WMoney);
		 
		 int PPoint = userMoney-WMoney;
		 System.out.println("PPoint"+PPoint);
		 
		 if(profileService.updateWithdraw(PPoint, user)) {
				msg = new Message("/board/profile/"+ user.getMe_num(), "출금 성공.");
			} else {
				msg = new Message("/board/profilePay", "출금 실패.");
			}
			model.addAttribute("msg", msg);
			return "message";
	 }
}
