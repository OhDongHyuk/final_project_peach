package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.pagination.MemberCriteria;
import kr.ph.peach.vo.BankVO;
import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.StatementVO;
import kr.ph.peach.vo.WishVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("id")String id);

	void updateMemberSession(@Param("user")MemberVO user);

	MemberVO selectMemberBySessionId(@Param("session_id")String sId);

	List<CityVO> selectLargeCity();

	List<CityVO> selectMediumCity(@Param("large")String large);

	List<CityVO> selectSmallCity(@Param("medium")String medium);

	List<BankVO> selectBank();

	//---------------------아이디 찾기 -------


	void addPoints(@Param("me_num")int me_num, @Param("paidAmount")int paidAmount);

	MemberVO getMemberById(@Param("me_num")int me_num);

	MemberVO selectMemberByNickName(@Param("nick")String me_nick);

	MemberVO selectMemberByPhoneNum(@Param("phone")String me_phone);

	MemberVO selectMemberByAcc(@Param("acc")String me_acc);

	MemberVO getMemberByNumber(@Param("meNum")int meNum);

	MemberVO selectMemberByName(@Param("name")String me_name);
	//---------------------아이디 찾기 -------
	MemberVO memberIdFind(MemberVO member);

	MemberVO selectMemberBySession(@Param("session_id")String session_id);

	List<WishVO> getsaleBoardWishList(@Param("me_num")int me_num);

	List<MemberVO> getMemberList(@Param("cri")MemberCriteria cri);

	int getTotalCount(@Param("cri")MemberCriteria cri);

	List<StatementVO> selectMemberTypeList();

	boolean updateState(@Param("me_num")int me_num, @Param("me_st_num")int me_st_num);

	boolean deleteMember(@Param("member")MemberVO member);

	MemberVO selectMemberID(@Param("kakaoname")String kakaoname);

	boolean insertMemberForKakao(@Param("member")MemberVO member);

	CityVO selectCity(@Param("me_ci_num")int me_ci_num);

	void insertAuthCode(@Param("au_num")int me_num,@Param("au_code") int num);

	int checkcode(@Param("code")String code, @Param("num")int num);
	//-----------------------------------------------------------
	int pwUpdate(@Param("code") String code, @Param("hashedPw") String hashedPw);

	MemberVO getMemberByCode(@Param("code")String code);

	void deleteCode(@Param("member")MemberVO member);

	List<MemberVO> getMemberLists();

	void addPointHistory(@Param("me_num")int me_num, @Param("paidAmount")int paidAmount);

	void reducePointHistory(@Param("me_num")int me_num, @Param("pp_point")int pp_point);

	void deleteReducePointHistory(@Param("tq_num")int tq_num);

	void withdrawPointHistory(@Param("me_num")int me_num, @Param("wMoney")int wMoney);

}