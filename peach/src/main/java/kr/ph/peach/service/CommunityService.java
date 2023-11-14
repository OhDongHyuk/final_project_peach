package kr.ph.peach.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.pagination.CriteriaCom;
import kr.ph.peach.pagination.CriteriaProfile;
import kr.ph.peach.vo.CommunityCategoryVO;
import kr.ph.peach.vo.CommunityImageVO;
import kr.ph.peach.vo.CommunityVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.ReplyVO;

public interface CommunityService {

	boolean insertCommunity(CommunityVO community, MemberVO user, MultipartFile[] fileList, int cc_num);
	
	List<CommunityCategoryVO> selectCCategory();
	
	 int selectCIname(String CICategory);

	List<CommunityVO> getBoardList(CriteriaCom cri);

	String getMeNick(CommunityVO tmp);

	int getTotalCount(CriteriaCom cri);

	CommunityVO selectDetail(int co_num);

	MemberVO selectWriter(CommunityVO detail);

	void insertReply(String re_info, int co_num, MemberVO user);

	List<ReplyVO> selectReply(int co_num);
	//임시
	String getReNick(ReplyVO reply);

	List<CommunityCategoryVO> getCoCategory();

	CommunityImageVO getCoImg(int co_num);

	CommunityCategoryVO selectEditCC(CommunityVO detail);

	boolean updateCommunity(CommunityVO community, int co_num , MultipartFile[] fileList, int cc_num,MemberVO user);

	void updateCoView(int co_num);

	void updateReply(int co_num);

	void increaseLikeCount(int coNum);


}
