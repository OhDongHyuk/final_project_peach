package kr.ph.peach.dao;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("id")String id);

	void updateMemberSession(@Param("member")MemberVO user);

	MemberVO selectMemberBySessionId(@Param("session_id")String sId);

}