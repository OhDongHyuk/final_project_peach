package kr.ph.peach.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ph.peach.service.ChatService;
import kr.ph.peach.service.MemberService;
import kr.ph.peach.service.ProfileService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.BankVO;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProfileService profileService;

	@GetMapping("/signup")
	public String signup(Model model) {
		//시도를 가져오라고 요청
		List<CityVO> list = memberService.getLargeCity();
		model.addAttribute("title", "회원가입");
		model.addAttribute("large", list);
		List<BankVO> bankList = memberService.getBank();
		model.addAttribute("bankList", bankList);
		return "/member/signup";
	}
	
	@PostMapping("/signup")
	public String signupPost(MemberVO member,Model model) {
		System.out.println(member);
		
		MemberVO dbMemberByPhone = memberService.selectMemberByPhoneNum(member.getMe_phone());
        if (dbMemberByPhone != null) {
            model.addAttribute("msg", "핸드폰 번호가 이미 존재합니다.");
            model.addAttribute("url", "/member/signup");
            return "main/message";
        }

       
        MemberVO dbMemberByAcc = memberService.selectMemberByAcc(member.getMe_acc());
        if (dbMemberByAcc != null) {
            model.addAttribute("msg", "계좌 번호가 이미 존재합니다.");
            model.addAttribute("url", "/member/signup");
            return "main/message";
        }
		
		//서비스에게 회원가입 시켜야 함 => 회원정보를 주면서 => 가입여부를 알려달라고 함
		boolean res = memberService.signup(member);
		if(res) {
			model.addAttribute("msg", "회원가입 성공!");
			model.addAttribute("url", "member/login");
		}else {
			model.addAttribute("msg", "회원가입 실패!");
			model.addAttribute("url", "member/signup");
		}
		profileService.addProfileNum(member.getMe_num());
		return "/main/message";
	}

	@GetMapping("/login")
	public String login() {
		
		return "/member/login";
	}
	@PostMapping("/login")
	public String loginPost(MemberVO member, Model model) {
		
		Message msg = new Message("/member/login", "로그인에 실패했습니다.");
		//DB에서 로그인 정보를 이용하여 가져온 회원정보. 자동로그인 여부가 없음
		MemberVO user = memberService.login(member);
		if(user != null) {
			msg = new Message("", "로그인에 성공했습니다.");
			//화면에서 선택/미선택한 자동로그인 여부를 user에 저장해서 인터셉터에게 전달 
			user.setAutoLogin(member.isAutoLogin());
		}
		model.addAttribute("user", user);
		model.addAttribute("msg", msg);
		return "message";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, Model model){
		
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		user.setMe_session_limit(null);
		memberService.updateMemberSession(user);
		Message msg = new Message("/", null);
		if(user != null) {
			session.removeAttribute("user");
			msg.setMsg("로그아웃에 성공했습니다.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
	@ResponseBody
	@PostMapping("/id/check")
	public boolean idCheck(@RequestParam("id") String id){
		System.out.println(id);
		boolean res= memberService.checkId(id);
		System.out.println(res);
		return res;
	}
	
	@ResponseBody
	@PostMapping("/phone")
	public boolean phone(@RequestParam("phone") String phone){
		MemberVO dbMemberByPhone = memberService.selectMemberByPhoneNum(phone);
        return dbMemberByPhone == null;
	}
	
	@ResponseBody
	@PostMapping("/acc")
	public boolean acc(@RequestParam("acc") String acc){
		MemberVO dbMemberByAcc = memberService.selectMemberByAcc(acc);
        return dbMemberByAcc == null;
	}
	
	@ResponseBody
	@PostMapping("/nick/check")
	public boolean nickCheck(@RequestParam("nick") String nick){
		System.out.println(nick);
		boolean res= memberService.checkNick(nick);
		System.out.println(res);
		return res;
	}
	
	@ResponseBody
	@PostMapping("/medium")
	public List<CityVO> medium(@RequestParam("large") String large){
		
		List<CityVO> res= memberService.getMediumCity(large);
		
		return res;
	}
	
	@ResponseBody
	@PostMapping("/small")
	public List<CityVO> small(@RequestParam("medium") String medium){
		
		List<CityVO> res= memberService.getSmall(medium);
		
		return res;
	}
	
	//----------------------아이디 찾기---------------------------------
	@GetMapping("/find_id")
	public String find_id(HttpServletRequest request, Model model,
	        MemberVO member) {
	    
	    
	    return "/member/find_id";
	}
	
	@RequestMapping(value = "/find_result_id")
	public String find_result_id(HttpServletRequest request, Model model,  MemberVO member) {
	 
	 
	try {
	    
	    MemberVO memberFind = memberService.memberIdFind(member);
	    
	    model.addAttribute("member", memberFind);
	 
	} catch (Exception e) {
	    System.out.println(e.toString());
	    model.addAttribute("msg", "오류가 발생되었습니다.");
	}
	 
	return "/member/find_result_id";
	}
	
	//---------------------------비번 찾기--------------------------------
	
	@RequestMapping(value = "/pw_auth.me")
	public String pw_auth(Model model,String me_id, String me_name) throws IOException {

		Message msg = new Message("/", "비밀번호를 이메일로 전송했습니다.");
		if(!memberService.sendPw(me_id,me_name)) {
			msg = new Message("/member/pw_find", "정보를 잘못입력했습니다.");
		}
		
		model.addAttribute("msg", msg);
		return "message";
		
	}
	@GetMapping("/pw_find")
	public String pw_find() {
	    
	    
	    return "/member/pw_find";
	}
	
	
}