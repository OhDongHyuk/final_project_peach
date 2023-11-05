package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);

	MemberVO login(MemberVO member);

	void updateMemberSession(MemberVO user);

	MemberVO getMemberbyNumber(int meNum);


}
