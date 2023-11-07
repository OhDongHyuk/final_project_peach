package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.BankVO;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("id")String id);

	void updateMemberSession(@Param("member")MemberVO user);

	MemberVO selectMemberBySessionId(@Param("session_id")String sId);

	List<CityVO> selectLargeCity();

	List<CityVO> selectMediumCity(@Param("large")String large);

	List<CityVO> selectSmallCity(@Param("medium")String medium);
	
	List<BankVO> selectBank();

	MemberVO selectMemberByNickName(@Param("nick")String me_nick);
	
	MemberVO selectMemberByPhoneNum(@Param("phone")String me_phone);
	
	MemberVO selectMemberByAcc(@Param("acc")String me_acc);
	
	MemberVO selectMemberByName(@Param("name")String me_name);
	//---------------------아이디 찾기 -------
	MemberVO memberIdFind(MemberVO member);
}
