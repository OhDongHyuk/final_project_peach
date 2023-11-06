package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ProfileVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;

public interface ProfileDAO {

	List<SaleBoardVO> getProductsById(@Param("me_num") int me_num, @Param("state")int state);

	List<SaleCategoryVO> getCategoriesByScNum(@Param("sb_sc_num") int sb_sc_num);

	public void profileUpdate(@Param("saleBoardVO") SaleBoardVO saleBoardVO);

	void dateUp(Integer sb_num);

	void deleteBoard(Integer sb_num);

	List<CityVO> selectMediumCity(String large);

	List<CityVO> selectSmallCity(String medium);

	List<CityVO> selectLargeCity();

	void updateUserId(MemberVO user);

	void updateUserPw(MemberVO user);

	void updateCity(@Param("user")MemberVO user,@Param("me_ci_num") int me_ci_num);

	void updateText(@Param("user")MemberVO user,@Param("pf_text") String pf_text);

	ProfileVO selectPfText(MemberVO user);

	List<ProfileVO> getPF(MemberVO user);

	void updateText2(@Param("user") MemberVO user,@Param("pf_text") List<ProfileVO> pfList);

	
	/*
	List<MemberVO> selectMemberList(String me_id);
	*/
}