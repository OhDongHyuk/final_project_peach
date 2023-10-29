package kr.ph.peach.controller;

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

import kr.ph.peach.service.MemberService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	@GetMapping("/signup")
	public String signup(Model model) {
		
		model.addAttribute("title", "회원가입");
		return "/member/signup";
	}
	
@PostMapping("/signup")
	public String signupPost(MemberVO member,Model model) {
		
		//서비스에게 회원가입 시켜야 함 => 회원정보를 주면서 => 가입여부를 알려달라고 함
		boolean res = memberService.signup(member);
		if(res) {
			model.addAttribute("msg", "회원가입 성공!");
			model.addAttribute("url", "");
		}else {
			model.addAttribute("msg", "회원가입 실패!");
			model.addAttribute("url", "member/signup");
		}
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
//			user.setAutoLogin(member.isAutoLogin());
		}
		model.addAttribute("user", user);
		model.addAttribute("msg", msg);
		return "message";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, Model model){
		
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
//		user.setMe_session_limit(null);
		memberService.updateMemberSession(user);
		Message msg = new Message("/", null);
		if(user != null) {
			session.removeAttribute("user");
			msg.setMsg("로그아웃에 성공했습니다.");
		}
		model.addAttribute("msg", msg);
		return "message";
	}
	
}