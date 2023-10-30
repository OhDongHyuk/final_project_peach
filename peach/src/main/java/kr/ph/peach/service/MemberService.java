package kr.ph.peach.service;

import java.util.List;

import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.WishVO;

public interface MemberService {

	boolean signup(MemberVO member);

	MemberVO login(MemberVO member);

	void updateMemberSession(MemberVO user);

	MemberVO getMemberBySession(String session_id);

	List<WishVO> getWishList(int me_num);

	
}
