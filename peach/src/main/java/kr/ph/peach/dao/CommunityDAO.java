package kr.ph.peach.dao;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.MemberVO;

public interface CommunityDAO {

	boolean insertCommunity(@Param("community")CommunityVO community,@Param("user") MemberVO user);

}