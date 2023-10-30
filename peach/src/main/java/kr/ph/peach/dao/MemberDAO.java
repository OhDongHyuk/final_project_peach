package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.WishVO;

public interface MemberDAO {

	List<WishVO> getsaleBoardWishList = null;

	boolean insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("id")String id);

	void updateMemberSession(@Param("user")MemberVO user);

	MemberVO selectMemberBySession(@Param("session_id") String session_id);

	List<WishVO> getsaleBoardWishList(@Param("me_num")int me_num);

}