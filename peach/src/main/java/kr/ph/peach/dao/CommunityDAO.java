package kr.ph.peach.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ph.peach.pagination.CriteriaCom;
import kr.ph.peach.pagination.CriteriaProfile;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityImageVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ReplyVO;

public interface CommunityDAO {

	boolean insertCommunity(@Param("community")CommunityVO community,@Param("user") MemberVO user,@Param("cc_num") int cc_num);

	List<CommunityCategoryVO> selectCCategory();

	boolean insertCCnames(@Param("CCNames")String CCNames,@Param("user") MemberVO user);
	
	int selectCICategory(@Param("CICategory")String CICategory);

	void insertCommunityImage(@Param("communityImage")CommunityImageVO communityImageVo);

	List<CommunityVO> selectBoardList(@Param("cri")CriteriaCom cri);

	String selectMeNick(@Param("list")CommunityVO list);

	int selectCountBoardList(@Param("cri")CriteriaCom cri);

	CommunityVO selectDetail(@Param("co_num")int co_num);

	MemberVO selectWriter(@Param("detail")CommunityVO detail);

	void insertReply(@Param("re_info")String re_info,@Param("co_num") int co_num,@Param("user") MemberVO user);

	List<ReplyVO> selectReply(@Param("co_num")int co_num);

	List<MemberVO> selectRe(@Param("reply")List<ReplyVO> reply);

	String selectReNick(ReplyVO reply);


}