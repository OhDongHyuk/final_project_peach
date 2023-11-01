package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.CityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;

public interface ProfileDAO {

	List<SaleBoardVO> getProductsById(@Param("me_num") int me_num, @Param("state")int state);

	List<SaleCategoryVO> getCategoriesByScNum(@Param("sb_sc_num") int sb_sc_num);

	public void profileUpdate(@Param("saleBoardVO") SaleBoardVO saleBoardVO);

	void dateUp(Integer sb_num);

	void deleteBoard(Integer sb_num);

	List<CityVO> selectAllCategory();

	
	/*
	List<MemberVO> selectMemberList(String me_id);
	*/
}