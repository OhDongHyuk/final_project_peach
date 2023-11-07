package kr.ph.peach.service;

import java.util.List;


import kr.ph.peach.vo.BankVO;

import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);

	boolean checkId(String id);
	
	boolean checkNick(String nick);
	
	MemberVO login(MemberVO member);

	void updateMemberSession(MemberVO user);
	
	MemberVO getMemberBySessionId(String value);

	List<CityVO> getLargeCity();

	List<CityVO> getMediumCity(String large);


	List<CityVO> getSmall(String medium);
	
	List<BankVO> getBank();

	MemberVO getMemberbyNumber(int meNum);

}
