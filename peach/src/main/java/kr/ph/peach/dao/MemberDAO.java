package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("id")String id);

	void updateMemberSession(@Param("member")MemberVO user);

	MemberVO selectMemberBySessionId(@Param("session_id")String sId);

	MemberVO getMemberbyNumber(@Param("meNum")int meNum);

}