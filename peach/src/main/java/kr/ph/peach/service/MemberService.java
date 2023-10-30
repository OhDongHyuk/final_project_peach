package kr.ph.peach.service;

import kr.ph.peach.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);

	MemberVO login(MemberVO member);

	void updateMemberSession(MemberVO user);

	
}
