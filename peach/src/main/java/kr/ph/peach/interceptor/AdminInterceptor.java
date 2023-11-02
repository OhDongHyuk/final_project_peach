package kr.ph.peach.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ph.peach.vo.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		//세션에 회원 정보가 없으면 메인 페이지로 이동
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		//로그인을 했으면
		if(user == null) {
			
			//메인 페이지로 이동
			response.sendRedirect(request.getContextPath()+"/member/login");
			//기존에 가려던 URL은 방문하지 않고 메인으로 이동
			return false;
		}
		if(user.getMe_au().equals("user")) {
//			String msg = URLEncoder.encode("관리자 로그인 필요","UTF-8");
//			response.sendRedirect(request.getContextPath()+"/?msg=" + msg);
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}
		//로그인 했으면 기존에 가려던 URL을 방문해서 작업 
		return true;
	}
	
}
