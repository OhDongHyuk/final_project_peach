package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.MemberVO;

public interface CommunityDAO {

	boolean insertCommunity(@Param("community")CommunityVO community,@Param("user") MemberVO user,@Param("cc_num") int cc_num);

	List<CommunityCategoryVO> selectCCategory();

	boolean insertCCnames(@Param("CCNames")String CCNames,@Param("user") MemberVO user);
	
	int selectCICategory(@Param("CICategory")String CICategory);

}