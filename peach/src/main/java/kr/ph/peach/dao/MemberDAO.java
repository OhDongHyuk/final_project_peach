package kr.ph.peach.dao;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("id")String id);

	void updateMemberSession(@Param("user")MemberVO user);

	MemberVO selectMemberBySession(@Param("session_id") String session_id);

}